<?php

namespace EcoJob\MessagerieBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\MessageBundle\Entity\ThreadMetadata as BaseThreadMetadata;

/**
 * @ORM\Entity
 */
class ThreadMetadata extends BaseThreadMetadata {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\ManyToOne(
     * targetEntity="EcoJob\MessagerieBundle\Entity\Thread",
     * inversedBy="metadata"
     * )
     * @var \FOS\MessageBundle\Model\ThreadInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")      
     *
     */
    protected $thread;

    /**
     * @ORM\ManyToOne(
     * targetEntity="EcoJob\UserBundle\Entity\User")
     * @var \FOS\MessageBundle\Model\ParticipantInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")       
     */
    protected $participant;

}
