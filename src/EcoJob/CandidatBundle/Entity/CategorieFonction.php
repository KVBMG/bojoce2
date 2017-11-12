<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation\Exclude;

/**
 * CategorieFonction
 *
 * @ORM\Table(name="categorie_fonction")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CategorieFonctionRepository")
 */
class CategorieFonction
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
     * @ORM\OneToMany(targetEntity="EcoJob\CandidatBundle\Entity\Fonction",mappedBy="categorieFonction",orphanRemoval=true)
     * @ORM\JoinColumn(onDelete="CASCADE")     
     * @Exclude     
     */
    private $fontions;    

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
     * @return CategorieFonction
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
        $this->fontions = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add fontion
     *
     * @param \EcoJob\CandidatBundle\Entity\Fonction $fontion
     *
     * @return CategorieFonction
     */
    public function addFontion(\EcoJob\CandidatBundle\Entity\Fonction $fontion)
    {
        $this->fontions[] = $fontion;
        $fontion->setCategorieFonction($this);
        return $this;
    }

    /**
     * Remove fontion
     *
     * @param \EcoJob\CandidatBundle\Entity\Fonction $fontion
     */
    public function removeFontion(\EcoJob\CandidatBundle\Entity\Fonction $fontion)
    {
        $this->fontions->removeElement($fontion);
    }

    /**
     * Get fontions
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getFontions()
    {
        return $this->fontions;
    }
    public function __toString() {
        return $this->libelle;
    }
}
