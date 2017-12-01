<?php

namespace EcoJob\MessagerieBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use EcoJob\MessagerieBundle\Model\BaseMessage;

/**
 * SubMessage
 *
 * @ORM\Table(name="sub_message")
 * @ORM\Entity(repositoryClass="EcoJob\MessagerieBundle\Repository\SubMessageRepository")
 */
class SubMessage extends BaseMessage {

    /**
     * @var integer
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\MessagerieBundle\Entity\Message",inversedBy="subMessages")
     * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $message;

    /**
     * Get id
     *
     * @return int
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set message
     *
     * @param \EcoJob\MessagerieBundle\Entity\Message $message
     *
     * @return SubMessage
     */
    public function setMessage(\EcoJob\MessagerieBundle\Entity\Message $message) {
        $this->message = $message;

        return $this;
    }

    /**
     * Get message
     *
     * @return \EcoJob\MessagerieBundle\Entity\Message
     */
    public function getMessage() {
        return $this->message;
    }

}
