$(function () {

    $('#candidatureForm').submit(function (event) {
        event.preventDefault();
        var form_data = $(this).serialize();
        console.log(form_data);
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: form_data,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {
                        border: 'none',
                        backgroundColor: 'transparent',
                        width: '66px',
                        top: ($(window).height() - 100) / 2 + 'px',
                        left: ($(window).width() - 100) / 2 + 'px',
                    }
                });
            },
            error: function (err) {
                $('#responseStore').addClass('alert-danger').html("L'envoie de votre candidature a échoué").show();
            },
            success: function (data) {
                $('#responseStore').addClass('alert-success').html(data.message).show();
                $('#postulerBtn').replaceWith("<a href=\"#\" class=\"btn-default btn-warning\">Déja postulé</a>");
                $('#m-m-u').modal('hide');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
});
