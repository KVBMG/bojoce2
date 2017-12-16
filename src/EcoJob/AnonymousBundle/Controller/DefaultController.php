<?php

namespace EcoJob\AnonymousBundle\Controller;

use EcoJob\CandidatBundle\Entity\Candidature;
use EcoJob\CandidatBundle\Form\CandidatureType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use EcoJob\RecruteurBundle\Entity\Offre;
use Symfony\Component\Security\Acl\Exception\Exception;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;

class DefaultController extends Controller {

    public function mapAction() {
        $em = $this->getDoctrine()->getManager();      
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("", 0, -2, 0, 0, 20,"");
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            $added = [];
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        $contrats = $em->getRepository('EcoJobRecruteurBundle:ContratType')->findAll();
        $secteurs = $em->getRepository('EcoJobRecruteurBundle:ContratCategorie')->findAll();
        return $this->render('EcoJobAnonymousBundle:Default:map.html.twig', array(
                    'offres' => $results, 'added' => $results, 'contrats' => $contrats, 'secteurs' => $secteurs));
    }

    /**
     * @Cache(expires="tomorrow", public=true,smaxage="15")
     */
    public function searchAjaxTemplatedAction(Request $request) {
        $keywords = $request->request->get('keywords');
        $avantages = $request->request->get('avantages');
        $localisation = $request->request->get('localisation');
        $contrat = $request->request->get('contrat');
        
        $datePublication = $request->request->get('datePublication');
        $secteur = $request->request->get('secteur');
        $offset = $request->request->get('offset');
        $limit = $request->request->get('limit');
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search($keywords, $contrat, $datePublication, $secteur, $offset, $limit,$localisation);
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        $res = $serializer->serialize($results, 'json');
        $html = $this->renderView('EcoJobAnonymousBundle:Default:result.html.twig', array(
            'offres' => $results));
        $response = new Response(json_encode(array("html" => $html, "objects" => $res, 'total' => count($results))));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function searchAjaxAction(Request $request) {
        $keywords = $request->request->get('keywords');
        $contrat = $request->request->get('contrat');
        $experience = $request->request->get('experience');
        $offset = $request->request->get('offset');
        $limit = $request->request->get('limit');
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
     
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("", 0, -2, 0, 0, 20,"");
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        $res = $serializer->serialize($results, 'json');
        return new Response($res);
    }

    public function searchAction(Request $request) {
        $keywords = $request->request->get('keywords');
        $contrat = $request->request->get('contrat');
        $experience = $request->request->get('experience');

        $em = $this->getDoctrine()->getManager();       
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("", 0, -2, 0, 0, 20,"");
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        $html = $this->renderView('EcoJobAnonymousBundle:Default:result.html.twig', array(
            'offres' => $results));
        $response = new Response(json_encode(array("html" => $html)));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function doSearchAction() {
        $em = $this->getDoctrine()->getManager();      
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("", 0, -2, 0, 0, 20,"");
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            $added = [];
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        $contrats = $em->getRepository('EcoJobRecruteurBundle:ContratType')->findAll();
        $secteurs = $em->getRepository('EcoJobRecruteurBundle:ContratCategorie')->findAll();
        return $this->render('EcoJobAnonymousBundle:Default:search.html.twig', array(
                    'offres' => $results, 'added' => $results, 'contrats' => $contrats, 'secteurs' => $secteurs));
    }


    /**
     * @Cache(expires="tomorrow", public=true,smaxage="15")
     */
    public function showOffreAction(Offre $offre) {
        return $this->render('EcoJobAnonymousBundle:Default:offre.html.twig', array('offre' => $offre));
    }

    public function detailsOffreAction(Offre $offre, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $postuled = false;
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {

            $mines = $this->getUser()->getPostuled();
            for ($i = 0; $i < count($mines); $i++) {
                if ($mines[$i]->getId() == $offre->getId()) {
                    $offre->setAdded(true);
                    break;
                }
            }
            $user = $this->getUser();
            $postuled = $em->getRepository('EcoJobCandidatBundle:Candidature')->isPostuled($offre->getId(), $user->getId());
        }
        $candidature = new Candidature();
        $form = $this->createForm(new CandidatureType(), $candidature, array('action' => $this->generateUrl('eco_job_anonymous_offre_details', array('id' => $offre->getId())), 'method' => 'POST', 'attr' => array('id'=> 'candidatureForm')));
        $form->bind($request, $candidature);
        
        $candidatureT = new \EcoJob\CandidatBundle\Entity\CandidatureT();
        $tform = $this->createForm(new \EcoJob\CandidatBundle\Form\CandidatureTType(), $candidatureT
                , array('action' => $this->generateUrl('eco_job_candidat_trad_post',array('id' => $offre->getId())),'user' => $this->getUser(), 'attr' => array('id'=> 'candidatureFormT')));
        
        if ($request->isXmlHttpRequest() && $request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $candidature->setCandidat($this->getUser());
                $candidature->setOffre($offre);
                $candidature->setRecruteur($offre->getRecruteur());
                if ($request->request->get('externalFile') != "on") {
                    $candidature->setCvFile(null);
                }
                if ($request->request->get('attach') == "on") {
                    $candidature->setJoinMyCv(true);
                }
                try {
                    $this->notifyByMail($candidature);
                } catch (Exception $e) {
                    return new Response(json_encode(['data' => 'Erreur lors de l\'établissement de la connection']), 500);
                }
                $em->persist($candidature);
                $em->flush();
                return new Response(json_encode(['data' => 'Candidature envoyée']));
            } else {
                return new JsonResponse(['data' => 'Candidature non envoyée']);
            }
        }

        $html = $this->renderView('EcoJobAnonymousBundle:Default:details.html.twig', array('offre' => $offre,'tform'=>$tform->createView(), 'postuled' => $postuled, 'form' => $form->createView()));

        $list = $this->renderView('EcoJobAnonymousBundle:Default:one.html.twig', array('offre' => $offre));
        
        $serializer = $this->container->get('jms_serializer');
        $response = new Response(json_encode(array("html" => $html,"list"=>$list, 'id'=> $offre->getId(), 'titre' => $offre->getTitre(), 'lat' => $offre->getLatitude(), 'long' => $offre->getLongitude())));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function notifyByMail($candidature) {
        $alert_mail = $this->get('eco_job_candidat.alert_mail');
        $recruteur = $candidature->getOffre()->getRecruteur();
        $mail_content = array();
        $mail_content['titre_offre'] = $candidature->getOffre()->getTitre();
        $mail_content['id_offre'] = $candidature->getOffre()->getId();
        $mail_content['recruteur_username'] = $recruteur->getUsername();
        $mail_content['candidat_username'] = $candidature->getCandidat()->getUsername();

        $content = $alert_mail->generateContentBeta($mail_content);

        $mail = new \EcoJob\CandidatBundle\Model\Mail();
        $mail->setReceiver($recruteur);
        $mail->setSubject('Un candidat vient de postuler sur l\'offre : ' . $mail_content['titre_offre']);
        $mail->setContent($content);
        $alert_mail->sendMail($mail, true);
    }

    public function sendToFriendAction(Request $request) {
        if ($request->isXmlHttpRequest() && $request->isMethod("POST")) {
            $id = $request->request->get('offreId');
            $body = $this->renderView('EcoJobAnonymousBundle:AlertMail:alertMail.html.twig', array('id' => $id, 'contenu' => $request->request->get('friendContent')));
            $message = \Swift_Message::newInstance()
                    ->setSubject('Eco-Job-Fr')
                    ->setFrom($this->container->getParameter('mailer_user'))
                    ->setTo($request->request->get('friendEmail'))
                    ->setBody($body, 'text/html');
            try {
                $this->get('mailer')->send($message);
                return new JsonResponse(['data' => 'Offre partagé']);
            } catch (Exception $e) {
                return new JsonResponse(['data' => 'Echec lors de l\'envoie, veuillez contacter l\'administrateur du site.'], 500);
            }
        }
    }
    /**
     * @Cache(expires="tomorrow", public=true,smaxage="15")
     */
    public function getAllJsonAction() {
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("", 0, -2, 0, 0, 20,"");
        $res = $serializer->serialize($offres, 'json');
        return new Response($res);
    }

    private function unsetValue(array $array, $value, $strict = TRUE) {
        if (($key = array_search($value, $array, $strict)) !== FALSE) {
            $results[$key]->setAdded(true);
        }
        return $array;
    }

    /**
     * @Cache(expires="tomorrow", public=true,smaxage="15")
     */
    public function integraliteOffreAction(Offre $offre, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $securityContext = $this->container->get('security.authorization_checker');
        $postuled = false;
        $saved = false;
        if ($securityContext->isGranted('IS_AUTHENTICATED_FULLY')) {
            $user = $this->getUser();
            $saved = $user->getPostuled();
            $saved = (in_array($offre, $saved)) ? true : false; // pour dire que
            $postuled = $em->getRepository('EcoJobCandidatBundle:Candidature')->isPostuled($offre->getId(), $user->getId());
        }

        $candidature = new Candidature();
        $form = $this->createForm(new CandidatureType(), $candidature, array('action' => $this->generateUrl('eco_job_anonymous_offre_details', array('id' => $offre->getId())), 'method' => 'POST', 'attr' => array('id'=> 'candidatureForm')));
        $form->bind($request, $candidature);
        
        $candidatureT = new \EcoJob\CandidatBundle\Entity\CandidatureT();
        $tform = $this->createForm(new \EcoJob\CandidatBundle\Form\CandidatureTType(), $candidatureT
                , array('action' => $this->generateUrl('eco_job_candidat_trad_post',array('id' => $offre->getId())),'user' => $this->getUser(), 'attr' => array('id' => 'candidatureFormT')));
              
        
        if ($request->isXmlHttpRequest() && $request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $candidature->setCandidat($this->getUser());
                $candidature->setOffre($offre);
                $candidature->setRecruteur($offre->getRecruteur());
                if ($request->request->get('externalFile') != "on") {
                    $candidature->setCvFile(null);
                }
                if ($request->request->get('attach') == "on") {
                    $candidature->setJoinMyCv(true);
                }
                try {
                    $this->notifyByMail($candidature);
                } catch (Exception $e) {
                    return new Response(json_encode(['data' => 'Erreur lors de l\'établissement de la connection']), 500);
                }
                $em->persist($candidature);
                $em->flush();
                return new Response(json_encode(['data' => 'Candidature envoyée']));
            } else {
                return new JsonResponse(['data' => 'Candidature non envoyée']);
            }
        }

        return $this->render('EcoJobAnonymousBundle:Default:integralite_offre.html.twig', array(
                    'offre' => $offre,
                    'postuled' => $postuled,
                    'saved' => $saved,
                    'form' => $form->createView(),
                    'tform' => $tform->createView(),
        ));
    }

}
