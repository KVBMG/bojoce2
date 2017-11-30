<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use \EcoJob\RecruteurBundle\Entity\ContratCategorie;
use \EcoJob\UserBundle\Entity\User;
use JMS\Serializer\Annotation\Exclude;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * ParamCandidat
 *
 * @ORM\Table(name="param_candidat")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\ParamCandidatRepository")
 */
class ParamCandidat
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
    * @ORM\ManyToOne(targetEntity="EcoJob\UserBundle\Entity\User")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */       
    private $candidat;

     /**
    * @ORM\ManyToOne(targetEntity="EcoJob\RecruteurBundle\Entity\ContratCategorie")
    * @Exclude 
    */  
    private $categorie;


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
     * Set candidat
     *
     * @param \EcoJob\UserBundle\Entity\User $candidat
     *
     * @return ParamCandidat
     * 
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
     * Set categorie
     *
     * @param \EcoJob\RecruteurBundle\Entity\ContratCategorie $categorie
     *
     * @return ParamCandidat
     */
    public function setCategorie($categorie)
    {
        $this->categorie = $categorie;

        return $this;
    }

    /**
     * Get categorie
     *
     * @return \EcoJob\RecruteurBundle\Entity\ContratCategorie
     */
    public function getCategorie()
    {
        return $this->categorie;
    }
}
