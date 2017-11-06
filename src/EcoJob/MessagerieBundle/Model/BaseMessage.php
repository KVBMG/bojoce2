<?php

namespace EcoJob\MessagerieBundle\Model;

use Doctrine\ORM\Mapping as ORM;

/**
 * BaseMessage
 *
 * @ORM\MappedSuperclass
 */
abstract class BaseMessage
{
    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    protected $sender;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    protected $receiver;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    protected $date;

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text")
     */
    protected $content;

    /**
     * @var bool
     *
     * @ORM\Column(name="isRead", type="boolean")
     */
    protected $isRead;


    function __construct()
    {
        $this->date = new \DateTime();
        $this->isRead = false;
    }


    /**
     * Set sender
     *
     * @param \EcoJob\UserBundle\Entity\User $sender
     *
     * @return BaseMessage
     */
    public function setSender(\EcoJob\UserBundle\Entity\User $sender)
    {
        $this->sender = $sender;

        return $this;
    }

    /**
     * Get sender
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getSender()
    {
        return $this->sender;
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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return BaseMessage
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
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

    /**
     * Set isRead
     *
     * @param boolean $isRead
     *
     * @return BaseMessage
     */
    public function setIsRead($isRead)
    {
        $this->isRead = $isRead;

        return $this;
    }

    /**
     * Get isRead
     *
     * @return bool
     */
    public function getIsRead()
    {
        return $this->isRead;
    }
}

