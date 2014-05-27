function joppaInitializeNodeTree(nodeToggleAction) {
    var $tree = $('#node-tree');
    // implement the expand/collapse function of the node tree
    $tree.find(".node a.toggle").each(function(i) {
        $(this).click(function() {
            var parent = $(this).parent();
            var nodeId = parent.attr('id').replace('node-', '');

            parent.toggleClass('closed');

            $.post(nodeToggleAction.replace('%25node%25', nodeId));

            return false;
        });
    });

    // implement the sortable tree
    $tree.nestedSortable({
        listType: 'ul',
        items: 'li',
        handle: '.handle',
        helper: 'clone',
        opacity: .6,
        placeholder: 'placeholder',
        isTree: true,
        change: function(){
            var order = $tree.nestedSortable('serialize');
            $.post(url, {
                data: order
            });
        }
    });
    // $('#node-tree').nestedSortable({
    //     forcePlaceholderSize: true,
    //     handle: '.handle',
    //     helper: 'clone',
    //     items: 'li',
    //     opacity: .6,
    //     placeholder: 'placeholder',
    //     revert: 250,
    //     tabSize: 25,
    //     tolerance: 'pointer',
    //     // toleranceElement: '> .dropdown',
    //     isTree: true,
    //     expandOnHover: 700,
    //     startCollapsed: false,
    //     change: function(){
    //         console.log('Relocated item');
    //     }
    // });
}
