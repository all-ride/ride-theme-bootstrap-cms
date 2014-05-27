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

{block name="scripts" append}
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script src="{$app.url.base}/js/cms/lib/jquery.mjs.nestedSortable.js"></script>
    <script src="{$app.url.base}/js/cms/tree.js"></script>
    {if isset($site)}
    <script type="text/javascript">
      $(function() {
            joppaInitializeNodeTree('{url id="cms.tree.toggle" parameters=["node" => "%node%"]}', '{url id="cms.tree.order"}');
        });
    </script>
    {/if}
{/block}
