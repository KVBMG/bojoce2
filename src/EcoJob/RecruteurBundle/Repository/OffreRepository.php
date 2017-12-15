<?php

namespace EcoJob\RecruteurBundle\Repository;

/**
 * OffreRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class OffreRepository extends \Doctrine\ORM\EntityRepository {

    public function search($keyswords, $contrat, $datepubl, $secteur, $offset, $limit,$others) {

        $qb = $this->createQueryBuilder('o');
        $qb->where('o.valid = true')
                ->andWhere("DATE_FORMAT(DATE_ADD(o.validAt,o.expireAt,'DAY'),'%Y-%m-%d') >= DATE_FORMAT(CURRENT_DATE(),'%Y-%m-%d')")
                ->andWhere('o.suspendu = false')
                ->andWhere('o.modificationValided = true')
                ->orderBy('o.createdAt', 'DESC')
                ->setFirstResult($offset)
                ->setMaxResults($limit);
        if (!empty($keyswords)) {
            $tab = explode(" ", $keyswords);
            if (count($tab) > 1) {
                for ($i = 0; $i < count($tab); $i++) {
                    if (!empty($tab[$i])) {
                        $qb->andWhere("REGEXP(LOWER(o.reference), :regexp$i) = true OR REGEXP(LOWER(o.titre), :regexp$i) = true OR REGEXP(LOWER(o.description), :regexp$i) = true OR REGEXP(LOWER(o.societe), :regexp$i) = true OR REGEXP(LOWER(o.localisation), :regexp$i) = true")
                                ->setParameter("regexp$i", "$tab[$i]");
                    }
                }
            } else {
                $keyswords = strtolower($keyswords);
                $qb->andWhere('REGEXP(LOWER(o.titre), :query) = true OR REGEXP(LOWER(o.description), :query) = true OR REGEXP(LOWER(o.localisation), :query) = true '
                                . 'OR REGEXP(LOWER(o.societe), :query) = true OR REGEXP(LOWER(o.reference), :query) = true')
                        ->setParameter("query", "$keyswords");
            }
        }

        if ($datepubl > -1) {
            if ($datepubl == 0)
                $qb->andWhere("DATE_FORMAT(o.createdAt, '%Y-%m-%d') = DATE_FORMAT(CURRENT_DATE(),'%Y-%m-%d')");
            else {
                $qb->andWhere("DATE_FORMAT(o.createdAt, '%Y-%m-%d') BETWEEN DATE_FORMAT(DATE_SUB(CURRENT_DATE(),:value,'DAY'),'%Y-%m-%d') AND DATE_FORMAT(CURRENT_DATE(),'%Y-%m-%d')")
                        ->setParameter('value', $datepubl);
            }
        }
        if ($contrat != 0) {
            $qb->andWhere('o.contrat = :contrat')
                    ->setParameter('contrat', $contrat);
        }
        if ($secteur != 0) {
            $qb->andWhere('o.categorie = :secteur')
                    ->setParameter('secteur', $secteur);
        }
        if ($others['avantages'] != "") {
            $qb->andWhere('REGEXP(LOWER(o.avantages), :avantages) = true')
                    ->setParameter('avantages', $others['avantages']);
        }
        if ($others['localisation'] != "") {
            $qb->andWhere('REGEXP(LOWER(o.localisation), :localisation) = true')
                    ->setParameter('localisation', $others['localisation']);
        }
        if ($others['langues'] != "") {
            $qb->andWhere('REGEXP(LOWER(o.langues), :langues) = true')
                    ->setParameter('langues', $others['langues']);
        }
        if ($others['niveauDiplome'] != "") {
            $qb->andWhere('REGEXP(LOWER(o.niveauDiplome), :niveauDiplome) = true')
                    ->setParameter('niveauDiplome', $others['niveauDiplome']);
        }
        if ($others['prerequis'] != "") {
            $qb->andWhere('REGEXP(LOWER(o.prerequis), :prerequis) = true')
                    ->setParameter('prerequis', $others['prerequis']);
        }        
        return $qb->getQuery()
                        ->useQueryCache(true)    // here
                        ->useResultCache(true)
                        ->getResult();
    }

    public function search2($keywords, $contrat, $experience) {
        return $this->createQueryBuilder('o')
                        ->addSelect("MATCH_AGAINST (o.titre, :keywords 'IN NATURAL MODE') as score")
                        ->add('where', 'MATCH_AGAINST(o.titre, :keywords) > 0.8')
                        ->setParameter('keywords', $keywords)
                        ->getQuery()
                        ->getResult();
    }

    public function prepareKeywords($chaine) {
        $tab = explode(" ", $chaine);
        $final = "(?=.*";
        if (count($tab) != 0) {
            for ($i = 0; $i < count($tab); $i++) {
                $final = $final . $tab[$i];
                if (($i + 1 < (count($tab))) && (!empty($tab[$i + 1]))) {
                    $final = $final . ")(?=.*";
                }
            }
            $final = $final . ")";
        }
        return $final;
    }

    public function getCreatedHier($id_categorie) {
        $hier = date('Y-m-d', strtotime('-1 days'));
        $qb = $this->createQueryBuilder('o')
                ->where('o.categorie = :id_categorie')
                ->andWhere('o.valid = true')
                ->andWhere('o.suspendu = false')
                ->andWhere('DATE_FORMAT(o.validAt,\'%Y-%m-%d\') = :hier');
        $qb->setParameter('id_categorie', $id_categorie)
                ->setParameter('hier', $hier);
        return $qb->getQuery()
                        ->getResult();
    }

    public function getExpiredNow() {
        $qb = $qb = $this->createQueryBuilder('o')
                ->where("DATE_FORMAT(DATE_ADD(o.validAt,o.expireAt,'DAY'),'%Y-%m-%d') <= DATE_FORMAT(CURRENT_DATE(),'%Y-%m-%d')")
                ->andWhere("o.suspendu = false");
        return $qb->getQuery()->getResult();
    }

    public function findROArray($recruteur_id, $offset) {
        $qb = $this->createQueryBuilder('o')
                ->where('o.recruteur = :recruteur_id')
                ->setParameter('recruteur_id', $recruteur_id)
                ->setFirstResult($offset)
                ->setMaxResults(10);
        return $qb->getQuery()->getArrayResult();
    }

    public function findCustomOffre() {
        $qb = $this->createQueryBuilder('o')
                ->select('o.id', 'o.titre', 'c.designation AS categorie_designation', 'o.validAt', 'o.createdAt', 'r.username AS recruteur_username', 'r.email AS recruteur_email')
                ->join('o.recruteur', 'r')
                ->join('o.categorie', 'c');
        return $qb->getQuery()->getArrayResult();
    }

    public function getNonValideOffers() {
        $qb = $qb = $this->createQueryBuilder('o')
                ->where("o.valid = false")
                ->orderBy('o.createdAt', 'DESC');
        return $qb->getQuery()->getResult();
    }

    public function getSuspendedOffres() {
        $qb = $qb = $this->createQueryBuilder('o')
                ->where("o.suspendu = true")
                ->orderBy('o.suspenduAt', 'DESC');
        return $qb->getQuery()->getResult();
    }

}
