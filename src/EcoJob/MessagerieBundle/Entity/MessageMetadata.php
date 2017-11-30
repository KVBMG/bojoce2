<?php

namespace EcoJob\MessagerieBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\MessageBundle\Entity\MessageMetadata as BaseMessageMetadata;

/**
 * @ORM\Entity
 */
class MessageMetadata extends BaseMessageMetadata {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\ManyToOne(
     *   targetEntity="EcoJob\MessagerieBundle\Entity\Message",
     *   inversedBy="metadata"
     * )
     * @var \FOS\MessageBundle\Model\MessageInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")     
     */
    protected $message;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     * @var \FOS\MessageBundle\Model\ParticipantInterface
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")      
     */
    protected $participant;

}
