<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace EcoJob\MessagerieBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use FOS\MessageBundle\Entity\Thread as BaseThread;

/**
 * @ORM\Entity
 */
class Thread extends BaseThread {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     * @var \FOS\MessageBundle\Model\ParticipantInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")     
     */
    protected $createdBy;

    /**
     * @ORM\OneToMany(
     * targetEntity="EcoJob\MessagerieBundle\Entity\Message",
     * mappedBy="thread"
     * )
     * @var Message[]|Collection
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")     
     */
    protected $messages;

    /**
     * @ORM\OneToMany(
     * targetEntity="EcoJob\MessagerieBundle\Entity\ThreadMetadata",
     * mappedBy="thread",
     * cascade={"all"}
     * )
     * @var ThreadMetadata[]|Collection
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")

     */
    protected $metadata;

}
