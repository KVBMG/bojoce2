<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SuspendreOffre
 *
 * @author nooms
 */

namespace EcoJob\AdminBundle\Service;
use Doctrine\ORM\EntityManager;

class SuspendreOffreService {
    
    private $em;
    
    public function __construct(EntityManager $em) {
        $this->em = $em;
    }
    public function run(){
        $offres = $this->em->getRepository('EcoJobRecruteurBundle:Offre')->getExpiredNow();
        foreach($offres as $offre){
            $offre->setSuspendu(true);
            $offre->setSuspenduAt(new \DateTime());
            $this->em->flush();
        }
    }
}
