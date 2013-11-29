{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.`$type`"} - {$node->getName($locale)} - {/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.`$type`"}</small></h1>
    </div>
{/block}

{block name="content" append}
    {include file="base/form.prototype"}

    <form class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
        <div class="form-group">
            <p>{translate key="label.confirm.node.`$type`" node=$node->getName($locale)}</p>
        </div>
        
        <div class="form-group">
            <input type="submit" class="btn btn-default" value="{translate key="button.`$type`"}" />
            <a class="btn" href="{$referer}">{translate key="button.cancel"}</a>
        </div>
    </form>    
{/block}