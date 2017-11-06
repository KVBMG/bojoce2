<?php

namespace EcoJob\CandidatBundle\Controller;

use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use EcoJob\CandidatBundle\AlertMailService\EcoJobAlertMail;
use EcoJob\CandidatBundle\Entity\Candidature;
use EcoJob\UserBundle\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\DependencyInjection\Exception\BadMethodCallException;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use EcoJob\CandidatBundle\Entity\CuVi;
use EcoJob\CandidatBundle\Form\CuViType;
use EcoJob\CandidatBundle\Entity\CVFile;
use EcoJob\CandidatBundle\Form\CVFileType;
use Symfony\Component\HttpFoundation\Response;
use EcoJob\RecruteurBundle\Entity\Offre;
use Symfony\Component\Security\Acl\Exception\Exception;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ArrayDenormalizer;
use Symfony\Component\Serializer\Normalizer\GetSetMethodNormalizer;
use Symfony\Component\Serializer\Serializer;
use \EcoJob\CandidatBundle\Entity\ParamCandidat;
use \EcoJob\CandidatBundle\Form\ParametreType;

class CandidatController extends Controller {

    public function indexAction() {
        $this->getNumbers();
        return $this->render('EcoJobCandidatBundle:Candidat:index.html.twig');
    }

    public function alertMailAction() {
        $request = $this->getRequest();
        $response = new Response();
        $key = $request->query->get('key');
        if ($key == $this->container->getParameter('secret')) {
            $alert_mail = $this->get('eco_job_candidat.alert_mail');
            $alert_mail->run();
            $response->setStatusCode(200);
        } else {
            $response->setStatusCode(403);
        }
        return $response;
    }

    public function ParamAction(Request $request) {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $param = $em->getRepository('EcoJobCandidatBundle:ParamCandidat')->findBy(array('candidat' => $this->getUser()->getId()));

        $form = $this->createForm(new ParametreType($param));
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $contrat_categories = $form->getData()['categorie']->toArray();
            foreach ($param as $p) {
                $em->remove($p);
            }
            foreach ($contrat_categories as $c) {
                $param = new ParamCandidat();
                $param->setCandidat($this->getUser());
                $param->setCategorie($c);
                $em->persist($param);
            }

            $em->flush();
            return $this->redirect($this->generateUrl('eco_job_candidat_param'));
        }

