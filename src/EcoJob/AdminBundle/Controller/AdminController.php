<?php

namespace EcoJob\AdminBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use EcoJob\UserBundle\Repository\CandidatRepository;
use \EcoJob\RecruteurBundle\Entity\ContratCategorie;
use EcoJob\UserBundle\Entity\User;
use EcoJob\RecruteurBundle\Entity\Offre;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use EcoJob\RecruteurBundle\Form\OffreAType;
class AdminController extends Controller {

    public function indexAction() {
        $this->getNumbers();
        return $this->render('EcoJobAdminBundle:Admin:index.html.twig');
    }

    public function expriredOffreAction() {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $offres = $em->getRepository('EcoJobRecruteurBundle:Offre')->getExpiredNow();
        return $this->render('EcoJobAdminBundle:Admin:suspendu.html.twig', array(
                    'offres' => $offres
        ));
    }

    public function offreCategorieAction(Request $request) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $categories = $em->getRepository('EcoJobRecruteurBundle:ContratCategorie')->findAll();

        $categorie = new ContratCategorie();
        $formBuilder = $this->createFormBuilder($categorie);
        $formBuilder->add('designation', 'text');
        $form = $formBuilder->getForm();
        if ($request->getMethod() == 'POST') {
            $form->bind($request);
            if ($form->isValid()) {
                $em->persist($categorie);
                $em->flush();
                return $this->redirect($this->generateUrl('eco_job_admin_offres_categorie'));
            }
        }

