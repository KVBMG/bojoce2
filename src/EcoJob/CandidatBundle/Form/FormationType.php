<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;


class FormationType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('anneeObtention',
                'Symfony\Component\Form\Extension\Core\Type\ChoiceType',[
                'choices' => $this->getYears(1960)
            ])
                ->add('niveau','entity', array(
                    'class' => 'EcoJobCandidatBundle:NiveauFormation',
                        'label' => 'Niveau de formation'))
                ->add('intituleDiplome','text',array('label'=>'Intitulé du diplôme'))
                ->add('specialisation')->add('lieu')->add('etablissement')
                ->add('detailsFormation', TextareaType::class, array('label' => 'Détails de la formation'))                
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

    private function getYears($min, $max='current')
    {
         $years = range($min, ($max === 'current' ? date('Y') : $max));

         return array_combine($years, $years);
    }
}
