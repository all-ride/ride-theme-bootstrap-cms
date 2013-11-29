{extends file="base/index"}

{block name="container"}
<div class="container">
    <div class="row">
    {foreach $regions['header'] as $widget}
        {$widget}
    {/foreach}
    </div>
    <div class="row">
        <div class="col-md-3">
        {foreach $regions['menu'] as $widget}
            {$widget}
        {/foreach}
        </div>
        <div class="col-md-9">
            {block name="layout"}{/block}
        </div>
    </div>
    <div class="row">
    {foreach $regions['footer'] as $widget}
        {$widget}
    {/foreach}
    </div>
</div>
{/block}