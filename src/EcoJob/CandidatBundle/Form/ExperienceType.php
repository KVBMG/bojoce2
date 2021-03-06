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
        $builder->add('dateDebut',  'birthday', array( 'label' => 'Date de début', 'years' => range(date('Y')-50, date('Y'))))
                ->add('dateFin',  'birthday', array( 'label' => 'Date fin', 'years' => range(date('Y')-50, date('Y'))))
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
