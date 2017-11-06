<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * AlertMail
 *
 * @ORM\Table(name="alert_mail")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\AlertMailRepository")
 */
class AlertMail
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User",inversedBy="alertMails")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    /**
     * @var string
     *
     * @ORM\Column(name="criter", type="string", length=255)
     */
    private $criter;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set criter
     *
     * @param string $criter
     *
     * @return AlertMail
     */
    public function setCriter($criter)
    {
        $this->criter = $criter;

        return $this;
    }

    /**
     * Get criter
     *
     * @return string
     */
    public function getCriter()
    {
        return $this->criter;
    }

    /**
     * Set user
     *
     * @param \EcoJob\UserBundle\Entity\User $user
     *
     * @return AlertMail
     */
    public function setUser(\EcoJob\UserBundle\Entity\User $user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }
}
