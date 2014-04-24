{include file="base/form.prototype"}

<form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form">
    <fieldset>
        {if $form->hasRow("existing")}
        <div class="row-existing clearfix hide" data-url-text="{url id="api.orm.detail" parameters=["model" => "Text", "id" => "%id%"]}">
            <p>{translate key="label.text.existing.select"}</p>
            {call formWidget form=$form row="existing"}
            {call formWidget form=$form row="existing-new"}
        </div>
        {/if}

        <div class="row-text clearfix">
            {call formWidget form=$form row="text"}
            {if $form->hasRow("existing")}
            <p class="text-right">
                <a href="#" id="btn-text-reuse">{translate key="button.text.existing"}</a>
            </p>
            {/if}

            {if $form->hasRow("locales-all")}
                {call formWidget form=$form row="locales-all"}
            {/if}
        </div>

        {call formRows form=$form}

        <div class="form-group">
            <div class="col-lg-12">
                <input id="btn-submit" type="submit" name="action" class="btn btn-default" value="{translate key="button.save"}" />
                <a id="btn-cancel" class="btn" href="{url id="cms.node.layout" parameters=["locale" => $locale, "site" => $site->getId(), "node" => $node->getId(), "region" => $region]}">{translate key="button.cancel"}</a>
            </div>
        </div>
    </fieldset>
</form>
