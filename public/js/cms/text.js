$('.row-existing').addClass('hide');

$('#btn-text-reuse').click(function() {
    $('#btn-text-reuse').parent().addClass('hide');
    $('.row-title').addClass('hide');
    $('.row-body').addClass('hide');
    $('.row-image-src').addClass('hide');
    $('.row-image-align').addClass('hide');
    $('.row-locales-all').addClass('hide');
    $('.row-existing').removeClass('hide').data('id', $('.row-existing select').val());

    $('#btn-cancel').click(function() {
        $('#btn-text-reuse').parent().removeClass('hide');
        $('.row-existing').addClass('hide');
        $('.row-title').removeClass('hide');
        $('.row-body').removeClass('hide');
        $('.row-image-src').removeClass('hide');
        $('.row-image-align').removeClass('hide');
        $('.row-locales-all').removeClass('hide');

        $('#btn-cancel').unbind();
        $('#btn-submit').unbind();

        return false;
    });

    $('#btn-submit').click(function() {
        $('.row-existing').addClass('hide');
        $('.row-title').removeClass('hide');
        $('.row-body').removeClass('hide');
        $('.row-image-src').removeClass('hide');
        $('.row-image-align').removeClass('hide');
        $('.row-locales-all').removeClass('hide');

        var oldTextId = $('.row-existing').data('id');
        var textId = $('.row-existing select').val();
        if (textId && textId != oldTextId) {
            var url = $('.row-existing').data('url-text');

            $.getJSON(url.replace('%25id%25', textId), function(data) {
                $('#form-text-title').val(data.title);
                $('#form-text-body').val(data.body).trigger('change');
                $('#form-text-image-src-hidden').val(data.image);
                $('#form-text-image-align').val(data.imageAlignment);
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
