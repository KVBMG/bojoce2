<?php

namespace EcoJob\CandidatBundle\Repository;

/**
 * CandidatureRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class CandidatureRepository extends \Doctrine\ORM\EntityRepository
{
    public function isPostuled($offre_id,$user_id){
        $em = $this->getEntityManager();
        $dql = "SELECT c FROM EcoJobCandidatBundle:Candidature c
                WHERE c.candidat= :candidat_id AND c.offre = :offre_id";
           $offre = $em->createQuery($dql)
                ->setParameter('candidat_id', $user_id)
                ->setParameter('offre_id', $offre_id)
                ->setMaxResults(1)
                ->getResult();
            return empty($offre)? false : true;
    }

    public function findOffreCandidatures($offre_id, $offset) {
        $qb = $this->createQueryBuilder('c')
            ->select('c','c.id','u.id AS candidat_id','u.username AS candidat_username','u.email AS candidat_email')
            ->join('c.candidat','u')
            ->where('c.offre = :offre_id')
            ->setParameter('offre_id' , $offre_id)
            ->setFirstResult($offset)
            ->setMaxResults(10);
        return $qb->getQuery()->getArrayResult();
    }
}
