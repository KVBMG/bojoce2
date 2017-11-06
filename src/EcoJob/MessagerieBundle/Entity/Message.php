<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace EcoJob\MessagerieBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use FOS\MessageBundle\Entity\Message as BaseMessage;

/**
 * @ORM\Entity
 */
class Message extends BaseMessage {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\ManyToOne(
     * targetEntity="EcoJob\MessagerieBundle\Entity\Thread",
     * inversedBy="messages"
     * )
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")

     * @var \FOS\MessageBundle\Model\ThreadInterface 
     */
    protected $thread;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     *  @var \FOS\MessageBundle\Model\ParticipantInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     *
     */
    protected $sender;

    /**
     * @ORM\OneToMany(targetEntity="EcoJob\MessagerieBundle\Entity\MessageMetadata",
     * mappedBy="message",
     * cascade={"all"}
     * )
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")

     * @var MessageMetadata[]|Collection

     */
    protected $metadata;

}
