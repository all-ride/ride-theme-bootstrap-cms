{extends file="cms/frontend/index"}

{block name="layout"}
    <div class="row">
    {foreach $regions['column1'] as $widget}
        {$widget}
    {/foreach}
    </div>
    <div class="row">
    {foreach $regions['column2'] as $widget}
        {$widget}
    {/foreach}
    </div>
    <div class="row">
    {foreach $regions['column3'] as $widget}
        {$widget}
    {/foreach}
    </div>
{/block}
