function handleTextReuse(isChecked) {
    if (isChecked) {
        $('.alert-warning').addClass('hide');
    } else {
        $('.alert-warning').removeClass('hide');
    }
}

$('#form-text-existing-new').change(function() {
    handleTextReuse($(this).is(':checked'));

    return false;
});
handleTextReuse($('#form-text-existing-new').is(':checked'));

$('.row-existing').addClass('hide').on('change', function() {
    var $this = $(this);

    var url = $this.data('url-text');
    url = url.replace('%25id%25', $('select', $this).val());

    $.get(url, function(data) {
        var preview = '';
        if (data.title) {
            preview += '<h3>' + data.title + '</h3>';
        }
        if (data.subtitle) {
            preview += '<h4>' + data.subtitle + '</h4>';
        }
        if (data.body) {
            preview += data.body;
        }

        $('.preview', $this).html(preview);
    });
});

$('#btn-text-reuse').click(function() {
    $('.tab').addClass('hide');
    $('.row-existing').removeClass('hide').data('id', $('.row-existing select').val());

    $('#btn-cancel').click(function() {
        $('.row-existing select').val($('.row-existing').data('id'));

        $('.tab').removeClass('hide');
        $('.row-existing').addClass('hide');

        $('#btn-cancel').unbind();
        $('#btn-submit').unbind();

        return false;
    });

    $('#btn-submit').click(function() {
        var oldTextId = $('.row-existing').data('id');
        var textId = $('.row-existing select').val();
        if (textId && textId != oldTextId) {
            var form = $('#form-text');

            var url = form.attr('action') + '?text=' + textId;
            if ($('#form-text-existing-new').is(':checked')) {
                url += '&new=1';
            }

            form.attr('action', url);
        } else {
            $('#btn-cancel').trigger('click');

            return false;
        }
    });
});
