<?php

namespace EcoJob\RecruteurBundle\Entity\SearchRepository;

use FOS\ElasticaBundle\Repository;
use EcoJob\RecruteurBundle\Model\OffreSearch;

/**
 * This class contains all the elastica queries
 */
class OffreRepository extends Repository
{
    public function getQueryForSearch(OffreSearch $offreSearch)
    {
        // we create a query to return all the offres
        // but if the criteria contenu is specified, we use it
        if ($offreSearch->getContenu() !== null && $offreSearch != '') {
            $query = new \Elastica\Query\Match();
            $query->setFieldQuery('offre.contenu', $offreSearch->getContenu());
            $query->setFieldFuzziness('offre.contenu', 0.7);
            $query->setFieldMinimumShouldMatch('offre.contenu', '80%');
        } else {
            $query = new \Elastica\Query\MatchAll();
        }

        // then we create filters depending on the chosen criterias
        $boolQuery = new \Elastica\Query\Bool();
        $boolQuery->addMust($query);



        $query = new \Elastica\Query($boolQuery);
        $query->setSort(array(
            $offreSearch->getSort() => array(
                'order' => $offreSearch->getDirection()
            )
        ));

        return $query;
    }

    public function searchOffres(OffreSearch $offreSearch)
    {
        $query = $this->getQueryForSearch($offreSearch);

        return $this->find($query);
    }

}
