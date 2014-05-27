$(function() {
    $('.widget-text-toc').each(function() {
        var divIndex = $(this);
        console.log(divIndex);
        var index = $('<ul></ul>');

        $('.widget h2.toc', divIndex.parents('.region')).each(function() {
            var title = $(this);
          console.log(title);
            var label = title.data('label-menu');

            if (label == undefined) {
              label = title.text().trim();
            }

            var anchor = label.toLowerCase().replace(/ /g, '-');
            title.prepend($('<a name="' + anchor + '"></a>'));
            index.append($('<li><a href="#' + anchor + '">' + label + '</a></li>'));
        });

        divIndex.append(index);
    });
});
