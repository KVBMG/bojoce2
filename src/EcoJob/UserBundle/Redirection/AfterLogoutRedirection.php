<?php
//mila mdoc momba anlay authorization checker raha te-haka role

namespace EcoJob\UserBundle\Redirection;
 
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Http\Logout\LogoutSuccessHandlerInterface;
use Symfony\Component\Security\Core\Authorization\AuthorizationChecker;

class AfterLogoutRedirection implements LogoutSuccessHandlerInterface
{
    /**
     * @var \Symfony\Component\Routing\RouterInterface
     */
    private $router;
 
    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     */
    private $security;
 
    /**
     * @param SecurityContextInterface $security
     */
    public function __construct(RouterInterface $router, AuthorizationChecker $security)
    {
        $this->router = $router;
        $this->security = $security;
    }
 
    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function onLogoutSuccess(Request $request)
    {
        /*
         * $roles = $this->security->getToken()->getRoles();
         
        $rolesTab = array_map(function($role)
           { 
            return $role->getRole(); 
        }, $roles);
        
        if (in_array('ROLE_COMMERCIAL', $rolesTab, true) || in_array('ROLE_ADMIN', $rolesTab, true) || in_array('ROLE_SUPER_ADMIN', $rolesTab, true))
         *         else
            $response = new RedirectResponse($this->router->generate('homepage'));
        */  
        $response = new RedirectResponse($this->router->generate('fos_user_security_login'));

 
        return $response;
    }
}