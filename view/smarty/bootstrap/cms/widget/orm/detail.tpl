<div class="widget widget-content-detail {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <div class="content clearfix">
        {if $content->image}
        <div class="image">
            {image src=$content->image width=125 height=125 thumbnail="resize"}
        </div>
        {/if}
        {if !$properties->getTitle()}
            <h3 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$content->title}</h3>
        {/if}
        <div class="teaser">{$content->teaser}</div>
    </div>
</div>
