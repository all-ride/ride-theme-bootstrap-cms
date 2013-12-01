{if $label}
    {$label}
{/if}
<ul class="breadcrumbs">
{foreach $app.cms.breadcrumbs as $url => $label}
    {if !in_array($label, $filter)}
        {if $label@last}
            <li>{$label}</li>
        {else}
            <li><a href="{$url}">{$label}</a></li>
        {/if}
    {/if}
{/foreach}
</ul>