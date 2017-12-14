<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * TypeRemuneration
 *
 * @ORM\Table(name="type_remuneration")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\TypeRemunerationRepository")
 */
class TypeRemuneration
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
     * @ORM\Column(name="libelle", type="string", length=255)
     */
    private $libelle;


    private $experiences;    

    private $cvfichiers;      
    
    /**
     * @ORM\OneToMany(targetEntity="EcoJob\RecruteurBundle\Entity\Offre",mappedBy="remuneration",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $offres;     
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
     * @return TypeRemuneration
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
     * @return TypeRemuneration
     */
    public function addExperience(\EcoJob\CandidatBundle\Entity\Experience $experience)
    {
        $this->experiences[] = $experience;
    
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

    /**
     * Add cvfichier
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFichier $cvfichier
     *
     * @return TypeRemuneration
     */
    public function addCvfichier(\EcoJob\CandidatBundle\Entity\CVFichier $cvfichier)
    {
        $this->cvfichiers[] = $cvfichier;
    
        return $this;
    }

    /**
     * Remove cvfichier
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFichier $cvfichier
     */
    public function removeCvfichier(\EcoJob\CandidatBundle\Entity\CVFichier $cvfichier)
    {
        $this->cvfichiers->removeElement($cvfichier);
    }

    /**
     * Get cvfichiers
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCvfichiers()
    {
        return $this->cvfichiers;
    }
}
