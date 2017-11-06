<?php

namespace EcoJob\AdminBundle\Command;


use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class SuspendreCommand extends ContainerAwareCommand
{
    protected function configure()
    {
            $this->setName('suspendre:offre');
            $this->setDescription('Suspendre tous les offres expirés');
            $this->setHelp("Commande app/console suspendre:offre -h");
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $alert_mail = $this->getContainer()->get('eco_job_admin.suspendre_offre');
        $alert_mail->run();
    }
}