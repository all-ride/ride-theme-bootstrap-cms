{assign var="prefix" value="`$prefix``$number`"}

<ul class="{$prefix}">
{foreach $items as $node}
	{if $node->isPublished() && $nodeTypes[$node->getType()]->getFrontendCallback() && $node->isAvailableInLocale($app.locale)}
    <li class="{if $node@first}first {/if}{cycle values="even,odd" name=$prefix}{if $app.cms.node->hasParent($node->getId())} active-trail{elseif $app.cms.node->getId() == $node->getId()} active{/if}{if $node@last} last{/if}">
        <a href="{$app.url.script}{$node->getRoute($app.locale)}">{$node->getName($app.locale)}</a>
        {if $node->getChildren()}
            {include file="cms/widget/menu/menu.nested" items=$node->getChildren() prefix="`$prefix`sub"}
            {assign var="number" value=$number+1}
        {/if}
    </li>
    {/if}
{/foreach}
</ul>