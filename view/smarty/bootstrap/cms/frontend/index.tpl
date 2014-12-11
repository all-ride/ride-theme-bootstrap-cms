{extends file="base/index"}

{block name="head_title"}{$app.cms.context.title.node} - {$app.cms.context.title.site}{/block}

{block name="head" append}
    {$meta = $app.cms.node->getMeta($app.locale)}
    {if $meta}
        {foreach $meta as $metaName => $metaValue}
    <meta property="{$metaName}" content="{$metaValue}" />
        {/foreach}
    {/if}
{/block}

{block name="styles" append}
    <link href="{$app.url.base}/bootstrap/css/cms/front.css" rel="stylesheet" media="screen">
{/block}

{block name="container"}
    {foreach $layouts as $layout}
        {include file=$layout->getFrontendResource() inline}
    {/foreach}

    {function name="region" region=null}
        {if isset($regions.$region)}
            {foreach $regions.$region as $section => $layout}
                {$functionName = "layout-`$layout`"|replace:"-":"_"}
                {call $functionName section=$section widgets=$widgets.$region.$section style=$app.cms.node->getSectionStyle($region, $section)}
            {/foreach}
        {/if}
    {/function}

<div class="container">
    <div class="row region region-header">
        {call region region="header"}
            </div>
    <div class="row">
        <div class="col-md-3 region region-menu">
            {call region region="menu"}
                    </div>
        <div class="col-md-9 region region-layout">
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

            {call region region="content"}
        </div>
    </div>
    <div class="row region region-footer">
        {call region region="footer"}
    </div>
</div>
{/block}
