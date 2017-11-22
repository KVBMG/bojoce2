<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EtatCivilType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('nom', 'text', array('label' => 'Nom','attr'=>array('class'=>'col-sm-5')))
                ->add('prenom', 'text', array('label' => 'Prénom'))
                ->add('dateNaissance',  'birthday', array( 'label' => 'Date de naissance', 'years' => range(date('Y')-50, date('Y'))))

                ->add('nationalite','text',array('label' =>"Nationalité"))
                ->add('email')
                ->add('telephone','text',array('label'=>'Téléphone Mobile'))
                ->add('telephoneFixe','text',array('label'=>'Téléphone Fixe'))
                ->add('adresse','text',array('label'=>'Adresse'))
                ->add('adresse2','text',array('label'=>'Adresse 2'))
                ->add('cp','text',array('label'=>'Code postal'))
                ->add('ville','text',array('label'=>'Ville'))
                ->add('anneeExp','entity', array(
                    'class' => 'EcoJobRecruteurBundle:Experience',
                        'label' => "Année d'experience"))                
                ;
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\EtatCivil'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'ecojob_candidatbundle_etatcivil';
    }


}
