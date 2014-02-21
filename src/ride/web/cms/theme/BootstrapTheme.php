<?php

namespace ride\web\cms\theme;

use ride\library\cms\theme\Theme;
use ride\library\template\theme\BootstrapTheme as BootstrapTemplateTheme;

/**
 * Interface for a template theme
 */
class BootstrapTheme extends BootstrapTemplateTheme implements Theme {

    /**
     * Regions of this theme
     * @var unknown
     */
    protected $regions = array(
        'header' => 'header',
        'menu' => 'menu',
        'footer' => 'footer',
    );

    /**
     * Gets the display name of this theme
     * @return string
     */
    public function getDisplayName() {
        return ucfirst($this->getName());
    }

    /**
     * Checks if a region exists in this layout
     * @return boolean
     */
    public function hasRegion($region) {
        return isset($this->regions[$region]);
    }

    /**
     * Gets the regions for this theme
     * @return array Array with the region name as key and as value
     */
    public function getRegions() {
        return $this->regions;
    }

}