{extends file="base/index.sidebar"}

{block name="styles" append}
    <link href="{$app.url.base}/css/cms/cms.css" rel="stylesheet" media="screen">
{/block}

{block name="sidebar"}
    {if isset($nodeCreateActions)}
    <div class="btn-group">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        {translate key="button.create"} <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu">
        {foreach $nodeCreateActions as $nodeTypeName => $nodeActionUrl}
            <li><a href="{$nodeActionUrl}">{translate key="label.node.type.`$nodeTypeName`"}</a></li>
        {/foreach}
      </ul>
    </div>            
    {/if}
{if isset($nodeTree)}
    {$nodeTree}
{/if}
{/block}