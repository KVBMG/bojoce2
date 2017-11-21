<?php

namespace EcoJob\AnonymousBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use EcoJob\RecruteurBundle\Entity\Offre;

class DefaultController extends Controller
{

    public function mapAction()
    {
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("",0,-2,0,0,10);
        if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $mines = $this->getUser()->getPostuled();
            for ($i = 0; $i < count($mines); $i++) {
                if (($key = array_search($mines[$i], $results, TRUE)) !== FALSE) {
                    $results[$key]->setAdded(true);
                }
            }
        }
        return $this->render('EcoJobAnonymousBundle:Default:map.html.twig', array('offres' => $results));
    }

    public function searchAjaxTemplatedAction(Request $request)
    {
        $keywords = $request->request->get('keywords');
        $contrat = $request->request->get('contrat');
        $datePublication = $request->request->get('datePublication');
        $secteur = $request->request->get('secteur');
        $offset = $request->request->get('offset');
        $limit = $request->request->get('limit');
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search($keywords, $contrat, $datePublication,$secteur, $offset, $limit);
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

    public function searchAjaxAction(Request $request)
    {
        $keywords = $request->request->get('keywords');
        $contrat = $request->request->get('contrat');
        $experience = $request->request->get('experience');
        $offset = $request->request->get('offset');
        $limit = $request->request->get('limit');
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search($keywords, $contrat, $experience, $offset, $limit);
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

    public function searchAction(Request $request)
    {
        $keywords = $request->request->get('keywords');
        $contrat = $request->request->get('contrat');
        $experience = $request->request->get('experience');

        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search($keywords, $contrat, $experience);
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

    public function doSearchAction()
    {
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("",0,-2,0,0,10);
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
            'offres' => $results, 'added' => $results,'contrats' => $contrats,'secteurs' => $secteurs));
    }

    public function showOffreAction(Offre $offre)
    {
        return $this->render('EcoJobAnonymousBundle:Default:offre.html.twig', array('offre' => $offre));
    }

    public function detailsOffreAction(Offre $offre)
    {
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
        $html = $this->renderView('EcoJobAnonymousBundle:Default:details.html.twig', array('offre' => $offre, 'postuled' => $postuled));
        $serializer = $this->container->get('jms_serializer');
        $response = new Response(json_encode(array("html" => $html, 'id' => $offre->getId(), 'titre' => $offre->getTitre(), 'lat' => $offre->getLatitude(), 'long' => $offre->getLongitude())));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function getAllJsonAction()
    {
        $serializer = $this->container->get('jms_serializer');
        $em = $this->getDoctrine()->getManager();
        $results = $em->getRepository('EcoJobRecruteurBundle:Offre')->search("",0,-2,0,0,10);
        $res = $serializer->serialize($offres, 'json');
        return new Response($res);
    }

    private function unsetValue(array $array, $value, $strict = TRUE)
    {
        if (($key = array_search($value, $array, $strict)) !== FALSE) {
            $results[$key]->setAdded(true);
        }
        return $array;
    }

    public function integraliteOffreAction(Offre $offre)
    {
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
        return $this->render('EcoJobAnonymousBundle:Default:integralite_offre.html.twig', array('offre' => $offre,
            'postuled' => $postuled,
            'saved' => $saved
        ));
    }

}
