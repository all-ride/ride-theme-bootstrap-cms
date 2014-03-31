{if $title}
	<h3 class="{$app.cms.properties->getWidgetProperty('style.title')}">{$title}</h3>
{/if}

{include file="cms/widget/menu/menu.nested" prefix="menu" number=1 depth=$depth class={$app.cms.properties->getWidgetProperty('style.menu')}}
