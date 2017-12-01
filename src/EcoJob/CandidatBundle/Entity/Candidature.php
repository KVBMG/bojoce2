<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * Candidature
 *
 * @ORM\Table(name="candidature")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CandidatureRepository")
 */
class Candidature
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
     * @ORM\ManyToOne(targetEntity="EcoJob\RecruteurBundle\Entity\Offre", inversedBy="candidatures")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $offre;

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

    /**
     * @ORM\Column(name="date_candidature", type="datetime")
     */
    private $date_candidature;

    /**
     * @ORM\OneToOne(targetEntity="EcoJob\CandidatBundle\Entity\CVFile",cascade={"remove"},orphanRemoval=true)
     * @Exclude
     */
    private $cvFile;

    /**
     * @ORM\Column(name="joinMyCv", type="boolean", nullable=true)
     */
    private $joinMyCv;


    /**
     * Candidature constructor.
     * @param $offre
     * @param $candidat
     * @param string $description
     */
    public function __construct()
    {
        $this->cvFile = null;
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
     *
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
     * Set offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     *
     *
     */
    public function setOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre)
    {
        $this->offre = $offre;
    
        return $this;
    }

    /**
     * Get offre
     *
     * @return \EcoJob\RecruteurBundle\Entity\Offre
     */
    public function getOffre()
    {
        return $this->offre;
    }


    /**
     * Set dateCandidature
     *
     * @param \DateTime $dateCandidature
     *
     * @return Candidature
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
     * Set candidat
     *
     * @param \EcoJob\UserBundle\Entity\User $candidat
     *
     * @return Candidature
     */
    public function setCandidat(\EcoJob\UserBundle\Entity\User $candidat = null)
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
     * @return Candidature
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

    /**
     * Set cvFile
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFile $cvFile
     *
     * @return Candidature
     */
    public function setCvFile(\EcoJob\CandidatBundle\Entity\CVFile $cvFile = null)
    {
        $this->cvFile = $cvFile;
        return $this;
    }

    /**
     * Get cvFile
     *
     * @return \EcoJob\CandidatBundle\Entity\CVFile
     */
    public function getCvFile()
    {
        return $this->cvFile;
    }

    /**
     * Set joinMyCv
     *
     * @param boolean $joinMyCv
     *
     * @return Candidature
     */
    public function setJoinMyCv($joinMyCv = false)
    {
        $this->joinMyCv = $joinMyCv;
        return $this;
    }

    /**
     * Get joinMyCv
     *
     * @return boolean
     */
    public function getJoinMyCv()
    {
        return $this->joinMyCv;
    }
}
