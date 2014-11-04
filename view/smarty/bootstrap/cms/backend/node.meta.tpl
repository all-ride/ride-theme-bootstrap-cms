{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.meta"} - {$node->getName($locale)} - {/block}

{block name="taskbar_panels" append}
    {if !$site->isAutoPublish()}
        {include file="cms/backend/taskbar"}

        {url id="cms.node.meta" parameters=["locale" => $locale, "site" => $site->getId(), "revision" => "%revision%", "node" => $node->getId()] var="url"}
        {call taskbarPanelPublish url=$url revision=$node->getRevision() revisions=$site->getRevisions()}
    {/if}

    {url id="cms.node.meta" parameters=["locale" => "%locale%", "site" => $site->getId(), "revision" => $node->getRevision(), "node" => $node->getId()] var="url"}
    {call taskbarPanelLocales url=$url locale=$locale locales=$locales}
{/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.meta"}</small></h1>
    </div>
{/block}

{block name="content_body" append}
    <p>{translate key="label.node.action.meta.intro"}</p>

    {if $parentMeta}
        <h3>{translate key="title.meta.inherited"}</h3>
        <dl class="dl-horizontal">
        {foreach $parentMeta as $property => $value}
            <dt>{$property}</dt>
            <dd>{$value}</dd>
        {/foreach}
        </dl>
    {/if}

    {include file="base/form.prototype"}
    <form id="{$form->getId()}" action="{$app.url.request}" method="POST" role="form" enctype="multipart/form-data">
        <fieldset>
            <h3>{translate key="title.meta.general"}</h3>
            {call formRow form=$form row='title'}
            {call formRow form=$form row='description'}
            {call formRow form=$form row='keywords'}

            <h3>{translate key="title.meta.open.graph"}</h3>
            {call formRow form=$form row='og-title'}
            {call formRow form=$form row='og-description'}
            {call formRow form=$form row='og-image'}

            <h3>{translate key="title.meta.custom"}</h3>
            {call formRows form=$form}

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-default" value="{translate key="button.save"}" />
                    {if $referer}
                        <a href="{$referer}" class="btn">{translate key="button.cancel"}</a>
                    {/if}
                </div>
            </div>
        </fieldset>
    </form>
{/block}

{block name="scripts" append}
    <script src="{$app.url.base}/bootstrap/js/form.js"></script>
{/block}
