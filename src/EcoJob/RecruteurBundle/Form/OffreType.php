<?php

namespace EcoJob\RecruteurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class OffreType extends AbstractType {

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('titre')->add('contenu')->add('experience', 'integer', array('attr' => array(
                        'min' => '1',
                        'max' => '50',
                        'value' => '1',
            )))
                ->add('localisation')
                ->add('latitude', HiddenType::class)
                ->add('longitude', HiddenType::class)                
                ->add('contrat', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratType',
                    'label' => 'Type de contrat',
                        )
                )
                
                ->add('categorie', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                    'label' => 'Secteur d\'activité',
                   )
                )
                  ->add('expireAt', ChoiceType::class, array(  
                        'choices'  => array(
                            2 => '2 jours',
                            30 => '1 mois',
                            90 => '3 mois',
                            180 => '6 mois',
                            360 => '1 an',
                            
                        ),
                       'label' => 'Validité'
                      
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
