<?php

namespace EcoJob\CandidatBundle\Command;
use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\ConsoleInput\InputArgument;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Output\Output;
use Sensio\Bundle\GeneratorBundle\Command\Helper\DialogHelper;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
class AddFulltextIndexesCommand extends ContainerAwareCommand
{
    public function configure()
    {
        $this->setName('project:build-fulltext');
        $this->setDescription('Crée les champs fulltext pour rétablir la recherche');
    }
    public function execute(InputInterface $input, OutputInterface $output)
    {
        $connection = $this->getContainer()->get('doctrine')->getConnection();
        $dialog = $this->getDialogHelper();
        $dialog->writeSection($output, 'Création des liens pour la table Address');
        $connection->query("ALTER TABLE `xxx`.`Address` ADD FULLTEXT `search_indexes` ( `name` , `street` , `postal` , `city` , `state` , `country` )");
        $dialog->writeSection($output, 'Terminé.');
    }
    protected function getDialogHelper()
    {
        $dialog = $this->getHelperSet()->get('dialog');
        if (!$dialog || get_class($dialog) !== 'Sensio\Bundle\GeneratorBundle\Command\Helper\DialogHelper') {
            $this->getHelperSet()->set($dialog = new DialogHelper());
        }
        return $dialog;
    }
}
