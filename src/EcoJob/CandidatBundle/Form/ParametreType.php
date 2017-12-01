<?php

namespace EcoJob\CandidatBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;


class ParametreType extends AbstractType {
    
    private $params;
            
    public function __construct($params){
        $this->params = $params;
    }
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options) {
        $builder->add('categorie', 'entity', array(
                    'class' => 'EcoJobRecruteurBundle:ContratCategorie',
                    'label' => 'Secteur d\'activité',
                    'expanded' => true,
                    'multiple' => true,
                    'choice_value' => function ($categorie) {
                          return $categorie->getId();
                    },
                    'choice_attr' => function($val, $key, $index) {
                        foreach($this->params as $p){
                            if($p->getCategorie()->getId() == $val->getId()){
                                return ['checked' => 'checked'];
                            }
                        }
                        return [];
                    },
                    
  
                   )
        );
    }

  
}
