<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class FormationType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('anneeObtention',  'integer', [
                    'attr' => [
                        'min'=>1960,
                        'default' => 1960,
                        'label'=>"Année d'obtention"
                    ]
                ])
                ->add('niveau','entity', array(
                    'class' => 'EcoJobCandidatBundle:NiveauFormation',
                        'label' => 'Niveau de formation'))
                ->add('intituleDiplome','text',array('label'=>'Intitulé du diplôme'))
                ->add('specialisation')->add('lieu')->add('etablissement')
                ->add('formationEtranger','checkbox',array('label'=>"Formation à l'étranger"));
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\Formation'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'ecojob_candidatbundle_formation';
    }


}
