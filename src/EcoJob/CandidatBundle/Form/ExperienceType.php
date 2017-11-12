<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ExperienceType extends AbstractType {

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('dateDebut',  'date', [
                    'widget' => 'single_text',
                    'format' => 'dd/MM/yyyy',
                    'attr' => [
                        'class' => 'form-control input-inline datetimepicker',
                        'data-provide' => 'datepicker',
                        'data-format' => 'dd/MM/yyyy'
                    ]
                ])
                ->add('dateFin',  'date', [
                    'widget' => 'single_text',
                    'format' => 'dd/MM/yyyy',
                    'attr' => [
                        'class' => 'form-control input-inline datetimepicker',
                        'data-provide' => 'datepicker',
                        'data-format' => 'dd/MM/yyyy'
                    ]
                ])
                ->add('poste','text',array('label' => 'Titre du poste'))
                ->add('secteurActivite','entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                        'label' => "Secteur d'activité"))         
                ->add('fonction','entity', array(
                    'class' => 'EcoJobCandidatBundle:Fonction',
                        'label' => 'Fonction',
                        'group_by' => 'categorieFonction'))                
                ->add('societe','text',array('label' => 'Société'))
                ->add('localisation','text',array('label' => 'Localisation'))
                ->add('zoneProspection','text',array('label' => 'Zone de prospéction'))
                ->add('remuneration','entity', array(
                    'class' => 'EcoJobCandidatBundle:TypeRemuneration',
                        'label' => 'Rémunération'))
                ->add('typeClientele','entity', array(
                    'class' => 'EcoJobCandidatBundle:TypeClientele',
                        'label' => 'Type de la clientèle'))
                ->add('detailsMission', TextareaType::class, array('label' => 'Détails de la mission'));
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\Experience'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix() {
        return 'ecojob_candidatbundle_experience';
    }

}
