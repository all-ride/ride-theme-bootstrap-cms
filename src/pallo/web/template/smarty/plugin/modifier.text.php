<?php

use pallo\library\cms\content\TextParser;

function smarty_modifier_text($string) {
    static $textParser;

    if (!$textParser) {
        global $system;

        $dependencyInjector = $system->getDependencyInjector();

        $smartyEngine = $dependencyInjector->get('pallo\\library\\template\\engine\\Engine', 'smarty');
        $smartyEngine = $smartyEngine->getSmarty();

        $app = $smartyEngine->getTemplateVars('app');

        $locale = 'en';
        if (isset($app['locale'])) {
            $locale = $app['locale'];
        }

        $nodeModel = $dependencyInjector->get('pallo\\library\\cms\\node\\NodeModel');

        $textParser = new TextParser($nodeModel, $app['cms']['node'], $locale, $app['url']['script']);
    }

    return $textParser->parseText($string);
}