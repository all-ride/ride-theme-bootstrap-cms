<div class="widget page-widget{if isset($inheritedWidgets[$widgetId])} inherited{/if} clearfix" id="page-widget-{$widgetId}">
    <div class="widget-actions">
        <div class="icon dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="{image src=$widget->getIcon() default="img/widget.png"}" />
            </a>
            <ul class="dropdown-menu">
            {$actionsAvailable = false}
            {foreach $actions as $actionName => $action}
                {if $action->isAvailableForWidget($node, $widget)}
                    {url var="actionUrl" id=$action->getRoute() parameters=["site" => $site->getId(), "node" => $node->getId(), "locale" => $locale, "region" => $region, "widget" => $widgetId]}
                    {isGranted url=$actionUrl}
                        {$actionsAvailable = true}
                        <li>
                            <a href="{$actionUrl}?referer={$app.url.request|urlencode}">
                                {translate key="label.widget.action.`$actionName`"}
                            </a>
                        </li>
                    {/isGranted}
                {/if}
            {/foreach}

            {url var="actionUrl" id="cms.node.layout.widget.delete" parameters=["site" => $site->getId(), "node" => $node->getId(), "locale" => $locale, "region" => $region, "widget" => $widgetId]}
            {isGranted url=$actionUrl}
                {if $actionsAvailable}
                    <li class="divider"></li>
                {/if}
                    <li>
                        <a class="delete" href="{$actionUrl}?referer={$app.url.request|urlencode}">
                            {translate key="button.delete"}
                        </a>
                    </li>
                </ul>
            {/isGranted}
        </div>

        <div class="handle">
            <img src="{image src="img/cms/handle.png"}" class="handle" />
        </div>
    </div>
    <div class="widget-info clearfix">
    {$name = $widget->getName()}
    {if $widget->getPropertiesCallback()}
        <a class="name" href="{url id="cms.widget.properties" parameters=["site" => $site->getId(), "node" => $node->getId(), "locale" => $locale, "region" => $region, "widget" => $widgetId]}">
            {translate key="widget.`$name`"}
        </a>
    {else}
        <span class="name">{translate key="widget.`$name`"}</span>
    {/if}

        <div class="preview">
            {$widget->getPropertiesPreview()}
        </div>
    </div>
</div>
