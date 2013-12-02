<ol class="breadcrumb">
{foreach $app.cms.breadcrumbs as $url => $label}
    {if !in_array($label, $filter)}
        {if $label@last}
            <li class="active">{$label}</li>
        {else}
            <li><a href="{$url}">{$label}</a></li>
        {/if}
    {/if}
{/foreach}
</ol>