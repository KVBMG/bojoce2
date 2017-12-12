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

class CandidatureTType extends AbstractType {

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $user = $options['user'];
        $builder
                ->add('lettre', 'entity', array(
                    'label' => "Lettre de motivation",
                    'class' => 'EcoJob\CandidatBundle\Entity\Lettre',
                    'property' => 'titre',
                    'query_builder' => function ($eer) use ($user) {
                        return $eer
                                ->createQueryBuilder('l')
                                ->where('l.candidat = :candidat')
                                ->setParameter('candidat', $user);
                    }))
                ->add('cvfichier', 'entity', array(
                    'label' => "Lettre de motivation",
                    'class' => 'EcoJob\CandidatBundle\Entity\CVFichier',
                    'property' => 'titre',
                    'query_builder' => function ($eer) use ($user) {
                        return $eer
                                ->createQueryBuilder('c')
                                ->where('c.candidat = :candidat')
                                ->setParameter('candidat', $user);
                    }))
                ->add('description', TextareaType::class,array('attr' => array('class'=>'editor ','label'=>"Un petit texte")))
                  ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\CandidatureT',
            'user' => ""
        ));
     
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix() {
        return 'ecojob_candidatbundle_candidaturet';
    }


}
