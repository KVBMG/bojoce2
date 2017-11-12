<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;

/**
 * Competence
 *
 * @ORM\Table(name="competence")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CompetenceRepository")
 */
class Competence
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
     * @ORM\Column(name="informatique", type="string", length=1000, nullable=false)
     * @Assert\NotBlank()
     */
    private $informatique;

    /**
     * @var string
     *
     * @ORM\Column(name="autres", type="string", length=1000, nullable=true)
     *
     */
    private $autres;


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
     * Set informatique
     *
     * @param string $informatique
     *
     * @return Competence
     */
    public function setInformatique($informatique)
    {
        $this->informatique = $informatique;
    
        return $this;
    }

    /**
     * Get informatique
     *
     * @return string
     */
    public function getInformatique()
    {
        return $this->informatique;
    }

    /**
     * Set autres
     *
     * @param string $autres
     *
     * @return Competence
     */
    public function setAutres($autres)
    {
        $this->autres = $autres;
    
        return $this;
    }

    /**
     * Get autres
     *
     * @return string
     */
    public function getAutres()
    {
        return $this->autres;
    }
}

