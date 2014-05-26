<div class="widget widget-menu {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {if $title}
    	<h2 class="toc {$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h2>
    {/if}

    {include file="cms/widget/menu/menu.nested" prefix="menu" number=1 depth=$depth class={$app.cms.properties->getWidgetProperty('style.menu')}}
</div>
