$(function() {
    $("#form-search-result-engine").change(function() {
        $(this).parents("form").submit();
    });
});
