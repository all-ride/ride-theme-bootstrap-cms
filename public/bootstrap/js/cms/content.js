function initializeContent(baseUrl) {
    var $document = $(document);
    var $formWidgetAdd = $('.form-widget-add');
    var $modalWidgetAdd = $('.modal-widget-add');

    var initWidgetOrder = function joppaInitializeWidgetOrder(baseUrl, reset) {
        var $blocks = $('.section .block');

        if (reset != undefined && reset) {
            $blocks.each(function() {
                try {
                    $(this).sortable('destroy')
                } catch (error) {

                }
            });
        }

        $blocks.sortable({
	        handle: '.handle',
            items: '> .widget',
            // connectWith: $blocks,
	        update: function (event, ui) {
                console.log('update');
                console.log(ui.item.context);
		        // id = ui.item.context.id;
		        // id = id.split('-');
		        // if (id[0] != 'page' && id[1] != 'widget') {
			        // return;
		        // }

		        // var order = '';
		        // $('#region .droppable > .widget').each(function(i) {
			        // order += this.id.replace('page-widget-', '') + ',';
		        // });

		        // $.post(baseUrl + '/order?widgets=' + escape(order));
            },
        });
    };

    var $widgetAddButton = $('.widget-add-submit');
    var $widgetAddAndCloseButton = $('.widget-add-submit-close');
    var widgetAdd = function() {
        var widget = $('input[name=widget]:checked').val();
        if (!widget) {
            alert('no widget selected');

            return;
        }

        var section = $('input[name=section]').val();
        var block = $('input[name=block]').val();

        var $block = $('.section[data-section=' + section + '] .block[data-block=' + block + ']', $sections);
                if ($block.length != 1) {
            alert('no block found');

            return;
        }

        $widgetAddButton.attr('disabled', 'disabled');
        $widgetAddAndCloseButton.attr('disabled', 'disabled');

		$.post(baseUrl + '/sections/' + section + '/block/' + block + '/widget/' + widget, function(html) {
            $block.append(html);

            initWidgetOrder(baseUrl, true);

            $widgetAddButton.removeAttr('disabled');
            $widgetAddAndCloseButton.removeAttr('disabled');
		});
    };

    // setup sortable for the sections
    var $sections = $('.sections');
    // $sections.sortable({
        // handle: '.panel-heading .handle',
        // items: '> .section',
        // update: function(event, ui) {
            // var sections = [];
            // $('.section', $sections).each(function() {
                // sections.push($(this).data('section'));
            // });

            // $.post(baseUrl + '/sections/order', { order: sections }, function(data) {

            // });
        // }
    // });

    // add a new section
    $document.on('click', '.section-add', function(e) {
        e.preventDefault();
        $.post(baseUrl + '/sections', function(html) {
            $sections.append(html);

            initWidgetOrder(baseUrl, true);

            $('.section:last', $sections).scrollTop();
        });
    });

    // delete a section
    $document.on('click', '.section-delete', function(e) {
        e.preventDefault();

        var $this = $(this);
		if (!confirm($this.data('confirm'))) {
            return;
        }

        var $section = $this.closest('.section');
        $.ajax({
            url: baseUrl + '/sections/' + $section.data('section'),
            type: 'DELETE',
            success: function(result) {
                $section.remove();

                initWidgetOrder(baseUrl, true);
            }
        });
    });

    // change section layout
    $document.on('click', '.section__layouts > a', function(e) {
        e.preventDefault();

        var $this = $(this);
        var $section = $this.closest('.section');

        $.post(baseUrl + '/sections/' + $section.data('section') + '/layout/' +  $this.data('layout'), function(html) {
            $section.replaceWith(html);

            initWidgetOrder(baseUrl, true);
        });
    });

    // add widget with double click
    $document.on('dblclick', '.section .block', function() {
        var $this = $(this);
        var block = $this.data('block');
        var section = $this.parents('.section').data('section');

        $('input[name=section]').val(section);
        $('input[name=block]').val(block);

        $modalWidgetAdd.modal('show');
    });

    // add widget through link
    $document.on('click', '.widget-add', function(event) {
        var $button = $(this);
        var $block = $button.parents('.block');
        var $section = $button.parents('.section');

        if ($block.length == 0) {
            $block = $('.block', $section).first();
        }

        $('input[name=section]').val($section.data('section'));
        $('input[name=block]').val($block.data('block'));

        $modalWidgetAdd.modal('show');
    });

    // widget add button
    $widgetAddButton.on('click', function(e) {
        e.preventDefault();

        widgetAdd();
    });

    // widget add and close button
    $widgetAddAndCloseButton.on('click', function(e) {
        e.preventDefault();

        widgetAdd();

        $modalWidgetAdd.modal('hide');
    });

    // delete a widget
    $document.on('click', '.widget-delete', function(e) {
        e.preventDefault();

        var $this = $(this);
		if (!confirm($this.data('confirm'))) {
            return;
        }

        var $section = $this.closest('.section');
        var $block = $this.closest('.block');
        var $widget = $this.closest('.widget');

        $.ajax({
            url: baseUrl + '/sections/' + $section.data('section') + '/block/' + $block.data('block') + '/widget/' + $widget.data('widget'),
            type: 'DELETE',
            success: function(result) {
                $widget.remove();
            }
        });
    });

    initWidgetOrder(baseUrl);
}
