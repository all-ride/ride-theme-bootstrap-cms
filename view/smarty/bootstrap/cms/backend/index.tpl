{extends file="base/index"}

{block name="styles" append}
    <link href="{$app.url.base}/css/cms/cms.css" rel="stylesheet" media="screen">
{/block}

{block name="container"}
        <div class="container">
            <div class="col-md-3">
                <div class="btn-group">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    {translate key="button.create"} <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
            {if isset($nodeTypes)}
                    {foreach $nodeTypes as $nodeTypeName => $null}
                    <li><a href="{url id="cms.`$nodeTypeName`.add" parameters=["locale" => $locale, "site" => $site->getRootNodeId()]}">{translate key="label.node.type.`$nodeTypeName`"}</a></li>
                    {/foreach}
            {else}
                    <li><a href="{url id="cms.site.add" parameters=["locale" => $locale]}">{translate key="label.node.type.site"}</a></li>
            {/if}
                  </ul>
                </div>            
            {if isset($nodeTree)}
                {$nodeTree}
            {/if}
            </div>
            <div class="col-md-9">
                {$smarty.block.parent}
            </div>
        </div>
{/block}