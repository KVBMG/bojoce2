<?php

namespace EcoJob\RecruteurBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;


/**
 * Experience
 *
 * @ORM\Table(name="experienceOffre")
 * @ORM\Entity(repositoryClass="EcoJob\RecruteurBundle\Repository\ExperienceRepository")
 */
class Experience
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
     * @ORM\OneToMany(targetEntity="EcoJob\RecruteurBundle\Entity\Offre",
     *     mappedBy="experience",cascade={"remove"})
     */
    private $offres;
    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\EtatCivil",mappedBy="anneeExp",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $ets;    
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
     * @return Experience
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
        $this->offre = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     *
     * @return Experience
     */
    public function addOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre)
    {
        $this->offre[] = $offre;
        $offre->setExperience($this);
        return $this;
    }

    /**
     * Remove offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     */
    public function removeOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre)
    {
        $this->offre->removeElement($offre);
    }

    /**
     * Get offre
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOffre()
    {
        return $this->offre;
    }
    public function __toString() {
        return $this->libelle;
    }    

    /**
     * Add cuvi
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $cuvi
     *
     * @return Experience
     */
    public function addCuvi(\EcoJob\CandidatBundle\Entity\CuVi $cuvi)
    {
        $this->cuvis[] = $cuvi;
    
        return $this;
    }

    /**
     * Remove cuvi
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $cuvi
     */
    public function removeCuvi(\EcoJob\CandidatBundle\Entity\CuVi $cuvi)
    {
        $this->cuvis->removeElement($cuvi);
    }

    /**
     * Get cuvis
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCuvis()
    {
        return $this->cuvis;
    }
}
