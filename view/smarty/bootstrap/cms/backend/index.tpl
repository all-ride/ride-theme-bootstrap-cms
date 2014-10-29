{extends file="base/index.sidebar"}

{block name="styles" append}
    <link href="{$app.url.base}/css/cms/cms.css" rel="stylesheet" media="screen">
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

{if isset($siteTreeNode)}
    {function name="renderTreeNode" treeNode=null}
        {$node = $treeNode->getNode()}
        {$nodeId = $node->getId()}
        {$nodeType = $node->getType()}
        {$children = $treeNode->getChildren()}
        {$actions = $treeNode->getActions()}

        <li class="node node-{$nodeType}{if $treeNode->isHidden()} node-{$nodeType}-hidden{/if}{if $treeNode->isHomePage()} node-{$nodeType}-default{/if}{if !$treeNode->isLocalized($locale)} unlocalized{/if}{if $treeNode->isSelected()} selected{/if}{if $treeNode->isCollapsed()} collapsed{/if}" id="node-{$node->getId()}">
            {if $children}
            <a href="#" class="toggle"></a>
            {else}
            <span class="toggle"></span>
            {/if}

            <div class="handle"><span class="icon"></span></div>
            <div class="dropdown">
                <a href="{$treeNode->getUrl()}" class="name">{$node->getName($locale)|truncate}</a>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">&nbsp;</a>
                <ul class="dropdown-menu" role="menu">
                {$hasDivider = false}
                {foreach $actions as $actionName => $actionUrl}
                    {if !$hasDivider && ($actionName == 'edit' || $actionName == 'clone' || $actionName == 'delete')}
                        {$hasDivider = true}

                        <li class="divider"></li>
                    {/if}

                    <li><a href="{$actionUrl}" class="action action-{$actionName}">{translate key="label.node.action.`$actionName`"}</a></li>
                {/foreach}
                </ul>
            </div>

            {if $children}
            <ul class="children">
                {foreach $children as $child}
                    {call renderTreeNode treeNode=$child}
                {/foreach}
            </ul>
            {/if}
        </li>
    {/function}

    <ul id="node-tree">
        {call renderTreeNode treeNode=$siteTreeNode}
    </ul>
{/if}
{/block}

{block name="scripts" append}
    <script src="{$app.url.base}/js/jquery-ui.js"></script>
    <script src="{$app.url.base}/js/cms/lib/jquery.mjs.nestedSortable.js"></script>
    <script src="{$app.url.base}/js/cms/tree.js"></script>
    {if isset($site)}
    <script type="text/javascript">
        $(function() {
            joppaInitializeNodeTree('{url id="cms.node.collapse" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale, "node" => "%node%"]}', '{url id="cms.site.order" parameters=["site" => $site->getId(), "revision" => $site->getRevision(), "locale" => $locale]}');
        });
    </script>
    {/if}
{/block}
