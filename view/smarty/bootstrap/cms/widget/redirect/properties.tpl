{include file="base/form.prototype"}

<form id="{$form->getId()}" class="form-horizontal" action="{$app.url.request}" method="POST" role="form" enctype="multipart/form-data">
    <fieldset>
        <div class"form-group row radio">
            <label>
                {call formWidget form=$form row="type" part="node"}
                {translate key="label.node"}
            </label>
        </div>

        <div class="form-group row redirect-type redirect-type-node">
            <div class="col-lg-12">
                {call formWidget form=$form row="node"}
                {call formWidgetErrors form=$form row="node"}
            </div>
        </div>

        <div class"form-group row radio">
            <label>
                {call formWidget form=$form row="type" part="url"}
                {translate key="label.url"}
            </label>
        </div>

        <div class="form-group row redirect-type redirect-type-url">
            <div class="col-lg-12">
                {call formWidget form=$form row="url"}
                {call formWidgetErrors form=$form row="url"}
            </div>
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
