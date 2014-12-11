{function name="region" region=null}
    {$region}
    {if isset($regions.$region)}
        {foreach $regions.$region as $section => $layout}
            {$functionName = "layout-`$layout`"|replace:"-":"_"}
            {call $functionName section=$section widgets=$widgets.$region.$section style=$app.cms.node->getSectionStyle($region, $section)}
        {/foreach}
    {/if}
{/function}
