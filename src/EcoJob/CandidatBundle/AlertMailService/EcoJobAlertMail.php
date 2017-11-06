<?php

namespace EcoJob\CandidatBundle\AlertMailService;


use Doctrine\ORM\EntityManager;
use EcoJob\CandidatBundle\Entity\AlertMail;
use EcoJob\RecruteurBundle\Entity\Offre;
use Symfony\Component\DependencyInjection\ContainerInterface;

class EcoJobAlertMail
{
    protected $em;
    protected $container;

    public function __construct(EntityManager $entityManager, ContainerInterface $container)
    {
        $this->em = $entityManager;
        $this->container = $container;
    }

    function sendAllAlertMail(){
        $alerts = $this->em->getRepository('EcoJobCandidatBundle:AlertMail')->findAll();

        foreach ($alerts as $alert) {
            $offres = $this->searchOffresFromAlert($alert);
            if($offres) {
                $this->sendMailALert($alert, $offres);
            }
        }
        return "alerts envoyé";
    }

    function sendAlertMailFromOffre($offre_id){
        $offreRepository = $this->em->getRepository('EcoJobRecruteurBundle:Offre');

        $offre = $offreRepository->find($offre_id);

        if ($offre){
            $alerts = $this->searchAlertsFromOffre($offre);
            foreach ($alerts as $alert) {
                $offres = $this->searchOffresFromAlert($alert);
                if($offres) {
                    $this->sendMailALert($alert, $offres);
                }
            }
            return "alerts envoyé";
        }
        return "offre inexistante";
    }

    public function commandSendAlertMailFromOffre($offre_id){
        $command = 'php ../app/console alertMail:send '.$offre_id;
        if (substr(php_uname(), 0, 7) == "Windows"){
            pclose(popen("start /B ". $command, "r"));
        }
        else {
            exec($command . " > /dev/null &");
        }

        return 'ok';
    }

    function searchAlertsFromOffre(Offre $offre){
        $titres = explode(' ', $offre->getTitre());
        $contenues = explode(' ', $offre->getContenu());

        $alerts = array();
        $alertRepository = $this->em->getRepository('EcoJobCandidatBundle:AlertMail');

        if(trim($offre->getTitre())) {
            foreach ($titres as $titre) {
                $titre = str_replace('|', ' ', $titre);
                $alert_titres = $alertRepository->getAlerts($titre);
                if ($alert_titres) {
                    $alerts = array_merge($alerts, $alert_titres);
                }
            }
        }

        if(trim($offre->getContenu())) {
            foreach ($contenues as $contenue) {
                $contenue = str_replace('|', ' ', $contenue);
                $alert_contenues = $alertRepository->getAlerts($contenue);
                if ($alert_contenues) {
                    $alerts = array_merge_recursive($alerts,
                        array_filter($alert_contenues, function ($var) use ($alerts) {
                            return !in_array($var, $alerts);
                        })
                    );
                }
            }
        }

        if($offre->getContrat() && $offre->getExperience()) {
            $contrat_exp = sprintf('|%1$s|%2$s', $offre->getContrat()->getId(), $offre->getExperience());
            $alert_cont_exp = $alertRepository->getAlerts($contrat_exp);
            if ($alert_cont_exp) {
                $alerts = array_merge_recursive($alerts,
                    array_filter($alert_cont_exp, function ($var) use ($alerts) {
                        return !in_array($var, $alerts);
                    })
                );
            }
        }

        $criter_tout = '|0|0';
        $alert_tout = $alertRepository->getAlerts($criter_tout);
        if ($alert_tout){
            $alerts = array_merge_recursive($alerts,
                array_filter($alert_tout, function($var) use ($alerts){
                    return !in_array($var, $alerts);
                })
            );
        }

        // envoi Mail parrapport aux alerts obtenues
        return $alerts;
    }

    function searchOffresFromAlert(AlertMail $alert){
        $offresRepository = $this->em->getRepository('EcoJobRecruteurBundle:Offre');
        $criter = explode('|', $alert->getCriter());
        $offres = $offresRepository->search($criter[0], $criter[1], $criter[2]);

        return $offres;
    }

    function sendMailALert(AlertMail $alert, $offres){
        $prenom = $alert->getUser()->getCurriculum() != null ? $alert->getUser()->getCurriculum()->getPrenom() : null;
        $prenom = $prenom != null ? $prenom : "Utilisateur Eco-Job";

        $sujet = explode('|', $alert->getCriter());

        $subject = sprintf('Alert Mail pour %1$s , contrat %2$s, expérience %3$s', $sujet[0], $sujet[1], $sujet[2]);
        $from = array($this->container->getParameter('mailer_user') => 'Alert Eco-Job');
        $to = $alert->getUser()->getEmailCanonical();
        $body = $this->container->get('templating')->render('EcoJobCandidatBundle:AlertMail/Mail:alertMail.html.twig', array(
            'prenom' => $prenom,
            'offres' => $offres,
        ));

        $this->sendMail($subject, $from, $to, $body);
    }

    function sendMail($subject, $from, $to, $body){
        $message = \Swift_Message::newInstance();
        
        $message->setSubject($subject)
            ->setFrom($from)
            ->setTo($to)
            ->setCharset('utf-8')
            ->setContentType('text/html')
            ->setBody($body);
        $this->container->get('mailer')->send($message);
    }
}