<?php

namespace EcoJob\RecruteurBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ContratType
 *
 * @ORM\Table(name="contrat_type")
 * @ORM\Entity(repositoryClass="EcoJob\RecruteurBundle\Repository\ContratTypeRepository")
 */
class ContratType
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
     * @ORM\Column(name="libelle", type="string", length=10, unique=true)
     */
    private $libelle;

    /**
    * @ORM\OneToMany(targetEntity="EcoJob\RecruteurBundle\Entity\Offre",mappedBy="contrat",orphanRemoval=true)
    */    
    private $offres;        

    /**
     * Get id
     *
     * @return int
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
     * @return ContratType
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
    public function __toString()
    {
        return $this->libelle;
    }     
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->offres = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     *
     * @return ContratType
     */
    public function addOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre)
    {
        $this->offres[] = $offre;
        $offre->setContrat($this);
        return $this;
    }

    /**
     * Remove offre
     *
     * @param \EcoJob\RecruteurBundle\Entity\Offre $offre
     */
    public function removeOffre(\EcoJob\RecruteurBundle\Entity\Offre $offre)
    {
        $this->offres->removeElement($offre);
    }

    /**
     * Get offres
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOffres()
    {
        return $this->offres;
    }
}
