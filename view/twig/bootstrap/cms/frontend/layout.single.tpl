{extends file="cms/frontend/index"}

{block name="layout"}
    {foreach $regions['column1'] as $widget}
        {$widget}
    {/foreach}
{/block}