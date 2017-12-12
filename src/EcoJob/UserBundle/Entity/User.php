<?php

namespace EcoJob\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Captcha\Bundle\CaptchaBundle\Validator\Constraints as CaptchaAssert;
use JMS\Serializer\Annotation\Exclude;
use FOS\MessageBundle\Model\ParticipantInterface;

/**
 * @ORM\Entity(repositoryClass="EcoJob\UserBundle\Repository\UserRepository")
 * @ORM\Table(name="utilisateur")
 */
class User extends BaseUser implements ParticipantInterface {

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     *
     * @Assert\Regex("/^[a-zA-Z0-9 ]+$/",
     *     pattern=true,
     *     message="Cette valeur ne doit pas contenir des métacaractères."
     * )    
     */
    protected $username;

    /**
     * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\Type",inversedBy="users")
     * @ORM\JoinColumn(nullable=false)
     */
    private $type;

    /**
     * @ORM\OneToOne(targetEntity="EcoJob\CandidatBundle\Entity\CuVi",cascade={"remove"},orphanRemoval=true)
     * @Exclude     
     */
    private $curriculum;


    /**
     * @ORM\OneToMany(targetEntity="EcoJob\RecruteurBundle\Entity\Offre",mappedBy="recruteur",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $offres;

    /**
     * @var bool
     *
     * @ORM\Column(name="can_consult_cv", type="boolean",options={"default": false},nullable=true)
     */
    private $canConsultCV; 
    
    /**
     *
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Candidature", mappedBy="candidat",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")           
     * @ORM\OrderBy({"date_candidature" = "DESC"})
     * 
     */
    private $candidatures;
    
    /**
     *
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\CVFichier", mappedBy="candidat",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")           
     * 
     */
    private $cvs;    
    
    /**
     *
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Lettre", mappedBy="candidat",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")           
     * 
     */
    private $lettres;    
    

    /**
     *
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Candidature", mappedBy="recruteur",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")           
     * @Exclude
     */
    private $cdtures_rec;    
    
    /**
     * @ORM\ManyToMany(targetEntity="EcoJob\RecruteurBundle\Entity\Offre",cascade={"persist"})
     * @Exclude    
     */
    private $postuled;

    public function getType() {
        return $this->type;
    }

    public function setType(\EcoJob\UserBundle\Entity\Type $type) {
        $this->type = $type;
        return $this;
    }

    /**
     * @CaptchaAssert\ValidCaptcha(
     *      message = "Validation CAPTCHA échouée, veuillez réessayer."
     * )
     */
    protected $captchaCode;

    public function getCaptchaCode() {
        return $this->captchaCode;
    }

    public function setCaptchaCode($captchaCode) {
        $this->captchaCode = $captchaCode;
    }

    public function __construct() {
        parent::__construct();
        $this->createdAt = new \DateTime();
    }

    /**
     * @ORM\Column(type="datetime",nullable=true)
     *
     * @var \DateTime
     */
    private $createdAt;

    /**
     * Get updatedAt
     *
     * @return \DateTime 
     */
    public function getCreatedAt() {
        return $this->createdAt;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return User
     */
    public function setCreatedAt($createdAt) {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Set curriculum
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $curriculum
     *
     * @return User
     */
    public function setCurriculum(\EcoJob\CandidatBundle\Entity\CuVi $curriculum = null) {
        $this->curriculum = $curriculum;

        return $this;
    }

    /**
     * Get curriculum
     *
     * @return \EcoJob\CandidatBundle\Entity\CuVi
     */
    public function getCurriculum() {
        return $this->curriculum;
    }

    /**
     * Add offre
     *
     * @param \EcoJob\RecruteurdeBundle\Entity\Offre $offre
     *
     * @return User
     */
    public function addOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre) {
        $this->offres[] = $offre;
        $offre->setRecruteur($this);
        return $this;
    }

    /**
     * Remove offre
     *
     * @param \EcoJob\RecruteurdeBundle\Entity\Offre $offre
     */

    /**
     * Get offres
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOffres() {
        return $this->offres;
    }

    /**
     * Remove offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     */
    public function removeOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre) {
        $this->offres->removeElement($offre);
    }

    /**
     * Add postuled
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $postuled
     *
     * @return User
     */
    public function addPostuled(\EcoJob\RecruteurBundle\Entity\Offre $postuled) {
        $this->postuled[] = $postuled;

        return $this;
    }

