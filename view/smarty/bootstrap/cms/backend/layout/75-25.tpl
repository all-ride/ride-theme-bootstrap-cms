{function name="layout_75_25" site=null node=null section=null widgets=null inheritedWidgets=null actions=null}
<div class="row">
{$block = '1'}
    <div class="col-md-9 block droppable" id="block-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
{if isset($widgets[$block])}
    {foreach $widgets[$block] as $widgetId => $widget}
        {call widgetPanel site=$site node=$node widget=$widget widgetId=$widgetId inheritedWidgets=$inheritedWidgets[$block] actions=$actions}
    {/foreach}
{/if}
    </div>

{$block = '2'}
    <div class="col-md-3 block droppable" id="block-{$section}-{$block}" data-section="{$section}" data-block="{$block}">
{if isset($widgets[$block])}
    {foreach $widgets[$block] as $widgetId => $widget}
        {call widgetPanel site=$site node=$node widget=$widget widgetId=$widgetId inheritedWidgets=$inheritedWidgets[$block] actions=$actions}
    {/foreach}
{/if}
    </div>
</div>
{/function}
