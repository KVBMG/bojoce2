<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * NiveauFormation
 *
 * @ORM\Table(name="niveau_formation")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\NiveauFormationRepository")
 */
class NiveauFormation
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
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Formation",mappedBy="niveau",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $formations;
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
     * @return NiveauFormation
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
        $this->formations = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add formation
     *
     * @param \EcoJob\CandidatBundle\Entity\Formation $formation
     *
     * @return NiveauFormation
     */
    public function addFormation(\EcoJob\CandidatBundle\Entity\Formation $formation)
    {
        $this->formations[] = $formation;
        $formation->setNiveau($this);
        return $this;
    }

    /**
     * Remove formation
     *
     * @param \EcoJob\CandidatBundle\Entity\Formation $formation
     */
    public function removeFormation(\EcoJob\CandidatBundle\Entity\Formation $formation)
    {
        $this->formations->removeElement($formation);
    }

    /**
     * Get formations
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getFormations()
    {
        return $this->formations;
    }
     public function __toString()
    {
        return $this->libelle;
    }     
}
