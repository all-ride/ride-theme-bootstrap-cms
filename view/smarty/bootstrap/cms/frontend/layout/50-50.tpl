{function name="layout_50_50" section=null widgets=null}
    <div class="row region-{$region}-{$section} {$style}">
    {$block = '1'}
        <div class="col-md-6 block" id="region-{$region}-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
    {$block = '2'}
        <div class="col-md-6 block" id="region-{$region}-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
    </div>
{/function}
