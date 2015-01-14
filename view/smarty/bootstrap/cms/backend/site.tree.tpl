{function name="renderTreeNode" treeNode=null level=null}
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
            {$truncateLength = 20}
            {if $level > 3}
                {$truncateLength = 15}
            {/if}

            {$name = $node->getName($locale)}
            <a href="{$treeNode->getUrl()}" class="name" title="{$name|escape}">{$name|truncate:$truncateLength}</a>
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
            {$level = $level + 1}
            {foreach $children as $child}
                {call renderTreeNode treeNode=$child level=$level}
            {/foreach}
        </ul>
        {/if}
    </li>
{/function}

<ul id="node-tree">
    {call renderTreeNode treeNode=$siteTreeNode level=0}
</ul>
