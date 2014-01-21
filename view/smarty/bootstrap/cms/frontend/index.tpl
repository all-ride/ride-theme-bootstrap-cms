{extends file="base/index"}

{block name="head_title"}{$app.cms.context.title.node} - {$app.cms.context.title.site}{/block}

{block name="styles" append}
    {foreach $app.cms.context.styles as $style}
        {if substr($style, 0, 7) == 'http://' || substr(style, 0, 8) == 'https://' || substr($style, 0, 2) == '//'}
            <script src="{$style}"></script>
        {else}
            <script src="{$app.url.base}/{$style}"></script>
        {/if}
    {/foreach}
{/block}

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
            {if isset($app.messages)}
                {$_messageTypes = ["error" => "danger", "warning" => "warning", "success" => "success", "information" => "info"]}
                {foreach $_messageTypes as $_messageType => $_messageClass}
                    {$_messages = $app.messages->getByType($_messageType)}
                    {if $_messages}
                        <div class="alert alert-{$_messageClass}">
                        {if $_messages|count == 1}
                            {$_message = $_messages|array_pop}
                            <p>{$_message->getMessage()}</p>
                        {else}
                            <ul>
                            {foreach $_messages as $_message}
                                <li>{$_message->getMessage()}</li>
                            {/foreach}
                            </ul>
                        {/if} 
                        </div>
                    {/if}
                {/foreach}
            {/if}
                    
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

{block name="scripts" append}
    {foreach $app.cms.context.scripts as $script}
        {if substr($script, 0, 7) == 'http://' || substr(script, 0, 8) == 'https://' || substr($script, 0, 2) == '//'}
            <script src="{$script}"></script>
        {else}
            <script src="{$app.url.base}/{$script}"></script>
        {/if}
    {/foreach}
{/block}
