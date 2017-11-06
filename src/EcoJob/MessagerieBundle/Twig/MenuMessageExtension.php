<?php

namespace EcoJob\MessagerieBundle\Twig;


use Doctrine\ORM\EntityManager;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

class MenuMessageExtension extends \Twig_Extension
{
    private $em;
    private $token;

    public function __construct(EntityManager $entity, TokenStorageInterface $token)
    {
        $this->em = $entity;
        $this->token = $token;
    }

    public function getFilters(){
        return array(
            new \Twig_SimpleFilter('menu_message', array($this, 'menuMessage')),
        );
    }

    public function menuMessage($menu)
    {
        $user = $this->token->getToken()->getUser();
        $messagesRepository = $this->em->getRepository('EcoJobMessagerieBundle:Message');
        $query = $messagesRepository->createQueryBuilder('m')
            ->where('m.sender = :user OR m.receiver = :user')
            ->setParameter('user', $user)
            ->getQuery();
        $messages = $query->getResult();

        $messages_not_read = 0;

        foreach ($messages as $message){
            if ($message->getReceiver() == $user && !$message->getIsRead()){
                $messages_not_read += 1;
                continue;
            }

            foreach ($message->getSubMessages() as $subMessage){
                if ($subMessage->getReceiver() == $user && !$subMessage->getIsRead()) {
                    $messages_not_read += 1;
                    break;
                }
            }
        }

        $span = "";

        if ($messages_not_read > 0){
            $span = sprintf('<span style="background-color: #01a2a6;" class="badge">%1$s</span>', $messages_not_read);
        }

        return $menu. " " . $span;
    }
}