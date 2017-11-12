<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * Fonction
 *
 * @ORM\Table(name="fonction")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\FonctionRepository")
 */
class Fonction
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

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\CategorieFonction",inversedBy="fonctions")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $categorieFonction;    
    
    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Experience",mappedBy="fonction",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
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
     * @return Fonction
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
     * Set categorieFonction
     *
     * @param \EcoJob\CandidatBundle\Entity\CategorieFonction $categorieFonction
     *
     * @return Fonction
     */
    public function setCategorieFonction(\EcoJob\CandidatBundle\Entity\CategorieFonction $categorieFonction)
    {
        $this->categorieFonction = $categorieFonction;
    
        return $this;
    }

    /**
     * Get categorieFonction
     *
     * @return \EcoJob\CandidatBundle\Entity\CategorieFonction
     */
    public function getCategorieFonction()
    {
        return $this->categorieFonction;
    }
    public function __toString() {
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
     * @return Fonction
     */
    public function addExperience(\EcoJob\CandidatBundle\Entity\Experience $experience)
    {
        $this->experiences[] = $experience;
        $experience->setFonction($this);
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
}
