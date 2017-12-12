<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;

/**
 * CVFile
 *
 * @ORM\Table(name="lettre")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\LettreRepository")
 * @Vich\Uploadable
 */
class Lettre
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
     * @Assert\File(
     *     maxSize="3M",
     *     mimeTypes={"application/pdf", "application/msword","application/vnd.openxmlformats-officedocument.wordprocessingml.document"}
     * )
     * @Vich\UploadableField(mapping="candidat_cv", fileNameProperty="nom")
     *
     * @var File $cvFile
     */    
    private $fichier;
    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User", inversedBy="lettres")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
     */
    private $candidat;
    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     *
     * @var string
     */
    private $nom;
    
    /**
     * @ORM\Column(type="string", length=255, nullable=false)
     *
     * @var string
     */
    private $titre;    
 
    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\CandidatureT",mappedBy="lettre",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     */
    private $candidaturesT;   
    
    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Candidature",mappedBy="lettre",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     */
    private $candidatures;     

    /**
     * @ORM\Column(type="datetime")
     *
     * @var \DateTime
     */
    private $updatedAt;


    
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
     * Set cvName
     *
     * @param string $cvName
     *
     * @return User
     */
    public function setCvName($cvName)
    {
        $this->cvName = $cvName;
    
        return $this;
    }

    /**
     * Get cvName
     *
     * @return string
     */
    public function getCvName()
    {
        return $this->cvName;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return User
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    
        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }
    public function setFichier(File $cv = null)
    {
        $this->fichier = $cv;

        if ($cv) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTime('now');
        }

        return $this;
    }

    /**
     * @return File|null
     */
    public function getFichier()
    {
        return $this->fichier;
    }        


    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return CVFichier
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
    
        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set titre
     *
     * @param string $titre
     *
     * @return CVFichier
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;
    
        return $this;
    }

    /**
     * Get titre
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

     /**
     * Set candidat
     *
     * @param \EcoJob\UserBundle\Entity\User $candidat
     *
     * @return CVFichier
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
     * Constructor
     */
    public function __construct()
    {
        $this->candidatures = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add candidature
     *
     * @param \EcoJob\CandidatBundle\Entity\CandidatureT $candidature
     *
     * @return Lettre
     */
    public function addCandidature(\EcoJob\CandidatBundle\Entity\CandidatureT $candidature)
    {
        $this->candidatures[] = $candidature;
    
        return $this;
    }

    /**
     * Remove candidature
     *
     * @param \EcoJob\CandidatBundle\Entity\CandidatureT $candidature
     */
    public function removeCandidature(\EcoJob\CandidatBundle\Entity\CandidatureT $candidature)
    {
        $this->candidatures->removeElement($candidature);
    }

    /**
     * Get candidatures
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCandidatures()
    {
        return $this->candidatures;
    }
}
