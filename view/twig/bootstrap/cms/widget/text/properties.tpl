{include file="base/form.prototype"}

<form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
    <fieldset>
        {call formRow form=$form row="format"}
        {call formRow form=$form row="text"}
        {call formRow form=$form row="io"}
        {call formRow form=$form row="locales-all"}
        
        {call formRows form=$form}
    
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <input type="submit" name="action" class="btn btn-default" value="{translate key="button.save"}" />
                <a class="btn" href="{url id="cms.node.layout" parameters=["locale" => $locale, "site" => $site->getId(), "node" => $node->getId(), "region" => $region]}">{translate key="button.cancel"}</a>
            </div>
        </div>
    </fieldset>
</form>  