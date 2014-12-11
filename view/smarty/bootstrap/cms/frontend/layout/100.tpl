{function name="layout_100" section=null widgets=null}
    <div class="row {$style}">
    {$block = '1'}
        <div class="col-md-12 block" id="block-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
    {if isset($widgets[$block])}
        {foreach $widgets[$block] as $widget}
            {$widget}
        {/foreach}
    {/if}
        </div>
    </div>
{/function}
