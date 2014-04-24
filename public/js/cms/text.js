$('.row-existing').addClass('hide');

$('#btn-text-reuse').click(function() {
    $('.row-text').addClass('hide');
    $('.row-existing').removeClass('hide').data('id', $('.row-existing select').val());

    $('#btn-cancel').click(function() {
        $('.row-existing').addClass('hide');
        $('.row-text').removeClass('hide');

        $('#btn-cancel').unbind();
        $('#btn-submit').unbind();

        return false;
    });

    $('#btn-submit').click(function() {
        $('.row-existing').addClass('hide');
        $('.row-text').removeClass('hide');

        var oldTextId = $('.row-existing').data('id');
        var textId = $('.row-existing select').val();
        if (textId && textId != oldTextId) {
            var url = $('.row-existing').data('url-text');

            $.getJSON(url.replace('%25id%25', textId), function(data) {
                $('#form-text-text').html(data.text).trigger('change');
                $('#form-text-version').val(data.version);

                $('#btn-cancel').unbind();
                $('#btn-submit').unbind();
            });
        } else {
            $('#btn-cancel').unbind();
            $('#btn-submit').unbind();
        }

        return false;
    });
});
