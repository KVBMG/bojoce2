<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;

/**
 * Formation
 *
 * @ORM\Table(name="formation")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\FormationRepository")
 */
class Formation
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
     * @ORM\Column(name="detailsFormation", type="string", length=1000,nullable=true)
     */
    private $detailsFormation;    
    
    /**
     * @var int
     *
     * @ORM\Column(name="anneeObtention", type="integer")
     * @Assert\NotBlank()
     */
    private $anneeObtention;

    /**
     * @var string
     *
     * @ORM\Column(name="intituleDiplome", type="string", length=50)
     * @Assert\NotBlank()
     */
    private $intituleDiplome;

    /**
     * @var string
     *
     * @ORM\Column(name="specialisation", type="string", length=20)
     * @Assert\NotBlank()
     */
    private $specialisation;

    /**
     * @var string
     *
     * @ORM\Column(name="lieu", type="string", length=15)
     * @Assert\NotBlank()
     */
    private $lieu;

    /**
     * @var string
     *
     * @ORM\Column(name="etablissement", type="string", length=255)
     * @Assert\NotBlank()
     */
    private $etablissement;

    /**
     * @var bool
     *
     * @ORM\Column(name="formationEtranger", type="boolean")
     */
    private $formationEtranger;

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\CuVi",inversedBy="formations")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $cuvi;    

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\NiveauFormation",inversedBy="formations")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $niveau;      
    
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
     * Set anneeObtention
     *
     * @param integer $anneeObtention
     *
     * @return Formation
     */
    public function setAnneeObtention($anneeObtention)
    {
        $this->anneeObtention = $anneeObtention;
    
        return $this;
    }

    /**
     * Get anneeObtention
     *
     * @return integer
     */
    public function getAnneeObtention()
    {
        return $this->anneeObtention;
    }

    /**
     * Set intituleDiplome
     *
     * @param string $intituleDiplome
     *
     * @return Formation
     */
    public function setIntituleDiplome($intituleDiplome)
    {
        $this->intituleDiplome = $intituleDiplome;
    
        return $this;
    }

    /**
     * Get intituleDiplome
     *
     * @return string
     */
    public function getIntituleDiplome()
    {
        return $this->intituleDiplome;
    }

    /**
     * Set specialisation
     *
     * @param string $specialisation
     *
     * @return Formation
     */
    public function setSpecialisation($specialisation)
    {
        $this->specialisation = $specialisation;
    
        return $this;
    }

    /**
     * Get specialisation
     *
     * @return string
     */
    public function getSpecialisation()
    {
        return $this->specialisation;
    }

    /**
     * Set lieu
     *
     * @param string $lieu
     *
     * @return Formation
     */
    public function setLieu($lieu)
    {
        $this->lieu = $lieu;
    
        return $this;
    }

    /**
     * Get lieu
     *
     * @return string
     */
    public function getLieu()
    {
        return $this->lieu;
    }

    /**
     * Set etablissement
     *
     * @param string $etablissement
     *
     * @return Formation
     */
    public function setEtablissement($etablissement)
    {
        $this->etablissement = $etablissement;
    
        return $this;
    }

    /**
     * Get etablissement
     *
     * @return string
     */
    public function getEtablissement()
    {
        return $this->etablissement;
    }

    /**
     * Set formationEtranger
     *
     * @param boolean $formationEtranger
     *
     * @return Formation
     */
    public function setFormationEtranger($formationEtranger)
    {
        $this->formationEtranger = $formationEtranger;
    
        return $this;
    }

    /**
     * Get formationEtranger
     *
     * @return boolean
     */
    public function getFormationEtranger()
    {
        return $this->formationEtranger;
    }

    /**
     * Set cuvi
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $cuvi
     *
     * @return Formation
     */
    public function setCuvi(\EcoJob\CandidatBundle\Entity\CuVi $cuvi)
    {
        $this->cuvi = $cuvi;
    
        return $this;
    }

    /**
     * Get cuvi
     *
     * @return \EcoJob\CandidatBundle\Entity\CuVi
     */
    public function getCuvi()
    {
        return $this->cuvi;
    }

    /**
     * Set niveau
     *
     * @param \EcoJob\CandidatBundle\Entity\NiveauFormation $niveau
     *
     * @return Formation
     */
    public function setNiveau(\EcoJob\CandidatBundle\Entity\NiveauFormation $niveau)
    {
        $this->niveau = $niveau;
    
        return $this;
    }

    /**
     * Get niveau
     *
     * @return \EcoJob\CandidatBundle\Entity\NiveauFormation
     */
    public function getNiveau()
    {
        return $this->niveau;
    }

    /**
     * Set detailsFormation
     *
     * @param string $detailsFormation
     *
     * @return Formation
     */
    public function setDetailsFormation($detailsFormation)
    {
        $this->detailsFormation = $detailsFormation;
    
        return $this;
    }

    /**
     * Get detailsFormation
     *
     * @return string
     */
    public function getDetailsFormation()
    {
        return $this->detailsFormation;
    }
}