    /**
     * Remove postuled
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $postuled
     */
    public function removePostuled(\EcoJob\RecruteurBundle\Entity\Offre $postuled) {
        $this->postuled->removeElement($postuled);
    }

    /**
     * Get postuled
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPostuled() {
        $non_suspended_offre = array();
        foreach ($this->postuled as $offre) {
            if (!$offre->getSuspendu())
                $non_suspended_offre[] = $offre;
        }
        return $non_suspended_offre;
    }

    /**
     * Add candidature
     *
     * @param \EcoJob\CandidatBundle\Entity\Candidature $candidature
     *
     * @return User
     */
    public function addCandidature(\EcoJob\CandidatBundle\Entity\Candidature $candidature) {
        $this->candidatures[] = $candidature;

        return $this;
    }

    /**
     * Remove candidature
     *
     * @param \EcoJob\CandidatBundle\Entity\Candidature $candidature
     */
    public function removeCandidature(\EcoJob\CandidatBundle\Entity\Candidature $candidature) {
        $this->candidatures->removeElement($candidature);
    }

    /**
     * Get candidatures
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCandidatures() {
        return $this->candidatures;
    }


    /**
     * Add cdturesRec
     *
     * @param \EcoJob\CandidatBundle\Entity\Candidature $cdturesRec
     *
     * @return User
     */
    public function addCdturesRec(\EcoJob\CandidatBundle\Entity\Candidature $cdturesRec)
    {
        $this->cdtures_rec[] = $cdturesRec;
    
        return $this;
    }

    /**
     * Remove cdturesRec
     *
     * @param \EcoJob\CandidatBundle\Entity\Candidature $cdturesRec
     */
    public function removeCdturesRec(\EcoJob\CandidatBundle\Entity\Candidature $cdturesRec)
    {
        $this->cdtures_rec->removeElement($cdturesRec);
    }

    /**
     * Get cdturesRec
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCdturesRec()
    {
        return $this->cdtures_rec;
    }

    /**
     * Set canConsultCV
     *
     * @param boolean $canConsultCV
     *
     * @return User
     */
    public function setCanConsultCV($canConsultCV)
    {
        $this->canConsultCV = $canConsultCV;
    
        return $this;
    }

    /**
     * Get canConsultCV
     *
     * @return boolean
     */
    public function getCanConsultCV()
    {
        return $this->canConsultCV;
    }

    /**
     * Add cv
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFichier $cv
     *
     * @return User
     */
    public function addCv(\EcoJob\CandidatBundle\Entity\CVFichier $cv)
    {
        $this->cvs[] = $cv;
        $cv->setCandidat($this);
        return $this;
    }

    /**
     * Remove cv
     *
     * @param \EcoJob\CandidatBundle\Entity\CVFichier $cv
     */
    public function removeCv(\EcoJob\CandidatBundle\Entity\CVFichier $cv)
    {
        $this->cvs->removeElement($cv);
    }

    /**
     * Get cvs
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCvs()
    {
        return $this->cvs;
    }

    /**
     * Add lettre
     *
     * @param \EcoJob\CandidatBundle\Entity\Lettre $lettre
     *
     * @return User
     */
    public function addLettre(\EcoJob\CandidatBundle\Entity\Lettre $lettre)
    {
        $this->lettres[] = $lettre;
        $lettre->setCandidat($this);
        return $this;
    }

    /**
     * Remove lettre
     *
     * @param \EcoJob\CandidatBundle\Entity\Lettre $lettre
     */
    public function removeLettre(\EcoJob\CandidatBundle\Entity\Lettre $lettre)
    {
        $this->lettres->removeElement($lettre);
    }

    /**
     * Get lettres
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getLettres()
    {
        return $this->lettres;
    }
    
    public function getPercent(){
        $percent = 0;
        if($this->curriculum != NULL){  
            if($this->curriculum->getEtatCivil()!= NULL)
                $percent += 20;
            if($this->curriculum->getImage() != NULL)
                $percent += 10;
            if(count($this->curriculum->getFormations()) > 0)
                $percent += 20;
            if(count($this->curriculum->getExperiences()) > 0)
                $percent += 20;
            if(count($this->curriculum->getCompetences()) > 0)
                $percent += 20;  
            if(count($this->curriculum->getLangues()) > 0)
                $percent += 10;            
        }
        if($percent == 0){
            return 10;
        }
        return $percent;
    }
}

