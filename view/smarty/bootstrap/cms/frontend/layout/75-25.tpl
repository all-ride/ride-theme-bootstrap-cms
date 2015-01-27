{function name="layout_75_25" section=null widgets=null}
    <div class="row region-{$region}-{$section} {$style}">
    {$block = '1'}
        <div class="col-md-9 block" id="region-{$region}-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
    {$block = '2'}
        <div class="col-md-3 block" id="region-{$region}-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
    </div>
{/function}
