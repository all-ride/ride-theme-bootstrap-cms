{* widget: template; action: index; name: API namespaces sidebar *}
{if isset($app.cms.context['api.classes'])}
<h3>{translate key="title.classes"}</h3>
<ul class="nav nav-pills nav-stacked nav-documentation">
    {foreach $app.cms.context['api.classes'] as $c}
    <li{if isset($app.cms.context['api.class.shortName']) && $app.cms.context['api.class.shortName'] == $c} class="active"{/if}><a href="{$app.cms.context['api.url.class']}/{$app.cms.context['api.namespace']}/{$c}">{$c}</a></li>
    {/foreach}
</ul>
{/if}
{if isset($app.cms.context['api.namespaces'])}
<h3>{translate key="title.namespaces"}</h3>
<ul class="nav nav-pills nav-stacked nav-documentation">
    {foreach $app.cms.context['api.namespaces'] as $ns}
    <li><a href="{$app.cms.context['api.url.namespace']}/{$ns}">{$ns}</a></li>
    {/foreach}
</ul>
{/if}
