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
     * @ORM\Column(name="libelle", type="string", length=20)
     */
    private $libelle;


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
    public function __toString() {
        return $this->libelle;
    }
}

