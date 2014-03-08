<ol class="breadcrumb">
{foreach $app.cms.context.breadcrumbs as $url => $label}
    {if $label@last}
        <li class="active">{$label}</li>
    {else}
        <li><a href="{$url}">{$label}</a></li>
    {/if}
{/foreach}
</ol>