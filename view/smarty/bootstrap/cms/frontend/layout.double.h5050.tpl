{extends file="cms/frontend/index"}

{block name="layout"}
    <div class="row">
        <div class="col-md-6">
    {foreach $regions['column1'] as $widget}
        {$widget}
    {/foreach}
        </div>
        <div class="col-md-6">
    {foreach $regions['column2'] as $widget}
        {$widget}
    {/foreach}
        </div>
    </div>
{/block}