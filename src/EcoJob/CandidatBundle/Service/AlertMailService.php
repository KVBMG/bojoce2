<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of AlertMail
 *
 * @author nooms
 */
namespace EcoJob\CandidatBundle\Service;
use Doctrine\ORM\EntityManager;

use Symfony\Component\DependencyInjection\ContainerInterface;



class AlertMailService {
    
    private $em;
    private $mailer;
    private $container;
    
    public function __call($nom , $args){
        switch ($nom) {
            case "run" : {
               if(count($args) == 1) {
                   $this->runOne($args[0]);
               }else{
                   $this->runAll();
               }
            }
            
        }
        
    }
    
    public function __construct(EntityManager $em, \Swift_Mailer $mailer , ContainerInterface $container) {
        $this->em = $em;
        $this->mailer = $mailer;
        $this->container = $container;
    
    }
    
    // Tous les offres valider hier
    
    public function runAll(){
        
        $list_categorie = $this->em->getRepository('EcoJobRecruteurBundle:ContratCategorie')->getNewOfferCategorie();
        foreach ($list_categorie as $categorie) {
            $list_offre =  $this->em->getRepository('EcoJobRecruteurBundle:Offre')->getCreatedHier($categorie->getId());
            $list_candidat = $this->em->getRepository('EcoJobUserBundle:User')->getByCategorieOffres($categorie->getId());
            foreach ($list_candidat as $candidat) {
                $content =  $this->generateContent($list_offre, $candidat);
                $mail = new \EcoJob\CandidatBundle\Model\Mail();
                $mail->setReceiver($candidat);
                $mail->setSubject("Eco-Job | Des nouveaux offres pour vous");
                $mail->setContent($content);
                $this->sendMail($mail , true);
            }
        }
        
    }
    
    // Un offre valide
    
    public function runOne($id_offre){
        
        $offre =  $this->em->getRepository('EcoJobRecruteurBundle:Offre')->find($id_offre);
        $list_candidat = $this->em->getRepository('EcoJobUserBundle:User')->getByCategorieOffres($offre->getCategorie()->getId()); 
        
        foreach ($list_candidat as $candidat) {
            $content =  $this->generateContent(array($offre), $candidat);
            $mail = new \EcoJob\CandidatBundle\Model\Mail();
            $mail->setReceiver($candidat);
            $mail->setSubject("Eco-Job | Des nouveaux offres pour vous");
            $mail->setContent($content);
            $this->sendMail($mail , true);
        }
        
    }
    
    private function generateContent($list_offre , $candidat){
        $prenom = $candidat->getUserName();
        $body = $this->container->get('templating')->render('EcoJobCandidatBundle:AlertMail/Mail:alertMail.html.twig', array(
            'prenom' => $prenom,
            'offres' => $list_offre,
        ));
        return $body;
    }

    public function generateContentBeta($mail_content) {
        $body = $this->container
            ->get('templating')
            ->render('EcoJobCandidatBundle:AlertMail/Mail:alertCandidature.html.twig', array(
            'recruteur' => $mail_content['recruteur_username'],
            'offre' => $mail_content['titre_offre'],
            'offreId' => $mail_content['id_offre'],
            'candidat' => $mail_content['candidat_username']
        ));
        return $body;
    }
    
     function sendMail(\EcoJob\CandidatBundle\Model\Mail $mail , $single_mail = false){
         $message = \Swift_Message::newInstance();
         $message
            ->setSubject($mail->getSubject())
            ->setFrom(array("postmaster@eco-job.fr" => 'Alert Eco-Job'))
            ->setTo($mail->getReceiver()->getEmail())
            ->setCharset('utf-8')
            ->setContentType('text/html')
            ->setBody($mail->getContent());
    
         $mailer = $this->mailer;
         $mailer->send($message);
         if($single_mail == false) {
             $spool = $mailer->getTransport()->getSpool();
             $transport = $this->container->get('swiftmailer.transport.real');
             $spool->flushQueue($transport);
         }
      
    }

}
