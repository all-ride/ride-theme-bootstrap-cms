<div class="widget widget-content-overview {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $title}
    <h3 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h3>
{/if}

{if $result}
    {foreach from=$result item="content"}
    <div class="content clearfix {cycle values="odd,even"}">
        {if $content->image}
        <div class="image">
            {if $content->url}
            <a href="{$content->url}">{image src=$content->image width=125 height=125 thumbnail="resize"}</a>
            {else}
            {image src=$content->image width=125 height=125 thumbnail="resize"}
            {/if}
        </div>
        {/if}
        <h3>{if $content->url}<a href="{$content->url}">{$content->title}</a>{else}{$content->title}{/if}</h3>
        <div class="teaser">{$content->teaser}</div>
    </div>
    {/foreach}

    {if $pagination}
        {pagination href=$pagination->getHref() pages=$pagination->getPages() page=$pagination->getPage()}
    {/if}

    {if $moreUrl}
    <a href="{$moreUrl}" class="more">{$moreLabel}</a>
    {/if}
{else}
    <p>{$emptyResultMessage|text}</p>
{/if}
</div>
