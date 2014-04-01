<div class="widget widget-content-overview {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $title}
    <h3 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h3>
{/if}

{if $result}
    <ul>
    {foreach from=$result item="content"}
        <li>{if $content->url}<a href="{$content->url}">{$content->title}</a>{else}{$content->title}{/if}</li>
    {/foreach}
    </ul>

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
