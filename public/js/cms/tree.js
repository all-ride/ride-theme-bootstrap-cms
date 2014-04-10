function joppaInitializeNodeTree(nodeToggleAction) {
    // implement the expand/collapse function of the node tree
    $("#node-tree .node a.toggle").each(function(i) {
        $(this).click(function() {
            var parent = $(this).parent();
            var nodeId = parent.attr('id').replace('node-', '');

            parent.toggleClass('closed');

            $.post(nodeToggleAction.replace('%25node%25', nodeId));

            return false;
        });
    });
}
