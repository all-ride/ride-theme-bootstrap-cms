{extends file="base/index"}

{if isset($app.cms.context)}
    {block name="head_title"}{$app.cms.context.title.node} - {$app.cms.context.title.site}{/block}
{/if}

{block name="head" append}
{if isset($app.cms.node)}
    {$meta = $app.cms.node->getMeta($app.locale)}
    {if $meta}
        {foreach $meta as $metaName => $metaValue}
    <meta property="{$metaName}" content="{$metaValue}" />
        {/foreach}
    {/if}
{/if}
{/block}

{block name="styles" append}
    {style src="bootstrap/css/cms/front.css" media="screen"}
{/block}

{block name="body_attributes" append} class="node-{$app.cms.node->getId()}"{/block}

{block name="container"}
    {foreach $layouts as $layout}
        {include file=$layout->getFrontendResource() inline}
    {/foreach}

    {function name="region" region=null class=null}
        {if isset($widgets.$region)}
        <div class="{$class}">
            {foreach $regions.$region as $section => $layout}
                {if isset($widgets.$region.$section)}
                    {$functionName = "layout-`$layout`"|replace:"-":"_"}
                    {$style = $app.cms.node->getSectionStyle($region, $section)}

                    <div class="container{if $style|strpos:"no-container" !== false}-fluid{/if}">
                        {call $functionName section=$section widgets=$widgets.$region.$section style=$style}
                    </div>
                {/if}
            {/foreach}
        </div>
        {/if}
    {/function}

    {call region region="header" class="region region-header"}
    {call region region="menu" class="region region-menu"}
    <div class="messages">
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
    </div>
    {call region region="content" class="region region-content"}
    {call region region="footer" class="row region region-footer"}
{/block}
