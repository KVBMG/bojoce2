<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;


/**
 * Langue
 *
 * @ORM\Table(name="langue")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\LangueRepository")
 */
class Langue
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
     * @ORM\Column(name="langue", type="string", length=10)
     * @Assert\NotBlank()
     */
    private $langue;

    /**
     * @var string
     *
     * @ORM\Column(name="niveau", type="string", length=10)
     * @Assert\NotBlank()
     */
    private $niveau;

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\CandidatBundle\Entity\CuVi",inversedBy="langues")
    * @ORM\JoinColumn(nullable=false,onDelete="CASCADE")
    * @Exclude    
    */    
    private $cuvi; 
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
     * Set langue
     *
     * @param string $langue
     *
     * @return Langue
     */
    public function setLangue($langue)
    {
        $this->langue = $langue;
    
        return $this;
    }

    /**
     * Get langue
     *
     * @return string
     */
    public function getLangue()
    {
        return $this->langue;
    }

    /**
     * Set niveau
     *
     * @param string $niveau
     *
     * @return Langue
     */
    public function setNiveau($niveau)
    {
        $this->niveau = $niveau;
    
        return $this;
    }

    /**
     * Get niveau
     *
     * @return string
     */
    public function getNiveau()
    {
        return $this->niveau;
    }

    /**
     * Set cuvi
     *
     * @param \EcoJob\CandidatBundle\Entity\CuVi $cuvi
     *
     * @return Langue
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
}
