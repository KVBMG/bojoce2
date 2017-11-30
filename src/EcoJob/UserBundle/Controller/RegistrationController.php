<?php

namespace EcoJob\UserBundle\Controller;

use FOS\UserBundle\Controller\RegistrationController as FOSRegistrationController;
use FOS\UserBundle\Event\FilterUserResponseEvent;
use FOS\UserBundle\Event\FormEvent;
use FOS\UserBundle\Event\GetResponseUserEvent;
use FOS\UserBundle\Form\Factory\FactoryInterface;
use FOS\UserBundle\Model\UserInterface;
use FOS\UserBundle\Model\UserManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use EcoJob\UserBundle\UserEvents as MyUserEvents;
use EcoJob\UserBundle\Form\Type\RegistrationRecruteurFormType;
use FOS\UserBundle\FOSUserEvents;

class RegistrationController extends FOSRegistrationController {

    public function registerAction(Request $request) {
        /** @var $formFactory FactoryInterface */
        $formFactory = $this->get('fos_user.registration.form.factory');
        /** @var $userManager UserManagerInterface */
        $userManager = $this->get('fos_user.user_manager');
        /** @var $dispatcher EventDispatcherInterface */
        $dispatcher = $this->get('event_dispatcher');

        $user = $userManager->createUser();
        $user->setEnabled(true);

        $event = new GetResponseUserEvent($user, $request);
        $dispatcher->dispatch(FOSUserEvents::REGISTRATION_INITIALIZE, $event);

        if (null !== $event->getResponse()) {
            return $event->getResponse();
        }

        $form = $formFactory->createForm();
        $form->setData($user);

        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            if ($form->isValid()) {
                $event = new FormEvent($form, $request);
                $dispatcher->dispatch(FOSUserEvents::REGISTRATION_SUCCESS, $event);
                if ($user->getType()->getId() == 1)
                    $user->addRole('ROLE_CANDIDAT');
                else{
                    $user->addRole('ROLE_RECRUTEUR');
                    $user->setCanConsultCV(false);
                }
                $userManager->updateUser($user);

                if (null === $response = $event->getResponse()) {
                    $url = $this->generateUrl('fos_user_registration_confirmed');
                    $response = new RedirectResponse($url);
                }

                $dispatcher->dispatch(FOSUserEvents::REGISTRATION_COMPLETED, new FilterUserResponseEvent($user, $request, $response));

                return $response;
            }

            $event = new FormEvent($form, $request);
            $dispatcher->dispatch(FOSUserEvents::REGISTRATION_FAILURE, $event);

            if (null !== $response = $event->getResponse()) {
                return $response;
            }
        }

        return $this->render('@FOSUser/Registration/register.html.twig', array(
                    'form' => $form->createView(),
        ));
    }

    public function resendConfirmAction(Request $request) {
        /** @var $formFactory \FOS\UserBundle\Form\Factory\FactoryInterface */
        $formFactory = $this->container->get('user.resend_confirm.form.factory');
        /** @var $userManager \FOS\UserBundle\Model\UserManagerInterface */
        $userManager = $this->container->get('fos_user.user_manager');
        /** @var $dispatcher \Symfony\Component\EventDispatcher\EventDispatcherInterface */
        $dispatcher = $this->get('event_dispatcher');

        $user = $userManager->createUser();

        $form = $formFactory->createForm();
        $form->setData($user);

        $error = "";

        if ('POST' === $request->getMethod()) {
            $form->bind($request);

            if ($form->isValid()) {
                $email = $user->getEmail();
                $user = $userManager->findUserByEmail($email);

                if (null === $user) {
                    $error = sprintf('L\'utilisateur avec l\'adresse e-mail ou nom d\'utilisateur "%s" n\'existe pas', $email);
                    return $this->render('EcoJobUserBundle:Registration:resend_confirm.html.twig', array(
                                'form' => $form->createView(),
                                'error' => $error
                    ));
                }

                $event = new GetResponseUserEvent($user, $request);
                $dispatcher->dispatch(MyUserEvents::REGISTRATION_RESEND, $event);
                $userManager->updateUser($user);

                if (null === $response = $event->getResponse()) {
                    $url = $this->container->get('router')->generate('fos_user_registration_confirmed');
                    $response = new RedirectResponse($url);
                }

                return $response;
            }
        }

        return $this->render('EcoJobUserBundle:Registration:resend_confirm.html.twig', array(
                    'form' => $form->createView(),
                    'error' => $error
        ));
    }

    /**
     * Overwrite default FOS action with difference that we redirect to login page
     * in case the token is expired/invalid.
     *
     * => if users click the confirm link twice...
     */
    public function confirmAction(Request $request, $token) {
        try {
            return parent::confirmAction($request, $token);
        } catch (NotFoundHttpException $e) {
            if ($this->get('security.authorization_checker')->isGranted('IS_AUTHENTICATED_FULLY')) {
                return $this->redirectToRoute('eco_job_main_index');
            } else {

                return $this->redirectToRoute('fos_user_security_login');
            }
        }
    }

}
