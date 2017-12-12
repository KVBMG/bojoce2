<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * Candidature
 *
 * @ORM\Table(name="candidaturet")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CandidatureTRepository")
 */
class CandidatureT
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
     * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\Lettre", inversedBy="candidaturesT")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $lettre;
    
    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\CVFichier", inversedBy="candidaturesT")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $cvfichier;    

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User", inversedBy="candidatures")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $candidat;
    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User", inversedBy="cdtures_rec")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $recruteur;    

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="text")
     */
    private $description;

    public $copie;
    /**
     * @ORM\Column(name="date_candidature", type="datetime")
     */
    private $date_candidature;


    public function __construct()
    {
        $this->date_candidature = new \DateTime();
    }


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
     * Set description
     *
     * @param string $description
     *
     * @return CandidatureT
     */
    public function setDescription($description)
    {
        $this->description = $description;
    
        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set dateCandidature
     *
     * @param \DateTime $dateCandidature
     *
     * @return CandidatureT
     */
    public function setDateCandidature($dateCandidature)
    {
        $this->date_candidature = $dateCandidature;
    
        return $this;
    }

    /**
     * Get dateCandidature
     *
     * @return \DateTime
     */
    public function getDateCandidature()
    {
        return $this->date_candidature;
    }

    /**
     * Set lettre
     *
     * @param \EcoJob\CandidatBundle\Entity\Lettre $lettre
     *
     * @return CandidatureT
     */
    public function setLettre(\EcoJob\CandidatBundle\Entity\Lettre $lettre)
    {
        $this->lettre = $lettre;
    
        return $this;
    }

    /**
     * Get lettre
     *
     * @return \EcoJob\CandidatBundle\Entity\Lettre
     */
    public function getLettre()
    {
        return $this->lettre;
    }

    /**
     * Set cvfichier
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFichier $cvfichier
     *
     * @return CandidatureT
     */
    public function setCvfichier(\EcoJob\CandidatBundle\Entity\CVFichier $cvfichier)
    {
        $this->cvfichier = $cvfichier;
    
        return $this;
    }

    /**
     * Get cvfichier
     *
     * @return \EcoJob\CandidatBundle\Entity\CVFichier
     */
    public function getCvfichier()
    {
        return $this->cvfichier;
    }

    /**
     * Set candidat
     *
     * @param \EcoJob\UserBundle\Entity\User $candidat
     *
     * @return CandidatureT
     */
    public function setCandidat(\EcoJob\UserBundle\Entity\User $candidat)
    {
        $this->candidat = $candidat;
    
        return $this;
    }

    /**
     * Get candidat
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getCandidat()
    {
        return $this->candidat;
    }

    /**
     * Set recruteur
     *
     * @param \EcoJob\UserBundle\Entity\User $recruteur
     *
     * @return CandidatureT
     */
    public function setRecruteur(\EcoJob\UserBundle\Entity\User $recruteur)
    {
        $this->recruteur = $recruteur;
    
        return $this;
    }

    /**
     * Get recruteur
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getRecruteur()
    {
        return $this->recruteur;
    }
}
