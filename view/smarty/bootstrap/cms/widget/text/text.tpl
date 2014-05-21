<div class="widget widget-text row-fluid {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $title}
    <h2 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
{/if}
{if $image}
    {if $html}
    <div class="col-md-6">
        {if $imageAlignment == 'left'}
            {image src=$image}
        {else}
            {$html|text}
        {/if}
    </div>
    <div class="col-md-6">
        {if $imageAlignment == 'left'}
            {$html|text}
        {else}
            {image src=$image}
        {/if}
    </div>
    {else}
        {image src=$image}
    {/if}
{else}
    {$html|text}
{/if}
</div>
