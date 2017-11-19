<?php

namespace EcoJob\RecruteurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;


class OffreType extends AbstractType {

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('titre','text',array('label' => "Titre de l'annonce"))
                ->add('reference','text',array('label' => "Référence de l'annonce"))
                ->add('contrat', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratType',
                    'label' => 'Contrat de travail',
                        )
                )
                ->add('duree','text',array('label' => "Durée, le cas échéant "))
                
                ->add('localisation')
                ->add('latitude', HiddenType::class)
                ->add('longitude', HiddenType::class)                
                ->add('experience', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:Experience',
                    'label' => 'Expérience requise',
                        )
                )               
                ->add('categorie', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                    'label' => 'Secteur d\'activité',
                   )
                )
                ->add('description', TextareaType::class, array('label' => 'Description du poste'))
                ->add('prerequis', TextareaType::class, array('label' => 'Pré-requis'))
                ->add('societe','text',array('label' => "Société qui recrute"))                                
                ->add('descSociete','text',array('label' => "Description de l'activité du société"))                
                ->add('expireAt', ChoiceType::class, array(  
                        'choices'  => array(
                            2 => '2 jours',
                            30 => '1 mois',
                            90 => '3 mois',
                            180 => '6 mois',
                            360 => '1 an',
                            
                        ),
                       'label' => "Validité de l'offre"
                      
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
