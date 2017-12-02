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
use EcoJob\CandidatBundle\Form\FormationType;
use EcoJob\CandidatBundle\Form\ExperienceType;
use EcoJob\CandidatBundle\Form\LangueType;
use EcoJob\CandidatBundle\Form\EtatCivilType;
use EcoJob\CandidatBundle\Form\CompetenceType;
use EcoJob\CandidatBundle\Entity\Formation;
use EcoJob\CandidatBundle\Entity\Experience;
use EcoJob\CandidatBundle\Entity\Langue;
use EcoJob\CandidatBundle\Entity\EtatCivil;
use EcoJob\CandidatBundle\Entity\Competence;
use EcoJob\UserBundle\Entity\Image;
use EcoJob\UserBundle\Form\ImageType;
use FOS\MessageBundle\Model\MessageInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Cache;

/**
 * @Cache(expires="tomorrow", public=true,smaxage="15")
 */
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
        //$this->getNumbers();
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
        //$this->getNumbers();
        $em = $this->getDoctrine()->getManager();
        $param = $em->getRepository('EcoJobCandidatBundle:ParamCandidat')->findBy(array('candidat' => $this->getUser()->getId()));
        foreach ($param as $p) {
            $em->remove($p);
        }
        $em->flush();
        return $this->redirect($this->generateUrl('eco_job_candidat_param'));
    }

    public function fillAction(Request $request) {
        //$this->getNumbers();
        $em = $this->getDoctrine()->getManager();

        if ($this->getUser()->getCurriculum() != NULL) {
            $cv = $this->getUser()->getCurriculum();
            $em->remove($cv);
        }

        $cv = new CuVi();
        $this->getUser()->setCurriculum($cv);
        $em->persist($cv);
        $em->flush();

        $cvfile = new CVFile();
        $competence = new Competence();
        $etatcivil = new EtatCivil();
        $experience = new Experience();
        $formation = new Formation();
        $langue = new Langue();
        $image = new Image();

        $cvfileForm = $this->createForm(new CVFileType, $cvfile);
        $competenceForm = $this->createForm(new CompetenceType, $competence);
        $etatcivilForm = $this->createForm(new EtatCivilType, $etatcivil);
        $experienceForm = $this->createForm(new ExperienceType, $experience);
        $formationForm = $this->createForm(new FormationType, $formation);
        $langueForm = $this->createForm(new LangueType, $langue);
        $imageForm = $this->createForm(new ImageType, $image);

        $response = $this->render('EcoJobCandidatBundle:Candidat:fill.html.twig', array(
                    'cvfileForm' => $cvfileForm->createView(),
                    'competenceForm' => $competenceForm->createView(),
                    'etatcivilForm' => $etatcivilForm->createView(),
                    'experienceForm' => $experienceForm->createView(),
                    'formationForm' => $formationForm->createView(),
                    'langueForm' => $langueForm->createView(),
                    'imageForm' => $imageForm->createView(),
                    'cv' => $this->getUser()->getCurriculum()
        ));
    $response->setSharedMaxAge(3600);

    // (optional) set a custom Cache-Control directive
    $response->headers->addCacheControlDirective('must-revalidate', true);

    return $response;
    }

    public function ShowAction(Request $request) {
        //$this->getNumbers();

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
        //$this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        $em = $this->getDoctrine()->getManager();
        $cv->setCreatedAt(new \DateTime());
        $em->persist($cv);
        $em->flush();
        $cvfile = $cv->getCvFile();
        if ($cvfile == NULL) {
            $cvfile = new CVFile();
        }
        $etatcivil = $cv->getEtatCivil();
        $image = $cv->getImage();
        if ($image == NULL) {
            $image = new Image();
        }

        $competences = $cv->getCompetences();
        $experiences = $cv->getExperiences();
        $formations = $cv->getFormations();
        $langues = $cv->getLangues();

        $experience = new Experience();
        $formation = new Formation();
        $langue = new Langue();
        $competence = new Competence();

        $cvfileForm = $this->createForm(new CVFileType, $cvfile);
        $competenceForm = $this->createForm(new CompetenceType, $competence);
        $etatcivilForm = $this->createForm(new EtatCivilType, $etatcivil);
        $experienceForm = $this->createForm(new ExperienceType, $experience);
        $formationForm = $this->createForm(new FormationType, $formation);
        $langueForm = $this->createForm(new LangueType, $langue);
        $imageForm = $this->createForm(new ImageType, $image);

        $response = $this->render('EcoJobCandidatBundle:Candidat:edit.html.twig', array(
                    'cvfileForm' => $cvfileForm->createView(),
                    'competenceForm' => $competenceForm->createView(),
                    'etatcivilForm' => $etatcivilForm->createView(),
                    'experienceForm' => $experienceForm->createView(),
                    'formationForm' => $formationForm->createView(),
                    'langueForm' => $langueForm->createView(),
                    'imageForm' => $imageForm->createView(),
                    'langues' => $langues,
                    'formations' => $formations,
                    'experiences' => $experiences,
                    'image' => $image,
                    'competences' => $competences,
                    'cvFile' => $cvfile
        ));
    $response->setSharedMaxAge(3600);

    // (optional) set a custom Cache-Control directive
    $response->headers->addCacheControlDirective('must-revalidate', true);

    return $response;
    }

    public function DeleteAction(Request $request) {
        //$this->getNumbers();

        $cv = $this->getUser()->getCurriculum();
        if ($request->getMethod() == 'GET') {
            $em = $this->getDoctrine()->getManager();
            $this->getUser()->setCurriculum(null);
            $em->remove($cv);
            $em->flush();
            return $this->redirect($this->generateUrl('eco_job_candidat_index'));
        }
        return $this->redirect($this->generateUrl('eco_job_candidat_cv_show'));
    }

    public function saveAction(Offre $offre, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $this->getUser()->addPostuled($offre);
        $em->flush();
        $offres = $this->getUser()->getPostuled();
        $this->getNumbers();
        
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
        //$this->getNumbers();

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
        $em = $this->getDoctrine()->getManager();
        $this->getUser()->removePostuled($offre);
        $em->persist($this->getUser());
        $em->flush();
        $offres = $this->getUser()->getPostuled();
        $this->get('session')->getFlashBag()->add('success', 'Offre supprimée');
        $this->getNumbers();
        
        return $this->render('EcoJobCandidatBundle:Candidat:myoffres.html.twig', array('offres' => $offres));
    }

    public function myOffresAction(Request $request) {
        //$this->getNumbers();

        $offres = $this->getUser()->getPostuled();

        $candidatures = $this->getDoctrine()->getManager()->getRepository('EcoJobCandidatBundle:Candidature')
                ->findBy(array('candidat' => $this->getUser()));
        $postuled = [];
        foreach ($candidatures as $c){
            $postuled[] = $c->getOffre();
        }
        if ($candidatures != NULL) {
            for ($i = 0; $i < count($offres); $i++) {
                if (($key = array_search($offres[$i], $postuled, TRUE)) !== FALSE) {
                    $offres[$i]->setAdded(true);
                }
            }
        }
        return $this->render('EcoJobCandidatBundle:Candidat:myoffres.html.twig', array('offres' => $offres));
    }

    private function unsetValue(array $array, $value, $strict = TRUE) {
        if (($key = array_search($value, $array, $strict)) !== FALSE) {
            $results[$key]->setAdded(true);
        }
        return $array;
    }

    public function detailsOffre2Action(Offre $offre) {
        //$this->getNumbers();

        return $this->render('EcoJobCandidatBundle:Candidat:details2.html.twig', array('offre' => $offre));
    }

    public function uploadCVAction(Request $request) {
        //$this->getNumbers();

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
        //$this->getNumbers();

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
        
        $provider = $this->get('fos_message.provider');
        $unreadMsg = $provider->getNbUnreadMessages();
        
        $this->get('session')->set('unread',$unreadMsg);
        $this->get('session')->set('saved', $saved);
        $this->get('session')->set('postuled', $postuled);
        return true;
    }

    public function addPhotoAction(Request $request) {
        if ($request->getMethod() == 'POST') {
            $image = new Image();
            $form = $this->createForm(new ImageType(), $image);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                if ($this->getUser()->getCurriculum()->getImage() != NULL) {
                    $curr_image = $this->getUser()->getCurriculum()->getImage();
                    $this->getUser()->getCurriculum()->setImage($image);
                    $em->remove($curr_image);
                    $em->flush();
                }
                $this->getUser()->getCurriculum()->setImage($image);
                $em->persist($this->getUser());
                $em->persist($image);
                $em->flush();
                $response = new Response(json_encode(array("url" => $image->getImageName())));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addPhoto.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, "error" => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
    }

    public function addEtAction(Request $request) {
        if ($request->getMethod() == 'POST') {
            $et = new EtatCivil();
            $form = $this->createForm(new EtatCivilType(), $et);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $this->getUser()->getCurriculum()->setEtatCivil($et);
                $em->persist($et);
                $em->flush();
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addEtatCivil.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addEtatCivil.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
    }

    public function addCVFileAction(Request $request) {
        if ($request->getMethod() == 'POST') {
            $cvFile = new CVFile();
            $form = $this->createForm(new CVFileType(), $cvFile);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                if ($this->getUser()->getCurriculum()->getCvFile() != NULL) {
                    $cur_file = $this->getUser()->getCurriculum()->getCvFile();
                    $this->getUser()->getCurriculum()->setCvFile($cvFile);
                    $em->remove($cur_file);
                    $em->flush();
                }
                $this->getUser()->getCurriculum()->setCvFile($cvFile);
                $em->persist($this->getUser());
                $em->persist($cvFile);
                $em->flush();
                $response = new Response(json_encode(array("url" => $cvFile->getCvName())));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addCVFile.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
    }

    public function addFormationAction(Request $request) {
        if ($request->getMethod() == 'POST') {
            $formation = new Formation();
            $form = $this->createForm(new FormationType(), $formation);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $this->getUser()->getCurriculum()->addFormation($formation);
                $em->persist($formation);
                $em->flush();
                $formation = new Formation();
                $form = $this->createForm(new FormationType(), $formation);
                $formations = $this->getUser()->getCurriculum()->getFormations();
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addFormation.html.twig', array(
                    'form' => $form->createView(), 'formations' => $formations));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addFormation.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
    }

    public function editFormationAction(Request $request, Formation $formation) {
        $form = $this->createForm(new FormationType(), $formation);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $em->flush();
                $formations = $this->getUser()->getCurriculum()->getFormations();
                $formation = new Formation();
                $form = $this->createForm(new FormationType(), $formation);
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addFormation.html.twig', array(
                    'form' => $form->createView(), 'formations' => $formations));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:editFormation.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        $html = $this->renderView('EcoJobCandidatBundle:Candidat:editFormation.html.twig', array(
            'form' => $form->createView()));
        $response = new Response(json_encode(array("html" => $html)));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function addExperienceAction(Request $request) {
        if ($request->getMethod() == 'POST') {
            $experience = new Experience();
            $form = $this->createForm(new ExperienceType(), $experience);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $this->getUser()->getCurriculum()->addExperience($experience);
                $em->persist($experience);
                $em->flush();
                $experience = new Experience();
                $form = $this->createForm(new ExperienceType(), $experience);
                $experiences = $this->getUser()->getCurriculum()->getExperiences();
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addExperience.html.twig', array(
                    'form' => $form->createView(), 'experiences' => $experiences));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addExperience.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
    }

    public function editExperienceAction(Request $request, Experience $experience) {
        $form = $this->createForm(new ExperienceType(), $experience);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $em->flush();
                $experiences = $this->getUser()->getCurriculum()->getExperiences();
                $experience = new Experience();
                $form = $this->createForm(new ExperienceType(), $experience);
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addExperience.html.twig', array(
                    'form' => $form->createView(), 'experiences' => $experiences));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:editExperience.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        $html = $this->renderView('EcoJobCandidatBundle:Candidat:editExperience.html.twig', array(
            'form' => $form->createView()));
        $response = new Response(json_encode(array("html" => $html)));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function addLangueAction(Request $request) {
        $langue = new Langue();
        $form = $this->createForm(new LangueType(), $langue);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {

            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $this->getUser()->getCurriculum()->addLangue($langue);
                $em->persist($langue);
                $em->flush();
                $langue = new Langue();
                $form = $this->createForm(new LangueType(), $langue);
                $langues = $this->getUser()->getCurriculum()->getLangues();
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addLangue.html.twig', array(
                    'form' => $form->createView(), 'langues' => $langues));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addLangue.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        return $this->render('EcoJobCandidatBundle:Candidat:addLangue.html.twig', array(
                    'form' => $form->createView()));
    }

    public function editLangueAction(Request $request, Langue $langue) {
        $form = $this->createForm(new LangueType(), $langue);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $em->flush();
                $langues = $this->getUser()->getCurriculum()->getLangues();
                $langue = new Langue();
                $form = $this->createForm(new LangueType(), $langue);
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addLangue.html.twig', array(
                    'form' => $form->createView(), 'langues' => $langues));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:editLangue.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        $html = $this->renderView('EcoJobCandidatBundle:Candidat:editLangue.html.twig', array(
            'form' => $form->createView()));
        $response = new Response(json_encode(array("html" => $html)));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function deleteLangueAction(Request $request, Langue $langue) {
        if (($request->getMethod() == 'POST')) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($langue);
            $em->flush();
            $response = new Response(json_encode(array("html" => "Succes")));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
    }

    public function deleteExperienceAction(Request $request, Experience $experience) {
        if (($request->getMethod() == 'POST')) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($experience);
            $em->flush();
            $response = new Response(json_encode(array("html" => "Succes")));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
    }

    public function deleteFormationAction(Request $request, Formation $formation) {
        if (($request->getMethod() == 'POST')) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($formation);
            $em->flush();
            $response = new Response(json_encode(array("html" => "Succes")));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
    }

    public function addCompetenceAction(Request $request) {
        $competence = new Competence();
        $form = $this->createForm(new CompetenceType(), $competence);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {

            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $this->getUser()->getCurriculum()->addCompetence($competence);
                $em->persist($competence);
                $em->flush();
                $competence = new Competence();
                $form = $this->createForm(new CompetenceType(), $competence);
                $competences = $this->getUser()->getCurriculum()->getCompetences();
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addCompetence.html.twig', array(
                    'form' => $form->createView(), 'competences' => $competences));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addCompetence.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        return $this->render('EcoJobCandidatBundle:Candidat:addCompetence.html.twig', array(
                    'form' => $form->createView()));
    }

    public function editCompetenceAction(Request $request, Competence $competence) {
        $form = $this->createForm(new CompetenceType(), $competence);
        $form->handleRequest($request);
        if ($request->getMethod() == 'POST') {
            if ($form->isValid()) {
                $em = $this->getDoctrine()->getManager();
                $em->flush();
                $competences = $this->getUser()->getCurriculum()->getCompetences();
                $competence = new Competence();
                $form = $this->createForm(new CompetenceType(), $competence);
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:addCompetence.html.twig', array(
                    'form' => $form->createView(), 'competences' => $competences));
                $response = new Response(json_encode(array("html" => $html)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            } else {
                $error = true;
                $html = $this->renderView('EcoJobCandidatBundle:Candidat:editCompetence.html.twig', array(
                    'form' => $form->createView()));
                $response = new Response(json_encode(array("html" => $html, 'error' => $error)));
                $response->headers->set('Content-Type', 'application/json');
                return $response;
            }
        }
        $html = $this->renderView('EcoJobCandidatBundle:Candidat:editCompetence.html.twig', array(
            'form' => $form->createView()));
        $response = new Response(json_encode(array("html" => $html)));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    public function deleteCompetenceAction(Request $request, Competence $competence) {
        if (($request->getMethod() == 'POST')) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($competence);
            $em->flush();
            $response = new Response(json_encode(array("html" => "Succes")));
            $response->headers->set('Content-Type', 'application/json');
            return $response;
        }
    }

}
