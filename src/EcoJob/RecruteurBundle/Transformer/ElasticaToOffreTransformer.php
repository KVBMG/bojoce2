<?php

namespace EcoJob\RecruteurBundle\Transformer;

use FOS\ElasticaBundle\Doctrine\AbstractElasticaToModelTransformer;
use Doctrine\ORM\Query;
use Elastica\Document;
use FOS\ElasticaBundle\Transformer\ModelToElasticaTransformerInterface;
use Symfony\Component\PropertyAccess\PropertyAccessorInterface;


class ElasticaToOffreTransformer implements ModelToElasticaTransformerInterface
{
    /**
     * Transforme un offre en object elasticsearch avec les clés requises
     *
     * @param offre $offre the object to convert
     * @param array  $fields the keys we want to have in the returned array
     *
     * @return Document
     **/
    public function transform($offre, array $fields)
    {
        $identifier = $offre->getId();

        // ici nous formatons la date, encore une fois, cela devrait être fait dans le getter
        $experience = $offre->getExperience();


        $values = array(
            'id' => $offre->getId(),
            'contrat' => $offre->getContrat()->__toString(),
            'experience' => $offre->getExperience(),
            'contenu' => $offre->getContenu(),
            'titre' => $offre->getTitre(),
        );

        // Crée le document à indexer
        $document = new Document($identifier,$values);
        $document->setParent($offre->getContrat()->getId());

        return $document;
    }
}
