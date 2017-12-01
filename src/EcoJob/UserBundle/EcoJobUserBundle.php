<?php

namespace EcoJob\UserBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class EcoJobUserBundle extends Bundle
{
    public function getParent()
    {
        return 'FOSUserBundle';
    }
}
