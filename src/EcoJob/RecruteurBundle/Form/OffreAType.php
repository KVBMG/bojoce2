<?php

namespace EcoJob\RecruteurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use EcoJob\UserBundle\Form\ImageType; 

class OffreAType extends AbstractType {

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('titre','text',array('label' => "Titre de l'annonce"))
                ->add('reference','text',array('label' => "Référence de l'annonce"))                
                ->add('societe','text',array('label' => "Société qui recrute"))   
                ->add('logo',new ImageType())
                ->add('bPresentation','text',array('label' => "Briève présentation"))                   
                ->add('description', TextareaType::class, array('label' => 'Description complète'))
                ->add('categorie', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                    'label' => 'Secteur d\'activité',
                   )
                )
                ->add('contrat', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratType',
                    'label' => 'Contrat de travail',
                        )
                )                  
                ->add('remuneration', 'entity', array(
                    'class' => 'EcoJobCandidatBundle:TypeRemuneration',
                    'label' => 'Rémunération',
                   )
                )   
                ->add('avantages', TextareaType::class, array('label' => 'Avantages éventuels'))                
                ->add('localisation')
                ->add('latitude', HiddenType::class)
                ->add('longitude', HiddenType::class)                   
                ->add('prerequis', TextareaType::class, array('label' => 'Qualités attendues de la part du candidat'))                             
                ->add('experience', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:Experience',
                    'label' => 'Expérience requise',
                        )
                )               
                ->add('niveauDiplome','text',array('label' => "Niveau de diplôme"))
                ->add('langues','text',array('label' => "Langue(s)"))                             
                ->add('descSociete',TextareaType::class,array('label' => "Description de l'activité de votre société"))                
                ->add('expireAt', ChoiceType::class, array(  
                        'choices'  => array(
                            2 => '2 jours',
                            3 => '3 jours',
                            7 => '7 jours',
                            14 => '14 jours',
                            30 => '1 mois',
                            60 => '2 mois',
                            90 => '3 mois'
                            
                        ),
                       'label' => "Durée de parution"
                      
                   )
                    
                );
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\RecruteurBundle\Entity\Offre'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix() {
        return 'ecojob_recruteurbundle_offre';
    }

}
