<ul class="locales">
{foreach $locales as $code => $data}
    {$locale = $data.locale}
    <li{if $code == $app.locale} class="active"{/if}><a href="{$data.url}">{$locale->getName()}</a></li>
{/foreach}
</ul>