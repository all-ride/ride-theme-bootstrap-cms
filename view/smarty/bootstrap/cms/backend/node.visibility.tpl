{extends file="cms/backend/index"}

{block name="head_title" prepend}{translate key="title.node.visibility"} - {$node->getName($locale)} - {/block}

{block name="taskbar_panels" append}
    {url id="cms.node.visibility" parameters=["locale" => "%locale%", "site" => $site->getId(), "node" => $node->getId()] var="url"}
    {call taskbarPanelLocales url=$url locale=$locale locales=$locales}
{/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{$node->getName($locale)} <small>{translate key="title.node.visibility"}</small></h1>
    </div>
{/block}

{block name="content" append}
    <p>{translate key="label.node.action.visibility.intro"}</p>
    {include file="base/form.prototype"}

    <form id="{$form->getId()}" action="{$app.url.request}" method="POST" role="form">
        <fieldset>
            {call formRows form=$form}
        
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-default" value="{translate key="button.save"}" />
                </div>
            </div>
        </fieldset>
    </form>    
{/block}