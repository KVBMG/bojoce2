<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;

/**
 * CuVi
 *
 * @ORM\Table(name="cu_vi")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CuViRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class CuVi {

    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToOne(targetEntity="EcoJob\CandidatBundle\Entity\EtatCivil",cascade={"remove"},orphanRemoval=true)
     * @Exclude     
     */
    private $etatCivil;

    /**
     * @ORM\OneToOne(targetEntity="EcoJob\CandidatBundle\Entity\CVFile",cascade={"remove"},orphanRemoval=true)
     * @Exclude     
     */
    private $cvFile;

    /**
     * @ORM\OneToOne(targetEntity="EcoJob\UserBundle\Entity\Image",cascade={"remove"},orphanRemoval=true)
     * @Exclude     
     */
    private $image;

    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Formation",mappedBy="cuvi",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $formations;

    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Competence",mappedBy="cuvi",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $competences;

    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Langue",mappedBy="cuvi",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $langues;

    /**
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Experience",mappedBy="cuvi",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $experiences;

    /**
     * @var bool
     *
     * @ORM\Column(name="showable", type="boolean",options={"default": true},nullable=true)
     */
    private $showable;

    /**
     * @ORM\Column(type="datetime",nullable=true)
     *
     * @var \DateTime
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime")
     *
     * @var \DateTime
     */
    private $updatedAt;

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return User
     */

    /**
     * @ORM\PreUpdate
     */
    public function updateDate(){
        $this->updatedAt = new \DateTime();
    }

    public function setUpdatedAt($updatedAt) {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt() {
        return $this->updatedAt;
    }

    public function __construct() {
        $this->showable = false;
        $this->createdAt = new \DateTime();
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set showable
     *
     * @param boolean $showable
     *
     * @return CuVi
     */
    public function setShowable($showable) {
        $this->showable = $showable;

        return $this;
    }

    /**
     * Get showable
     *
     * @return boolean
     */
    public function getShowable() {
        return $this->showable;
    }

    /**
     * Set etatCivil
     *
     * @param \EcoJob\CandidatBundle\Entity\EtatCivil $etatCivil
     *
     * @return CuVi
     */
    public function setEtatCivil(\EcoJob\CandidatBundle\Entity\EtatCivil $etatCivil = null) {
        $this->etatCivil = $etatCivil;

        return $this;
    }

    /**
     * Get etatCivil
     *
     * @return \EcoJob\CandidatBundle\Entity\EtatCivil
     */
    public function getEtatCivil() {
        return $this->etatCivil;
    }

    /**
     * Set cvFile
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFile $cvFile
     *
     * @return CuVi
     */
    public function setCvFile(\EcoJob\CandidatBundle\Entity\CVFile $cvFile = null) {
        $this->cvFile = $cvFile;

        return $this;
    }

    /**
     * Get cvFile
     *
     * @return \EcoJob\CandidatBundle\Entity\CVFile
     */
    public function getCvFile() {
        return $this->cvFile;
    }

    /**
     * Set image
     *
     * @param \EcoJob\UserBundle\Entity\Image $image
     *
     * @return CuVi
     */
    public function setImage(\EcoJob\UserBundle\Entity\Image $image = null) {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return \EcoJob\UserBundle\Entity\Image
     */
    public function getImage() {
        return $this->image;
    }

    /**
     * Add formation
     *
     * @param \EcoJob\CandidatBundle\Entity\Formation $formation
     *
     * @return CuVi
     */
    public function addFormation(\EcoJob\CandidatBundle\Entity\Formation $formation) {
        $this->formations[] = $formation;
        $formation->setCuvi($this);
        return $this;
    }

    /**
     * Remove formation
     *
     * @param \EcoJob\CandidatBundle\Entity\Formation $formation
     */
    public function removeFormation(\EcoJob\CandidatBundle\Entity\Formation $formation) {
        $this->formations->removeElement($formation);
    }

    /**
     * Get formations
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getFormations() {
        return $this->formations;
    }

    /**
     * Add experience
     *
     * @param \EcoJob\CandidatBundle\Entity\Experience $experience
     *
     * @return CuVi
     */
    public function addExperience(\EcoJob\CandidatBundle\Entity\Experience $experience) {
        $this->experiences[] = $experience;
        $experience->setCuVi($this);
        return $this;
    }

    /**
     * Remove experience
     *
     * @param \EcoJob\CandidatBundle\Entity\Experience $experience
     */
    public function removeExperience(\EcoJob\CandidatBundle\Entity\Experience $experience) {
        $this->experiences->removeElement($experience);
    }

    /**
     * Get experiences
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getExperiences() {
        return $this->experiences;
    }

    /**
     * Add langue
     *
     * @param \EcoJob\CandidatBundle\Entity\Langue $langue
     *
     * @return CuVi
     */
    public function addLangue(\EcoJob\CandidatBundle\Entity\Langue $langue) {
        $this->langues[] = $langue;
        $langue->setCuVi($this);
        return $this;
    }

    /**
     * Remove langue
     *
     * @param \EcoJob\CandidatBundle\Entity\Langue $langue
     */
    public function removeLangue(\EcoJob\CandidatBundle\Entity\Langue $langue) {
        $this->langues->removeElement($langue);
    }

    /**
     * Get langues
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getLangues() {
        return $this->langues;
    }

    /**
     * Add competence
     *
     * @param \EcoJob\CandidatBundle\Entity\Competence $competence
     *
     * @return CuVi
     */
    public function addCompetence(\EcoJob\CandidatBundle\Entity\Competence $competence) {
        $this->competences[] = $competence;
        $competence->setCuvi($this);
        return $this;
    }

    /**
     * Remove competence
     *
     * @param \EcoJob\CandidatBundle\Entity\Competence $competence
     */
    public function removeCompetence(\EcoJob\CandidatBundle\Entity\Competence $competence) {
        $this->competences->removeElement($competence);
    }

    /**
     * Get competences
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCompetences() {
        return $this->competences;
    }

    /**
     * Set contrat
     *
     * @param \EcoJob\RecruteurBundle\Entity\ContratType $contrat
     *
     * @return CuVi
     */
    public function setContrat(\EcoJob\RecruteurBundle\Entity\ContratType $contrat) {
        $this->contrat = $contrat;

        return $this;
    }

    /**
     * Get contrat
     *
     * @return \EcoJob\RecruteurBundle\Entity\ContratType
     */
    public function getContrat() {
        return $this->contrat;
    }

    /**
     * Set recruteur
     *
     * @param \EcoJob\UserBundle\Entity\User $recruteur
     *
     * @return CuVi
     */
    public function setRecruteur(\EcoJob\UserBundle\Entity\User $recruteur) {
        $this->recruteur = $recruteur;

        return $this;
    }

    /**
     * Get recruteur
     *
     * @return \EcoJob\UserBundle\Entity\User
     */
    public function getRecruteur() {
        return $this->recruteur;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return CuVi
     */
    public function setCreatedAt($createdAt) {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt() {
        return $this->createdAt;
    }

}
