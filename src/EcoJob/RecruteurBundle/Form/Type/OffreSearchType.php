<?php

namespace EcoJob\RecruteurBundle\Form\Type;

use EcoJob\RecruteurBundle\Model\OffreSearch;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class OffreSearchType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('contenu')
        ;
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        parent::setDefaultOptions($resolver);
        $resolver->setDefaults(array(
            // avoid to pass the csrf token in the url (but it's not protected anymore)
            'csrf_protection' => false,
            'data_class' => 'EcoJob\RecruteurBundle\Model\OffreSearch'
        ));
    }

    public function getName()
    {
        return 'offre_search_type';
    }
}