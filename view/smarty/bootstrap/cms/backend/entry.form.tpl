{extends file="cms/backend/index"}

{block name="head_title" prepend}{if $node->getId()}{translate key="title.entry.edit"}{else}{translate key="title.entry.add"}{/if} - {/block}

{block name="taskbar_panels" append}
    {if $node->getId()}
        {url id="cms.entry.edit" parameters=["locale" => $locale, "site" => $site->getId(), "revision" => "%revision%", "node" => $node->getId()] var="urlPublish"}
        {url id="cms.entry.edit" parameters=["locale" => "%locale%", "site" => $site->getId(), "revision" => $node->getRevision(), "node" => $node->getId()] var="urlLocales"}
    {else}
        {url id="cms.entry.add" parameters=["locale" => $locale, "site" => $site->getId(), "revision" => "%revision%"] var="urlPublish"}
        {url id="cms.entry.add" parameters=["locale" => "%locale%", "site" => $site->getId(), "revision" => $site->getRevision()] var="urlLocales"}
    {/if}

    {if !$site->isAutoPublish()}    
        {include file="cms/backend/taskbar"}

        {call taskbarPanelPublish url=$urlPublish revision=$node->getRevision() revisions=$site->getRevisions()}
    {/if}
    
    {call taskbarPanelLocales url=$urlLocales locale=$locale locales=$locales}
{/block}

{block name="content_title" append}
    <div class="page-header">
        {if $node->getId()}
        <h1>{$node->getName($locale)} <small>{translate key="title.entry.edit"}</small></h1>
        {else}
        <h1>{translate key="title.entry.add"}</h1>
        {/if}
    </div>
{/block}

{block name="content_body" append}
    {include file="base/form.prototype"}

    <form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
        <fieldset>
            {call formRows form=$form}

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-default" value="{translate key="button.submit"}" />
                    {if $referer}
                        <a href="{$referer}" class="btn">{translate key="button.cancel"}</a>
                    {/if}
                </div>
            </div>
        </fieldset>
    </form>
{/block}
