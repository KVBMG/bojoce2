<?php

namespace EcoJob\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Type
 *
 * @ORM\Table(name="type")
 * @ORM\Entity(repositoryClass="EcoJob\UserBundle\Repository\TypeRepository")
 */
class Type
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;
    
    public function __construct()
    {
        $this->users = new \Doctrine\Common\Collections\ArrayCollection();
    }
    
    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=10, unique=true)
     */
    private $libelle;

    /**
    * @ORM\OneToMany(targetEntity="EcoJob\UserBundle\Entity\User",mappedBy="type",orphanRemoval=false)
    */    
    private $users;    
    
    public function getUsers()
    {
        
        return $this->users;
    }
    public function addUser(\EcoJob\UserBundle\Entity\User $user)
    {
        $this->mouvements[] = $user;
        $user->setType($this);
        return $this;
    }
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
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Type
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Get libelle
     *
     * @return string
     */
    public function getLibelle()
    {
        return $this->libelle;
    }
    public function __toString()
    {
        return $this->libelle;
    }    
}