        return $this->render('EcoJobCandidatBundle:Candidat:param.html.twig', array(
                    'form' => $form->createView(),
        ));
    }

    public function ResetParamAction() {
        $this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $param = $em->getRepository('EcoJobCandidatBundle:ParamCandidat')->findBy(array('candidat' => $this->getUser()->getId()));
        foreach ($param as $p) {
            $em->remove($p);
        }
        $em->flush();
        return $this->redirect($this->generateUrl('eco_job_candidat_reset_param'));
    }

    public function fillAction(Request $request) {
        $this->getNumbers();

        $cv = new Cuvi();
        $em = $this->getDoctrine()->getManager();
        $param = $em->getRepository('EcoJobCandidatBundle:ParamCandidat')->findBy(array('candidat' => $this->getUser()->getId()));
        $form = $this->createForm(new CuViType($param), $cv);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getEntityManager();
                $cv->setShowable(true);
                $em->persist($cv);
                $curcv = $this->getUser()->getCurriculum();
                if ($curcv != NULL) {
                    $em->remove($curcv);
                }
                $this->getUser()->setCurriculum($cv);
                $em->flush();
                return $this->redirect($this->generateUrl('eco_job_candidat_cv_show')
                );
            }
        }
        return $this->render('EcoJobCandidatBundle:Candidat:fill.html.twig', array(
                    'form' => $form->createView(),
        ));
    }

    public function ShowAction(Request $request) {
        $this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        if ($cv != null) {
            return $this->render('EcoJobCandidatBundle:Candidat:show.html.twig', array(
                        'cv' => $cv,
            ));
        } else {
            return $this->redirectToRoute('eco_job_candidat_cv_fill');
        }
    }

    public function EditAction(Request $request) {
        $this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        if ($cv != null) {
            if ($request->getMethod() == 'POST') {
                $form = $this->createForm(new CuViType, $cv);
                $form->handleRequest($request);
                if ($form->isValid()) {
                    $em = $this->getDoctrine()->getManager();
                    $em->persist($cv);
                    $em->flush();
                    return $this->redirect($this->generateUrl('eco_job_candidat_cv_show')
                    );
                }
            }
            $em = $this->getDoctrine()->getManager();
            $param = $em->getRepository('EcoJobCandidatBundle:ParamCandidat')->findBy(array('candidat' => $this->getUser()->getId()));
            $form = $this->createForm(new CuViType($param), $cv);
            return $this->render('EcoJobCandidatBundle:Candidat:edit.html.twig', array(
                        'form' => $form->createView(),
            ));
        } else {
            return $this->redirectToRoute('eco_job_candidat_cv_fill');
        }
    }

    public function DeleteAction(Request $request) {
        $this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        if ($request->getMethod() == 'GET') {
            $em = $this->getDoctrine()->getManager();
            $this->getUser()->setCurriculum(null);
            $em->remove($cv);
            $em->flush();
            return $this->redirect($this->generateUrl('eco_job_candidat_cv_show'));
        }
        return $this->redirect($this->generateUrl('eco_job_candidat_cv_show'));
    }

    public function saveAction(Offre $offre, Request $request) {
        $this->getNumbers();

        $em = $this->getDoctrine()->getManager();
        $this->getUser()->addPostuled($offre);
        $em->flush();
        $offres = $this->getUser()->getPostuled();
        return $this->render('EcoJobCandidatBundle:Candidat:myoffres.html.twig', array('offres' => $offres));
    }

    public function saveAsyncAction(Offre $offre, Request $request) {
        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();
            $this->getUser()->addPostuled($offre);
            $em->flush();
            $count = count($this->getUser()->getPostuled());

            return new JsonResponse([
                "saved" => $count,
            ]);
        }
    }

    public function showOffreAction(Offre $offre) {
        $this->getNumbers();

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
        return $this->render('EcoJobCandidatBundle:Candidat:offre.html.twig', array('offre' => $offre,
                    'postuled' => $postuled,
                    'saved' => $saved
        ));
    }

    public function deleteOffreAction(Offre $offre, Request $request) {
        $this->getNumbers();

        $this->getUser()->removePostuled($offre);
        $em = $this->getDoctrine()->getManager();
        $em->flush();
        $offres = $this->getUser()->getPostuled();
        $this->get('session')->getFlashBag()->add('success', 'Offre supprimée');
        return $this->render('EcoJobCandidatBundle:Candidat:myoffres.html.twig', array('offres' => $offres));
    }

    public function myOffresAction(Request $request) {
        $this->getNumbers();

        $offres = $this->getUser()->getPostuled();
        return $this->render('EcoJobCandidatBundle:Candidat:myoffres.html.twig', array('offres' => $offres));
    }

    private function unsetValue(array $array, $value, $strict = TRUE) {
        if (($key = array_search($value, $array, $strict)) !== FALSE) {
            $results[$key]->setAdded(true);
        }
        return $array;
    }

    public function detailsOffre2Action(Offre $offre) {
        $this->getNumbers();

        return $this->render('EcoJobCandidatBundle:Candidat:details2.html.twig', array('offre' => $offre));
    }

    public function uploadCVAction(Request $request) {
        $this->getNumbers();

        $cvfile = new CVFile();
        $form = $this->createForm(CVFileType::class, $cvfile);
        $form->handleRequest($request);

        if (($request->getMethod() == 'POST') && ($form->isValid())) {
            $this->getUser()->setCvFile($cvfile);
            $em = $this->getDoctrine()->getManager();
            $em->persist($cvfile);
            $em->flush();
            return $this->redirectToRoute('eco_job_candidat_cv_show');
        }
        return $this->render('EcoJobCandidatBundle:Candidat:uploadcv.html.twig', array(
                    'form' => $form->createView(),
        ));
    }

    public function postulerOffreAction(Offre $offre, Request $request) {

        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $response = new JsonResponse();
        try {
            $motivation = $request->request->get('motivation');
            $candidature = new Candidature($offre, $user, $motivation);
            $candidature->setRecruteur($offre->getRecruteur());
            //$this->getUser()->addPostuled($offre); // pour dire que l'offre a été sauveguardé en même temps

            $this->notifyByMail($candidature);

            $em->persist($candidature);
            $em->flush();
            $postResult = $this->isPostuled($offre->getId(), $user->getId());
            $response->setStatusCode(200);
            $response->setData(["message" => "Candidature envoyé", "postule" => $postResult]);
        } catch (UniqueConstraintViolationException $exception) {
            $response->setStatusCode(500);
            $postResult = $this->isPostuled($offre->getId(), $user->getId());
            $response->setData(["message" => $exception->getMessage(), "postule" => $postResult]);
        }
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

    public function cancelPosulationAction(Candidature $candidature, Request $request) {
        $this->getNumbers();

        $em = $this->getDoctrine()->getManager();
        $em->remove($candidature);
        $em->flush();
        return $this->redirectToRoute('eco_job_candidat_postuled_offres');
    }

    public function isPostuled($offre_id, $user_id) {
        $em = $this->getDoctrine()->getManager();
        $isPostuled = $em->getRepository('EcoJobCandidatBundle:Candidature')->isPostuled($offre_id, $user_id);
        return $isPostuled;
    }

    public function postuledOffresAction(Request $request) {
        $this->getNumbers();

        $em = $this->getDoctrine()->getManager();
        $candidatures = $this->getUser()->getCandidatures();
        return $this->render('EcoJobCandidatBundle:Candidat:mycandidatures.html.twig', array('candidatures' => $candidatures));
    }

    public function gererCVAction(Request $request) {
        $this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        return $this->render('EcoJobCandidatBundle:Candidat:show.html.twig', array(
                    'cv' => $cv,
        ));
    }

    public function stopAction(CuVi $cv, Request $request) {
        if ($cv->getShowable()) {
            $cv->setShowable(false);
        } else {
            $cv->setShowable(true);
        }
        $em = $this->getDoctrine()->getManager();
        $em->persist($cv);
        $em->flush();
        return $this->redirect($this->generateUrl('eco_job_candidat_cv_show'));
    }

    protected function getNumbers() {
        $em = $this->getDoctrine()->getEntityManager();
        $saved = count($this->getUser()->getPostuled());
        $postuled = count($this->getUser()->getCandidatures());

        $this->get('session')->set('saved', $saved);
        $this->get('session')->set('postuled', $postuled);
        return true;
    }

}
