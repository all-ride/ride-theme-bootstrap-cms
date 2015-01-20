{extends file="base/index.sidebar"}

{block name="styles" append}
    <link href="{$app.url.base}/bootstrap/css/cms/cms.css" rel="stylesheet" media="screen">
{/block}

{block name="content_title" append}
{if isset($breadcrumbs)}
    <ol class="breadcrumb">
    {foreach $breadcrumbs as $url => $name}
        {if $name@last}
            <li class="active">{$name}</li>
        {else}
            <li><a href="{$url}">{$name}</a></li>
        {/if}
    {/foreach}
    </ol>
{/if}
{/block}

{block name="sidebar"}
    {if isset($nodeCreateActions)}
    <div class="btn-group">
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <i class="glyphicon glyphicon-plus"></i>
                {translate key="button.create"} <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
            {foreach $nodeCreateActions as $nodeTypeName => $nodeActionUrl}
                <li><a href="{$nodeActionUrl}">{translate key="label.node.type.`$nodeTypeName`"}</a></li>
            {/foreach}
          </ul>
        </div>
        {if isset($site)}
        <a href="{url id="cms.site.trash" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale]}" class="btn btn-default">
            {translate key="title.trash"}
            <i class="glyphicon glyphicon-trash"></i>
        </a>
        {/if}
    </div>
    {/if}

    <div class="site-tree">
        <div class="loading"></div>
    </div>
{/block}

{block name="scripts" append}
    <script src="{$app.url.base}/bootstrap/js/jquery-ui.js"></script>
    <script src="{$app.url.base}/bootstrap/js/cms/lib/jquery.mjs.nestedSortable.js"></script>
    <script src="{$app.url.base}/bootstrap/js/cms/tree.js"></script>
    {if isset($site)}
    <script type="text/javascript">
        $(function() {
            joppaInitializeNodeTree(
                '{url id="cms.site.tree" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale]}',
                '{url id="cms.node.collapse" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale, "node" => "%node%"]}',
                '{url id="cms.site.order" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale]}',
                {$collapsedNodes},
                {if isset($node)}'{$node->getId()}'{else}null{/if}
            );
        });
    </script>
    {/if}
{/block}
