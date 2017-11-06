<?php

namespace EcoJob\CandidatBundle\Controller;

use Elastica\Exception\NotFoundException;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use EcoJob\CandidatBundle\Entity\AlertMail;

class AlertMailController extends Controller {

    public function addAction(Request $request){
        $response = new JsonResponse();
        $data = array();

        if ($this->isGranted('IS_AUTHENTICATED_REMEMBERED')){
            $user = $this->getUser();
            $em = $this->getDoctrine()->getManager();

            $keywords = trim($request->get('keywords'));
            $contrat = trim($request->get('contrat'));
            $experience = trim($request->get('experience'));

            $keywords = str_replace('|', ' ', $keywords);

            $criter = sprintf('%1$s|%2$s|%3$s', $keywords, $contrat, $experience);

            if($criter != "||") {
                $alertRepository = $em->getRepository('EcoJobCandidatBundle:AlertMail');
                $resultat = $alertRepository->findOneBy(array('criter' => $criter, 'user' => $user));

                // verifier si n'existe pas déjà, si non ajouter
                if (!$resultat) {
                    $alert = new AlertMail();
                    $alert->setUser($user);
                    $alert->setCriter($criter);
                    $em->persist($alert);
                    $em->flush();

                    $data['text'] = 'Critère de recherche enregistré!';
                }
                else {
                    $data['text'] = 'Critère de recherche éxistant!';
                }
            }
            else{
                $data['text'] = 'Completer les critères de recherche!';
            }
        }
        else{
            $data['text'] = 'Connecter vous pour recevoir des mails!';
        }

        return $response->setData($data);
    }

    public function showAction(){
        $user = $this->getUser();
        $em = $this->getDoctrine()->getManager();
        $alerts_result = $user->getAlertMails();

        $alerts = array();

        foreach ($alerts_result as $alert) {
            $alert_ = array();
            $explode_alert = explode('|',$alert->getCriter());

            $alert_['id'] = $alert->getId();
            $alert_['criter'] = $explode_alert[0] != '' ? $explode_alert[0] : "n/a";
            $alert_['experience'] = intval($explode_alert[2]);
            $alert_['experience'] = $alert_['experience'] <= 1 ? $alert_['experience'] == 0 ? "Tous" : $alert_['experience']. " an" : $alert_['experience']." ans";

            $contrat = $em->getRepository('EcoJobRecruteurBundle:ContratType')->find(intval($explode_alert[1]));
            $alert_['contrat'] = $contrat ? $contrat->getLibelle() : "Tous";

            $alerts[] = $alert_;
        }

        return $this->render('EcoJobCandidatBundle:AlertMail:show.html.twig', array(
            "alerts" => $alerts,
        ));
    }

    public function deleteAction($id){
        $em = $this->getDoctrine()->getManager();
        $alertRepository = $em->getRepository('EcoJobCandidatBundle:AlertMail');
        $alert = $alertRepository->find($id);

        if (!$alert){
            throw new NotFoundException("Alerte mail inéxistante!");
        }

        $em->remove($alert);
        $em->flush();

        return $this->redirectToRoute('eco_job_candidat_alert_mail_show');
    }

    public function deleteAllAction(){
        $em = $this->getDoctrine()->getManager();
        $alerts = $user = $this->getUser()->getAlertMails();

        foreach ($alerts as $alert) {
            $em->remove($alert);
        }
        $em->flush();

        return $this->redirectToRoute('eco_job_candidat_alert_mail_show');
    }
}
