{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.advanced"} - {$node->getName($locale)} - {/block}

{block name="taskbar_panels" append}
    {if !$site->isAutoPublish()}
        {include file="cms/backend/taskbar"}

        {url id="cms.node.advanced" parameters=["locale" => $locale, "site" => $site->getId(), "revision" => "%revision%", "node" => $node->getId()] var="url"}
        {call taskbarPanelPublish url=$url revision=$node->getRevision() revisions=$site->getRevisions()}
    {/if}

    {url id="cms.node.advanced" parameters=["locale" => "%locale%", "site" => $site->getId(), "revision" => $node->getRevision(), "node" => $node->getId()] var="url"}
    {call taskbarPanelLocales url=$url locale=$locale locales=$locales}
{/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.advanced"}</small></h1>
        <a href="{$node->getUrl($locale, $app.url.script)}">{$app.url.script}{$node->getRoute($locale)}</a>
    </div>
{/block}

{block name="content_body" append}
    <p>{translate key="label.node.action.advanced.intro"}</p>
    {include file="base/form.prototype"}

    <form id="{$form->getId()}" action="{$app.url.request}" method="POST" role="form">
        <fieldset>
            <div class="form-group">
                {call formWidget form=$form row="properties"}
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-default" value="{translate key="button.save"}" />
                {if $referer}
                    <a href="{$referer}" class="btn">{translate key="button.cancel"}</a>
                {/if}
            </div>
        </fieldset>
    </form>

    <p>
        <a href="#" class="btn-properties-show">{translate key="button.properties.show"}</a>
        <a href="#" class="btn-properties-hide">{translate key="button.properties.hide"}</a>
    </p>
    <div class="full-configuration">
        {$nodeProperties}
    </div>
{/block}

{block name="scripts" append}
    <script type="text/javascript">
        $(function() {
            $('.full-configuration').hide();
            $('.btn-properties-show').click(function(e) {
                e.preventDefault();

                $('.btn-properties-show').hide();
                $('.full-configuration').show();
                $('.btn-properties-hide').show();
            });
            $('.btn-properties-hide').click(function(e) {
                e.preventDefault();

                $('.btn-properties-hide').hide();
                $('.full-configuration').hide();
                $('.btn-properties-show').show();
            }).hide();
        });
    </script>
{/block}
