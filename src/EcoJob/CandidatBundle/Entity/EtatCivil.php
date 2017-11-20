<?php

namespace EcoJob\CandidatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Exclude;

/**
 * EtatCivil
 *
 * @ORM\Table(name="etat_civil")
 * @ORM\Entity(repositoryClass="EcoJob\CandidatBundle\Repository\EtatCivilRepository")
 * @UniqueEntity("email") 
 */
class EtatCivil
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
     * @ORM\Column(name="nom", type="string", length=18,nullable=true)
     * @Assert\Regex("/^[a-zA-Z0-9éèếûùô ]+$/",
     *     pattern=true,
     *     message="Cette valeur ne doit pas contenir des métacaractères."
     * )   
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="string", length=10,nullable=true)
     *
     * @Assert\Regex("/^[a-zA-Z0-9éèếûùô ]+$/",
     *     pattern=true,
     *     message="Cette valeur ne doit pas contenir des métacaractères."
     * )    
     */
    private $prenom;

    /**
     * @ORM\Column(type="date",nullable=true)
     *
     * @var \DateTime
     */
    private $dateNaissance;
    /**
     * @var string
     *
     * @ORM\Column(name="nationalite", type="string", length=10,nullable=true)
     *
     * @Assert\Regex("/^[a-zA-Z0-9éèếûùô ]+$/",
     *     pattern=true,
     *     message="Cette valeur ne doit pas contenir des métacaractères."
     * )    
     */
    private $nationalite;  
    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=30,nullable=true)
     *    
     * @Assert\Email(
     *     message = "L'adresse email '{{ value }}' n'est pas valide.",
     * )
     */      
    private $email;    
    /**
     * @var int
     *
     * @ORM\Column(name="telephone", type="integer",nullable=true)
     * 
     * @Assert\Regex("/^[0-9 ]+$/") 
     * @Assert\Regex(
     *     pattern="/\t | \b/",
     *     match=false,
     *     message="Espace blanc ou tabulation non-autorisé"
     * )        
     */
    private $telephone;
    /**
     * @var int
     *
     * @ORM\Column(name="telephoneFixe", type="integer",nullable=true,nullable=true)
     * 
     * @Assert\Regex("/^[0-9 ]+$/") 
     * @Assert\Regex(
     *     pattern="/\t | \b/",
     *     match=false,
     *     message="Espace blanc ou tabulation non-autorisé"
     * )        
     */
    private $telephoneFixe;
    
    /**
     * @var string $adresse
     *
     * @ORM\Column(name="adresse", type="string", length=30,nullable=true)
     */
    protected $adresse;    
    /**
     * @var string $adresse2
     *
     * @ORM\Column(name="adresse2", type="string", length=30,nullable=true)
     */
    protected $adresse2;     
    /**
     * @var string $cp
     *
     * @ORM\Column(name="cp", type="string", length=10,nullable=true)
     */
    protected $cp;    
    /**
     * @var string $ville
     *
     * @ORM\Column(name="ville", type="string", length=10,nullable=true)
     */
    protected $ville;     

    /**
    * @ORM\ManyToOne(targetEntity="EcoJob\RecruteurBundle\Entity\Experience",inversedBy="ets")
    * @ORM\JoinColumn(nullable=true,onDelete="CASCADE")
    * @Exclude    
    */    
    private $anneeExp;
    
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
     * Set nom
     *
     * @param string $nom
     *
     * @return CuVi
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
    
        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set prenom
     *
     * @param string $prenom
     *
     * @return CuVi
     */
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    
        return $this;
    }

    /**
     * Get prenom
     *
     * @return string
     */
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * Set dateNaissance
     *
     * @param \DateTime $dateNaissance
     *
     * @return CuVi
     */
    public function setDateNaissance($dateNaissance)
    {
        
        $this->dateNaissance = $dateNaissance;
    
        return $this;
    }

    /**
     * Get dateNaissance
     *
     * @return \DateTime
     */
    public function getDateNaissance()
    {
        return $this->dateNaissance;
    }

    /**
     * Set nationalite
     *
     * @param string $nationalite
     *
     * @return CuVi
     */
    public function setNationalite($nationalite)
    {
        $this->nationalite = $nationalite;
    
        return $this;
    }

    /**
     * Get nationalite
     *
     * @return string
     */
    public function getNationalite()
    {
        return $this->nationalite;
    }

    /**
     * Set email
     *
     * @param string $email
     *
     * @return CuVi
     */
    public function setEmail($email)
    {
        $this->email = $email;
    
        return $this;
    }

    /**
     * Get email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set telephone
     *
     * @param integer $telephone
     *
     * @return CuVi
     */
    public function setTelephone($telephone)
    {
        $this->telephone = $telephone;
    
        return $this;
    }

    /**
     * Get telephone
     *
     * @return integer
     */
    public function getTelephone()
    {
        return $this->telephone;
    }

    /**
     * Set telephoneFixe
     *
     * @param integer $telephoneFixe
     *
     * @return CuVi
     */
    public function setTelephoneFixe($telephoneFixe)
    {
        $this->telephoneFixe = $telephoneFixe;
    
        return $this;
    }

    /**
     * Get telephoneFixe
     *
     * @return integer
     */
    public function getTelephoneFixe()
    {
        return $this->telephoneFixe;
    }

    /**
     * Set adresse
     *
     * @param string $adresse
     *
     * @return CuVi
     */
    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    
        return $this;
    }

    /**
     * Get adresse
     *
     * @return string
     */
    public function getAdresse()
    {
        return $this->adresse;
    }

    /**
     * Set adresse2
     *
     * @param string $adresse2
     *
     * @return CuVi
     */
    public function setAdresse2($adresse2)
    {
        $this->adresse2 = $adresse2;
    
        return $this;
    }

    /**
     * Get adresse2
     *
     * @return string
     */
    public function getAdresse2()
    {
        return $this->adresse2;
    }

    /**
     * Set cp
     *
     * @param string $cp
     *
     * @return CuVi
     */
    public function setCp($cp)
    {
        $this->cp = $cp;
    
        return $this;
    }

    /**
     * Get cp
     *
     * @return string
     */
    public function getCp()
    {
        return $this->cp;
    }

    /**
     * Set ville
     *
     * @param string $ville
     *
     * @return CuVi
     */
    public function setVille($ville)
    {
        $this->ville = $ville;
    
        return $this;
    }

    /**
     * Get ville
     *
     * @return string
     */
    public function getVille()
    {
        return $this->ville;
    }
    /**
     * Set anneExp
     *
     * @param \EcoJob\RecruteurBundle\Entity\Experience $anneExp
     *
     * @return CuVi
     */
    public function setAnneeExp(\EcoJob\RecruteurBundle\Entity\Experience $anneExp)
    {
        $this->anneeExp = $anneExp;
    
        return $this;
    }

    /**
     * Get anneExp
     *
     * @return \EcoJob\RecruteurBundle\Entity\Experience
     */
    public function getAnneeExp()
    {
        return $this->anneeExp;
    }    
}
