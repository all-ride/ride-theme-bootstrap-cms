{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.varnish"} - {$node->getName($locale)} - {/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.varnish"}</small></h1>
    </div>
{/block}

{block name="content_body" append}
    {include file="base/form.prototype"}

    <form action="{$app.url.request}" method="POST" role="form">
        <div class="form-group">
            <p>{translate key="label.confirm.varnish.clear" node=$node->getName($locale)}</p>
        </div>

        {formWidget form=$form row="recursive"}

        {formRows form=$form}

        <div class="form-group">
            <input type="submit" class="btn btn-default" value="{translate key="button.cache.clear"}" />
            <a class="btn" href="{$referer}">{translate key="button.cancel"}</a>
        </div>
    </form>
{/block}
