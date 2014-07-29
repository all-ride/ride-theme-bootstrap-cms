<div class="widget widget-text row-fluid {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $title}
    <h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
{/if}
{if $subtitle}
    <h3 class="toc {$app.cms.properties->getWidgetProperty('style.subtitle')}">{$subtitle}</h3>
{/if}
{if $image}
    {if $html}
    <div class="col-md-6">
        {if $imageAlignment == 'left'}
            <img src="{image src=$image}" />
        {else}
            {$html|text}
            {foreach $callToActions as $callToAction}
                <a href="{$callToAction->getUrl()}" class="btn btn-default cta{if $callToAction->getIcon()} cta-{$callToAction->getIcon()}{/if}">{$callToAction->getLabel()}</a>
            {/foreach}
        {/if}
    </div>
    <div class="col-md-6">
        {if $imageAlignment == 'left'}
            {$html|text}
            {foreach $callToActions as $callToAction}
                <a href="{$callToAction->getUrl()}" class="btn btn-default cta{if $callToAction->getIcon()} cta-{$callToAction->getIcon()}{/if}">{$callToAction->getLabel()}</a>
            {/foreach}
        {else}
            <img src="{image src=$image}" />
        {/if}
    </div>
    {else}
        <img src="{image src=$image}" />
    {/if}
{else}
    {$html|text}
    {foreach $callToActions as $callToAction}
        <a href="{$callToAction->getUrl()}" class="btn btn-default cta{if $callToAction->getType()} cta-{$callToAction->getType()}{/if}">{$callToAction->getLabel()}</a>
    {/foreach}
{/if}
</div>
