<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;


/**
 * Experience
 *
 * @ORM\Table(name="experience")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\ExperienceRepository")
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
     * @var \DateTime
     *
     * @ORM\Column(name="dateDebut", type="datetime")
     * @Assert\NotBlank()     
     */
    private $dateDebut;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="dateFin", type="datetime")
     * @Assert\NotBlank()
     */
    private $dateFin;

    /**
     * @var string
     *
     * @ORM\Column(name="poste", type="string", length=20)
     * @Assert\NotBlank()
     */
    private $poste;

    /**
     * @var string
     *
     * @ORM\Column(name="societe", type="string", length=15)
     * @Assert\NotBlank()
     */
    private $societe;

    /**
     * @var string
     *
     * @ORM\Column(name="localisation", type="string", length=15)
     * @Assert\NotBlank()
     */
    private $localisation;

    /**
     * @var string
     *
     * @ORM\Column(name="zoneProspection", type="string", length=15)
     * @Assert\NotBlank()
     */
    private $zoneProspection;

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\TypeRemuneration",inversedBy="experiences")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $remuneration;    

    /**
     * @var string
     *
     * @ORM\Column(name="detailsMission", type="string", length=1000)
     * @Assert\NotBlank()
     */
    private $detailsMission;

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\CuVi",inversedBy="experiences")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $cuvi;

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\TypeClientele",inversedBy="experiences")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $typeClientele;    
    
    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\RecruteurBundle\Entity\ContratCategorie",inversedBy="experiences")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $secteurActivite;
    
    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\Fonction",inversedBy="experiences")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $fonction;     

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
     * Set dateDebut
     *
     * @param \DateTime $dateDebut
     *
     * @return Experience
     */
    public function setDateDebut($dateDebut)
    {
        $this->dateDebut = $dateDebut;
    
        return $this;
    }

    /**
     * Get dateDebut
     *
     * @return \DateTime
     */
    public function getDateDebut()
    {
        return $this->dateDebut;
    }

    /**
     * Set dateFin
     *
     * @param \DateTime $dateFin
     *
     * @return Experience
     */
    public function setDateFin($dateFin)
    {
        $this->dateFin = $dateFin;
    
        return $this;
    }

    /**
     * Get dateFin
     *
     * @return \DateTime
     */
    public function getDateFin()
    {
        return $this->dateFin;
    }

    /**
     * Set poste
     *
     * @param string $poste
     *
     * @return Experience
     */
    public function setPoste($poste)
    {
        $this->poste = $poste;
    
        return $this;
    }

    /**
     * Get poste
     *
     * @return string
     */
    public function getPoste()
    {
        return $this->poste;
    }

    /**
     * Set societe
     *
     * @param string $societe
     *
     * @return Experience
     */
    public function setSociete($societe)
    {
        $this->societe = $societe;
    
        return $this;
    }

    /**
     * Get societe
     *
     * @return string
     */
    public function getSociete()
    {
        return $this->societe;
    }

    /**
     * Set localisation
     *
     * @param string $localisation
     *
     * @return Experience
     */
    public function setLocalisation($localisation)
    {
        $this->localisation = $localisation;
    
        return $this;
    }

    /**
     * Get localisation
     *
     * @return string
     */
    public function getLocalisation()
    {
        return $this->localisation;
    }

    /**
     * Set zoneProspection
     *
     * @param string $zoneProspection
     *
     * @return Experience
     */
    public function setZoneProspection($zoneProspection)
    {
        $this->zoneProspection = $zoneProspection;
    
        return $this;
    }

    /**
     * Get zoneProspection
     *
     * @return string
     */
    public function getZoneProspection()
    {
        return $this->zoneProspection;
    }

    /**
     * Set remuneration
     *
     * @param string $remuneration
     *
     * @return Experience
     */
    public function setRemuneration($remuneration)
    {
        $this->remuneration = $remuneration;
    
        return $this;
    }

    /**
     * Get remuneration
     *
     * @return string
     */
    public function getRemuneration()
    {
        return $this->remuneration;
    }

    /**
     * Set typeClientele
     *
     * @param string $typeClientele
     *
     * @return Experience
     */
    public function setTypeClientele($typeClientele)
    {
        $this->typeClientele = $typeClientele;
    
        return $this;
    }

    /**
     * Get typeClientele
     *
     * @return string
     */
    public function getTypeClientele()
    {
        return $this->typeClientele;
    }

    /**
     * Set detailsMission
     *
     * @param string $detailsMission
     *
     * @return Experience
     */
    public function setDetailsMission($detailsMission)
    {
        $this->detailsMission = $detailsMission;
    
        return $this;
    }

    /**
     * Get detailsMission
     *
     * @return string
     */
    public function getDetailsMission()
    {
        return $this->detailsMission;
    }

    /**
     * Set cuvi
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $cuvi
     *
     * @return Experience
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
     * Set secteurActivite
     *
     * @param \EcoJob\RecruteurBundle\Entity\ContratCategorie $secteurActivite
     *
     * @return Experience
     */
    public function setSecteurActivite(\EcoJob\RecruteurBundle\Entity\ContratCategorie $secteurActivite)
    {
        $this->secteurActivite = $secteurActivite;
    
        return $this;
    }

    /**
     * Get secteurActivite
     *
     * @return \EcoJob\RecruteurBundle\Entity\ContratCategorie
     */
    public function getSecteurActivite()
    {
        return $this->secteurActivite;
    }

    /**
     * Set fonction
     *
     * @param \EcoJob\CandidatBundle\Entity\Fonction $fonction
     *
     * @return Experience
     */
    public function setFonction(\EcoJob\CandidatBundle\Entity\Fonction $fonction)
    {
        $this->fonction = $fonction;
    
        return $this;
    }

    /**
     * Get fonction
     *
     * @return \EcoJob\CandidatBundle\Entity\Fonction
     */
    public function getFonction()
    {
        return $this->fonction;
    }
}
