<?php

namespace EcoJob\CandidatBundle\Repository;

/**
 * CuViRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CuViRepository extends \Doctrine\ORM\EntityRepository {

    public function search($keywords, $experience, $nivFormation, $secteur, $offset, $limit) {

        $qb = $this->createQueryBuilder('c')
                ->where('c.showable =  true')
                ->setFirstResult($offset)
                ->setMaxResults($limit);
        if ($nivFormation != NULL) {
            $qb->join('c.formations', 'f', 'WITH', 'f.niveau = :niveau')
                    ->andWhere('f.niveau = :niveau')
                    ->setParameter('niveau', $nivFormation);
        }
        if ($secteur != NULL) {
            $qb->join('c.experiences', 'e', 'WITH', 'e.secteurActivite = :secteur')
                    ->andWhere('e.secteurActivite = :secteur')
                    ->setParameter('secteur', $secteur);
        }
        $keyswords = $keywords;
        if (strlen($keywords) > 0) {
            $tab = explode(" ", $keyswords);
            $qb->join('c.etatCivil', 'etc')
                    ->join('c.formations', 'fo')
                    ->join('c.competences', 'comp')
                    ->join('c.langues', 'langue')
                    ->join('c.experiences', 'exps')
                    ->innerJoin('exps.fonction', 'exps_fon')
                    ->innerJoin('exps.remuneration', 'exps_rem')
                    ->innerJoin('exps.typeClientele', 'exps_cli')
                    ->innerJoin('exps.secteurActivite', 'exps_sec')
                    ->innerJoin('fo.niveau', 'fo_niveau');


            if (count($tab) > 1) {
                for ($i = 0; $i < count($tab); $i++) {
                    if (!empty($tab[$i])) {
                        $tab[$i] = strtolower($tab[$i]);
                        $qb->andWhere("REGEXP(LOWER(etc.adresse), :query) = true OR REGEXP(LOWER(etc.adresse2) , :query) = true"
                                        . " OR REGEXP(LOWER(etc.ville), :query) = true"
                                        . " OR REGEXP(LOWER(fo.intituleDiplome), :query) = true OR REGEXP(LOWER(fo.specialisation), :query) = true"
                                        . " OR REGEXP(LOWER(fo.lieu), :query) = true OR REGEXP(LOWER(fo.etablissement), :query) = true"
                                        . " OR REGEXP(LOWER(comp.informatique), :query) = true OR REGEXP(LOWER(comp.autres), :query) = true"
                                        . " OR REGEXP(LOWER(langue.langue), :query) = true"
                                        . " OR REGEXP(LOWER(exps.poste), :query) = true OR REGEXP(LOWER(exps.societe), :query) = true"
                                        . " OR REGEXP(LOWER(exps.localisation), :query) = true OR REGEXP(LOWER(exps.zoneProspection), :query) = true"
                                        . " OR REGEXP(LOWER(exps.detailsMission), :query) = true"
                                        . " OR REGEXP(LOWER(exps_fon.libelle), :query) = true"
                                        . " OR REGEXP(LOWER(exps_rem.libelle), :query) = true"
                                        . " OR REGEXP(LOWER(exps_cli.libelle), :query) = true"
                                        . " OR REGEXP(LOWER(exps_sec.designation), :query) = true"
                                        . " OR REGEXP(LOWER(fo_niveau.libelle), :query) = true")
                                //->setParameter("regexp$i", "% $tab[$i] %")
                                ->setParameter("query", "$tab[$i]");
                    }
                }
            } else {
                $keyswords = strtolower($keyswords);
                $qb->andWhere("REGEXP(LOWER(etc.adresse), :query) = true OR REGEXP(LOWER(etc.adresse2) , :query) = true"
                                . " OR REGEXP(LOWER(etc.ville), :query) = true"
                                . " OR REGEXP(LOWER(fo.intituleDiplome), :query) = true OR REGEXP(LOWER(fo.specialisation), :query) = true"
                                . " OR REGEXP(LOWER(fo.lieu), :query) = true OR REGEXP(LOWER(fo.etablissement), :query) = true"
                                . " OR REGEXP(LOWER(comp.informatique), :query) = true OR REGEXP(LOWER(comp.autres), :query) = true"
                                . " OR REGEXP(LOWER(langue.langue), :query) = true"
                                . " OR REGEXP(LOWER(exps.poste), :query) = true OR REGEXP(LOWER(exps.societe), :query) = true"
                                . " OR REGEXP(LOWER(exps.localisation), :query) = true OR REGEXP(LOWER(exps.zoneProspection), :query) = true"
                                . " OR REGEXP(LOWER(exps.detailsMission), :query) = true"
                                . " OR REGEXP(LOWER(exps_fon.libelle), :query) = true"
                                . " OR REGEXP(LOWER(exps_rem.libelle), :query) = true"
                                . " OR REGEXP(LOWER(exps_cli.libelle), :query) = true"
                                . " OR REGEXP(LOWER(exps_sec.designation), :query) = true"
                                . " OR REGEXP(LOWER(fo_niveau.libelle), :query) = true")
                        ->setParameter("query", "$keyswords");
            }
        }
        if ($experience != NULL) {
            $qb->leftJoin('c.etatCivil', 'ex')
                    ->andWhere('ex.anneeExp = :exp')
                    ->setParameter('exp', $experience);
        }
        return $qb->getQuery()
                        ->useQueryCache(true)    // here
                        ->useResultCache(true)
                        ->getResult();                
    }

}
