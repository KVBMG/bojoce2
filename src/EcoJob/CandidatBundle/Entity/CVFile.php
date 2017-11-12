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
 * @ORM\Table(name="c_v_file")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\CVFileRepository")
 * @Vich\Uploadable
 */
class CVFile
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
     * @Vich\UploadableField(mapping="candidat_cv", fileNameProperty="cvName")
     *
     * @var File $cvFile
     */    
    private $cvFile;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     *
     * @var string
     */
    private $cvName;


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
    public function setCvFile(File $cv = null)
    {
        $this->cvFile = $cv;

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
    public function getCvFile()
    {
        return $this->cvFile;
    }        

}
