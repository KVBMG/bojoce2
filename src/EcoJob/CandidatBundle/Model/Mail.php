<?php

namespace EcoJob\CandidatBundle\Model;

use Doctrine\ORM\Mapping as ORM;

/**
 * Email
 *
 */
class Mail
{
  
    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    protected $receiver;

  
    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     */
    protected $content;

   /**
     * @var string
     *
     * @ORM\Column(name="subject", type="text")
     */
    protected $subject;


    function __construct()
    {
  
    }


 
    /**
     * Set sender
     *
     * @param \EcoJob\UserBundle\Entity\User $receiver
     *
     * @return BaseMessage
     */
    public function setReceiver(\EcoJob\UserBundle\Entity\User $receiver)
    {
        $this->receiver = $receiver;

        return $this;
    }

    /**
     * Get receiver
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getReceiver()
    {
        return $this->receiver;
    }

    /**
     * Set subject
     *
     * @param string $subject
     *
     * @return BaseMessage
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * Get subject
     *
     * @return string
     */
    public function getSubject()
    {
        return $this->subject;
    }

    
    /**
     * Set content
     *
     * @param string $content
     *
     * @return BaseMessage
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }
}

