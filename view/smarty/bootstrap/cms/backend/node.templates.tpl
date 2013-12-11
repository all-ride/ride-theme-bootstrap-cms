{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.templates"} - {$node->getName($locale)} - {/block}

{block name="taskbar_panels" append}
    {url id="cms.node.templates" parameters=["locale" => "%locale%", "site" => $site->getId(), "node" => $node->getId()] var="url"}
    {call taskbarPanelLocales url=$url locale=$locale locales=$locales}
{/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.templates"}</small></h1>
    </div>
{/block}

{block name="content" append}
    {include file="base/form.prototype"}

<form class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
    <fieldset>
    <div class="tabbable">
        <ul class="nav nav-tabs">
        {foreach $templates as $file => $content}
            <li{if $content@first} class="active"{/if}><a href="#{$file}" data-toggle="tab">{$file}</a></li>
        {/foreach}
        </ul>
        
        <div class="tab-content">
        {foreach $templates as $file => $content}
            <div id="{$file}" class="tab-pane clearfix{if $content@first} active{/if}">
                <br />
                {call formWidget form=$form row="content" part=$file}
                <br />
                
                {call formRow form=$form row="path" part=$file}
            </div>
        {/foreach}
        </div>
        
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <input type="submit" class="btn btn-default" value="{translate key="button.save"}" />
            </div>
        </div>
    </fieldset>
</form>

{/block}