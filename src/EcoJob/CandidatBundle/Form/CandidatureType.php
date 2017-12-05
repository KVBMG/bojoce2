<?php

namespace EcoJob\CandidatBundle\Form;

use Doctrine\DBAL\Types\StringType;
use Proxies\__CG__\EcoJob\CandidatBundle\Entity\CVFile;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CandidatureType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('description',TextareaType::class,array('attr' => array('class'=>'editor')))
            ->add('joinMyCv', CheckboxType::class, array(
                'required'=> false,
                'label' => 'Joindre mon CV'))//ecojob_candidatbundle_candidature_description
            ->add('cvFile', EmbeddedCv::class, array('label' => false));
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\Candidature'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'ecojob_candidatbundle_candidature';
    }


}
