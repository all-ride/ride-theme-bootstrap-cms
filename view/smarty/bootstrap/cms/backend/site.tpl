{extends file="base/index.sidebar"}

{block name="head_title" prepend}{translate key="title.sites"} - {/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{translate key="title.sites"}</h1>
    </div>
{/block}

{block name="sidebar" append}
    {url var="actionUrl" id="cms.site.add" parameters=["locale" => $locale]}
    {isGranted url=$actionUrl}
    <div class="btn-group">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        {translate key="button.create"} <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="{$actionUrl}">{translate key="label.node.type.site"}</a></li>
    </ul>
    </div>
    {/isGranted}
{/block}

{block name="content_body" append}
    <ul>
    {foreach $sites as $site}
        <li><a href="{$site.url}">{$site.name}</a></li>
    {/foreach}
    </ul>
{/block}
