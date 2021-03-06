{extends file="base/index"}

{block name="head_title" prepend}{$title} - {/block}

{block name="taskbar_panels" append}
    {if $localizeUrl}
        {call taskbarPanelLocales url=$localizeUrl locale=$locale locales=$locales}
    {/if}
{/block}

{block name="content_title"}
<div class="page-header">
    <h1>{$title}</h1>
</div>
{/block}

{block name="content_body" append}
    {include file="base/table" table=$table tableForm=$form tableActions=$actions}

    {if $exports}
        {translate key="orm.label.export"}

        {foreach $exports as $extension => $url}
            <a href="{$url}" title="{translate key="orm.label.export.to" format=$extension}">
                <img src="{image src="img/export/`$extension`.png"}" />
            </a>
        {/foreach}
    {/if}
{/block}

{block name="scripts" append}
    {script src="bootstrap/js/jquery-ui.js"}
    {script src="bootstrap/js/form.js"}
    {script src="bootstrap/js/table.js"}
    {script src="bootstrap/js/text.admin.js"}
{/block}

{block name="scripts_inline" append}
    <script type="text/javascript">
        var translations = {
            more: '{translate key="label.show.more"}',
            less: '{translate key="label.show.less"}'
        };
    </script>
{/block}
