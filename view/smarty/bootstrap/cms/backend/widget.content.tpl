<div class="widget page-widget{if isset($inheritedWidgets[$widgetId])} inherited{/if} clearfix" id="page-widget-{$widgetId}">
    <div class="widget-actions">
        <div class="icon dropdown">
            <a href="#" class="dropdown-toggle">
                {image src=$widget->getIcon() default="img/widget.png"}
            </a>
            <ul class="dropdown-menu">
            {if $widget->getPropertiesCallback()}
                <li><a href="{$baseAction}/widget/{$widgetId}/properties" class="properties">{translate key="button.properties"}</a></li>
            {/if}
                <li><a href="{$baseAction}/widget/{$widgetId}/cache" class="cache">{translate key="button.cache"}</a></li>
            {if $widget->getTemplates()}
                <li><a href="{$baseAction}/widget/{$widgetId}/templates" class="templates">{translate key="button.templates"}</a></li>
            {/if}
                <li class="divider"></li>
                <li><a href="{$baseAction}/widget/{$widgetId}/delete" class="delete">{translate key="button.delete"}</a></li>
            </ul>
        </div>
        
        <div class="handle">
            {image class="handle" src="img/cms/handle.png"}
        </div>
    </div>
    <div class="widget-info clearfix">
    {$name = $widget->getName()}
    {if $widget->getPropertiesCallback()}
        <a class="name" href="{$baseAction}/widget/{$widgetId}/properties">{translate key="widget.`$name`"}</a>
    {else}
        <span class="name">{translate key="widget.`$name`"}</span>
    {/if}

    {if $widget->getPropertiesCallback()}
    <div class="preview">
        {$widget->getPropertiesPreview()}
    </div>
    {/if}
    </div>
</div>