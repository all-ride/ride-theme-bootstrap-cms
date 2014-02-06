<div class="contentDetail" id="widget-{$widgetId}">
    <div class="content clearfix">
        {if $content->image}
        <div class="image">
            {image src=$content->image width=125 height=125 thumbnail="resize"}
        </div>
        {/if}
        {if !$properties->getTitle()}
            <h3>{$content->title}</h3>
        {/if}
        <div class="teaser">{$content->teaser}</div>
    </div>
</div>