{extends file="base/index.sidebar"}

{block name="head_title" prepend}{translate key="title.sites"} - {/block}

{block name="content_title" append}
    <div class="page-header">
        <h1>{translate key="title.sites"}</h1>
    </div>
{/block}

{block name="sidebar" append}
    <div class="btn-group">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        {translate key="button.create"} <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="{url id="cms.site.add" parameters=["locale" => $locale]}">{translate key="label.node.type.site"}</a></li>
    </ul>
    </div>
{/block}

{block name="content_body" append}
    <ul>
    {foreach $sites as $site}
        <li><a href="{url id="cms.site.detail" parameters=["site" => $site->getId()]}">{$site->getName($locale)}</a></li>
    {/foreach}
    </ul>
{/block}