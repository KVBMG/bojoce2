<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;

class CuViType extends AbstractType {

    private $params;

    public function __construct($params) {
        $this->params = $params;
    }

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('nom', 'text', array('label' => 'Nom'))
                ->add('prenom', 'text', array('label' => 'Prénom'))
                ->add('poste', 'text', array('label' => 'Titre du poste'))
                ->add('latitude', HiddenType::class)
                ->add('longitude', HiddenType::class)
                ->add('localisation', 'text', array('label' => 'Où vous trouvez?'))
                ->add('telephone', 'text', array('label' => 'Téléphone'))
                ->add('experience', 'integer', array('attr' => array(
                        'min' => '1',
                        'max' => '50',
                        'value' => '1',
                    ), 'label' => 'Années d\'experience')
                )
                ->add('secteur', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                    'label' => 'Secteur d\'activité',
                    'expanded' => true,
                    'multiple' => true,
                    'choice_value' => function ($categorie) {
                        return $categorie->getId();
                    },
                    'choice_attr' => function($val, $key, $index) {
                        foreach ($this->params as $p) {
                            if ($p->getCategorie()->getId() == $val->getId()) {
                                return ['checked' => 'checked'];
                            }
                        }
                        return [];
                    },
                        )
                )
                ->add('about', TextareaType::class, array('label' => 'A propos de vous'))
                ->add('imageFile', 'file', array('attr' => array('accept' => 'image/*'), 'label' => 'Une photo de vous'))
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver) {
        $resolver->setDefaults(array(
            'data_class' => 'EcoJob\CandidatBundle\Entity\CuVi'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix() {
        return 'ecojob_candidatbundle_cuvi';
    }

}
