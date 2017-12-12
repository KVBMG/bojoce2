<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * TypeClientele
 *
 * @ORM\Table(name="type_clientele")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\TypeClienteleRepository")
 */
class TypeClientele
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
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=30)
     */
    private $libelle;


    private $experiences;    

    /**
     * Get id
     *
     * @return integer
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
     * @return TypeClientele
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
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->experiences = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add experience
     *
     * @param \EcoJob\CandidatBundle\Entity\Experience $experience
     *
     * @return TypeClientele
     */
    public function addExperience(\EcoJob\CandidatBundle\Entity\Experience $experience)
    {
        $this->experiences[] = $experience;
        $experience->setTypeClientele($this);
        return $this;
    }

    /**
     * Remove experience
     *
     * @param \EcoJob\CandidatBundle\Entity\Experience $experience
     */
    public function removeExperience(\EcoJob\CandidatBundle\Entity\Experience $experience)
    {
        $this->experiences->removeElement($experience);
    }

    /**
     * Get experiences
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getExperiences()
    {
        return $this->experiences;
    }
     public function __toString()
    {
        return $this->libelle;
    }    
}
