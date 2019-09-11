$('div.box input').on({
    "focus": function (e) {
        $(this).addClass("focus");
    },
    "blur": function (e) {
        if ($(this).val() == "") {
            $(this).removeClass("focus");
        } else {
            $(this).removeClass("show");
        }
    }
});

$('input.btn-log').on({
    "click": function (e) {
        if ($('#id').val() == "") {
            $('#id').addClass("show");
            $('#id').focus();
        } else if ($('#pwd').val() == "") {
            $('#pwd').addClass("show");
            $('#pwd').focus();
        } else {
            console.log("안녕");
            $('.form-login').submit();
        }
    }
});