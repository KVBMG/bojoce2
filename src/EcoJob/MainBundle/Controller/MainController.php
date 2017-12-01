<?php

namespace EcoJob\MainBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class MainController extends Controller
{
    public function indexAction()
    {
        return $this->redirectToRoute('eco_job_anonymous__offre_searchpage');
    }
}
