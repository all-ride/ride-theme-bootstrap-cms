{include file="base/form.prototype"}

<form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form" enctype="multipart/form-data">
    <fieldset>
        {if $form->hasRow("existing")}
        <div class="row-existing clearfix hide" data-url-text="{url id="api.orm.detail" parameters=["model" => "Text", "id" => "%id%"]}">
            <p>{translate key="label.text.existing.select"}</p>
            {call formWidget form=$form row="existing"}
            {call formWidget form=$form row="existing-new"}
        </div>
        {/if}
        <input type="hidden" name="image-src" value="" id="form-text-image-src-hidden" />

        {call formRows form=$form}

        {if $form->hasRow("existing")}
        <p class="text-right">
            <a href="#" id="btn-text-reuse">{translate key="button.text.existing"}</a>
        </p>
        {/if}

        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <input id="btn-submit" type="submit" name="action" class="btn btn-default" value="{translate key="button.save"}" />
                <a id="btn-cancel" class="btn" href="{url id="cms.node.layout" parameters=["locale" => $locale, "site" => $site->getId(), "node" => $node->getId(), "region" => $region]}">{translate key="button.cancel"}</a>
            </div>
        </div>
    </fieldset>
</form>