        return $this->render('EcoJobAdminBundle:Admin:offreCategorie.html.twig', array(
                    'categories' => $categories,
                    'form' => $form->createView()
        ));
    }

    public function suspendreOffreAction(Offre $offre) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $offre->setSuspendu(true);
        $offre->setSuspenduAt(new \DateTime());
        $em->flush();
        return $this->redirectToRoute('eco_job_admin_offres_expirer');
    }

    public function suspendreAllOffreAction() {
        $this->getNumbers();
        $suspendre_offre = $this->get('eco_job_admin.suspendre_offre');
        $suspendre_offre->run();
        return $this->redirectToRoute('eco_job_admin_offres_expirer');
    }

    public function republierAction(Offre $offre , $nbjour) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $offre->setSuspendu(false);
        
        //$interval = str_replace("+", "",$offre->getValidAt()->diff(new \DateTime())->format("%R%a")) + 1;
        //$nbjour += $interval + 1;
        $offre->setExpireAt($nbjour);
        $offre->setValidAt(new \DateTime());
        $offre->setSuspenduAt(null);
        $em->flush();
        return $this->redirectToRoute('eco_job_admin_recruteur_offre', array('id' => $offre->getId()));
    }

    public function getUsersAction(Request $request) {
        $this->getNumbers();
        return $this->render('EcoJobAdminBundle:Admin:users.html.twig');
    }
    public function getNewCandidatAction(Request $request){
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();
            $candidats = $em->getRepository('EcoJobUserBundle:User')->getNewlyCandidat();    
            $serializer = $this->container->get('jms_serializer');
            $res = $serializer->serialize($candidats, 'json');
            return new Response($res);            
        }
    }
    public function getNewRecruteurAction(Request $request){
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();
            $recruteurs = $em->getRepository('EcoJobUserBundle:User')->getNewlyRecruteur();    
            $serializer = $this->container->get('jms_serializer');
            $res = $serializer->serialize($recruteurs, 'json');
            return new Response($res);            
        }
    }    
    public function showCVAction(User $user) {
        $this->getNumbers();
        $cv = $user->getCurriculum();
        return $this->render('EcoJobAdminBundle:Candidat:cv.html.twig', array('cv' => $cv));
    }

    public function showOffresAction(User $user) {
        $this->getNumbers();
        $offres = $user->getOffres();
        return $this->render('EcoJobAdminBundle:Recruteur:offres.html.twig', array('offres' => $offres));
    }

    public function showOffreAction(Offre $offre) {
        $this->getNumbers();
        return $this->render('EcoJobAdminBundle:Recruteur:offre.html.twig', array('offre' => $offre));
    }

    public function deleteAction(User $user) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $em->remove($user);
        $em->flush();
        return $this->redirectToRoute('eco_job_admin_users');
    }

    public function deleteCategorieAction(ContratCategorie $categorie) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $em->remove($categorie);
        $em->flush();
        return $this->redirect($this->generateUrl('eco_job_admin_offres_categorie'));
    }

    public function deleteOffreAction(offre $offre, Request $request) {
        $this->getNumbers();
        $id = $offre->getRecruteur()->getId();
        $em = $this->getDoctrine()->getEntityManager();
        $em->remove($offre);
        $em->flush();
        return $this->redirect($this->generateUrl('eco_job_admin_recruteur_offres', array('id' => $id)));
    }

    public function valideOffreAction(offre $offre, Request $request) {
        $this->getNumbers();
        $id = $offre->getRecruteur()->getId();
        $em = $this->getDoctrine()->getEntityManager();
        $offre->setValid(true);
        $offre->setValidAt(new \DateTime());
        $em->persist($offre);
        $em->flush();

        // Send alert mail

        $alert_mail = $this->get('eco_job_candidat.alert_mail');
        $alert_mail->run($offre->getId());
        return $this->redirect($this->generateUrl('eco_job_admin_offres', array('id' => $id)));
    }

    public function valideEditOffreAction(offre $offre, Request $request) {
        $this->getNumbers();
        $id = $offre->getRecruteur()->getId();
        $em = $this->getDoctrine()->getEntityManager();
        
        $interval = $offre->getValidAt()->diff($offre->getSuspenduAt());
        $reste = abs( $offre->getExpireAt() - $interval->days);
        
        $offre->setExpireAt($reste)
              ->setValidAt(new \DateTime())
              ->setValid(true)
              ->setModificationValided(true)
              ->setSuspenduAt(null);
        $em->persist($offre);
        $em->flush();


        return $this->redirect($this->generateUrl('eco_job_admin_offres_edited'));
    }

    public function getOffreNewsAction() {
        $this->getNumbers();
        $em = $this->getDoctrine()->getEntityManager();
        $offres = $em->getRepository('EcoJobRecruteurBundle:Offre')->getNonValideOffers();
        return $this->render('EcoJobAdminBundle:Admin:offres.html.twig', array('offres' => $offres));
    }
    
    public function getOffreSuspenduAction(){
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $offres = $em->getRepository('EcoJobRecruteurBundle:Offre')->getSuspendedOffres();
        return $this->render('EcoJobAdminBundle:Admin:suspendu.html.twig', array(
                    'offres' => $offres
        ));
    }

    public function getOffreEditedAction() {
        $this->getNumbers();
        $em = $this->getDoctrine()->getEntityManager();
        $offres = $em->getRepository('EcoJobRecruteurBundle:Offre')->findByModificationValided(false);
        return $this->render('EcoJobAdminBundle:Admin:offres_edited.html.twig', array('offres' => $offres));
    }

    public function getOffreAllAction(Request $request) {
        $this->getNumbers();
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $offres = $em->getRepository('EcoJobRecruteurBundle:Offre')->findCustomOffre();
            $serializer = $this->container->get('jms_serializer');
            $res = $serializer->serialize($offres, 'json');
            return new Response($res);
        }
        return $this->render('EcoJobAdminBundle:Admin:offre_without_ex.html.twig');
    }

    public function usersAction(Request $request) {
        $this->getNumbers();
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $users = $em->getRepository('EcoJobUserBundle:User')->findAll();
            $serializer = $this->container->get('jms_serializer');
            $res = $serializer->serialize($users, 'json');
            return new Response($res);
        }
        return $this->render('EcoJobAdminBundle:Admin:users_dash.html.twig');
    }

    public function supprAction(Request $request, User $user) {
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $em->remove($user);
            $em->flush();
            $response = new JsonResponse();
            $response->setStatusCode(200);
            $response->setData(array(
                'successMessage' => "Deleted"));
            return $response;
        }
    }

    public function deleteOffreAjaxAction(Request $request, Offre $offre) {
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $em->remove($offre);
            $em->flush();
            $response = new JsonResponse();
            $response->setStatusCode(200);
            $response->setData(array(
                'successMessage' => "Deleted"));
            return $response;
        }
    }

    public function showuserAction(Request $request, User $user) {
        $this->getNumbers();
        return $this->render('EcoJobAdminBundle:Admin:showuser.html.twig', array('user' => $user));
    }

    protected function getNumbers() {
        $em = $this->getDoctrine()->getEntityManager();
        $newUsers = count($em->getRepository('EcoJobUserBundle:User')->getNewlyCandidat()) + count($em->getRepository('EcoJobUserBundle:User')->getNewlyRecruteur());
        $repo = $em->getRepository("EcoJobUserBundle:User");
        $qb = $repo->createQueryBuilder('u');
        $qb->select('COUNT(u)');
        $count_users = $qb->getQuery()->getSingleScalarResult();
        $repo = $em->getRepository("EcoJobRecruteurBundle:Offre");
        $qb = $repo->createQueryBuilder('o');
        $qb->select('COUNT(o)');
        $count_offres = $qb->getQuery()->getSingleScalarResult();
        $suspendu = count($em->getRepository('EcoJobRecruteurBundle:Offre')->getSuspendedOffres());
        $expired = count($em->getRepository('EcoJobRecruteurBundle:Offre')->getExpiredNow());
        $modified = count($em->getRepository('EcoJobRecruteurBundle:Offre')->findByModificationValided(false));
        $notvalided = count($em->getRepository('EcoJobRecruteurBundle:Offre')->findByValid(false));
        $this->get('session')->set('newUsers', $newUsers);
        $this->get('session')->set('users', $count_users);
        $this->get('session')->set('offres', $count_offres);
        $this->get('session')->set('expired', $expired);
        $this->get('session')->set('modified', $modified);
        $this->get('session')->set('notvalided', $notvalided);
        $this->get('session')->set('suspendu', $suspendu);
        
        return true;
    }
    public function recruteursAction(Request $request) {
        $this->getNumbers();
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $users = $em->getRepository('EcoJobUserBundle:User')->findByType(2);
            $serializer = $this->container->get('jms_serializer');
            $res = $serializer->serialize($users, 'json');
            return new Response($res);
        }
        return $this->render('EcoJobAdminBundle:Admin:recruteur_dash.html.twig');
    }
    public function validBCVAction(Request $request, User $user){
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $user->setCanConsultCV(true);
            $em->persist($user);
            $em->flush();
            $response = new JsonResponse();
            $response->setStatusCode(200);
            $response->setData(array(
                'successMessage' => "Modified"));
            return $response;
        }        
    }
    public function revokeBCVAction(Request $request, User $user){
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getEntityManager();
            $user->setCanConsultCV(false);
            $em->persist($user);
            $em->flush();
            $response = new JsonResponse();
            $response->setStatusCode(200);
            $response->setData(array(
                'successMessage' => "Modified_revoke"));
            return $response;
        }        
    }    
    public function addReferenceAction(Request $request, Offre $offre){
        $this->getNumbers();
        $form = $this->createForm(new OffreAType(), $offre);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getEntityManager();
                $em->persist($offre);
                $em->flush();
                return $this->redirect($this->generateUrl('eco_job_admin_offres'));
            }
        }
        return $this->render('EcoJobAdminBundle:Admin:edit_offre.html.twig', array('form' => $form->createView()));        
    }
}
