$(function () {

    var globalId = undefined;

    $(document).find('#friendForm').on('submit', function (e) {
        e.preventDefault();

        var _formData = new FormData($(this)[0]),
            _url = Routing.generate('eco_job_anonymous_sendToFriend');
        if (globalId == undefined) {
            return;
        }
        console.log("sending");
        _formData.set('offreId', globalId);
        var _options = {
            url: _url,
            method: 'POST',
            processData: false,
            contentType: false,
            data: _formData,
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
                $('#responseStore').addClass('alert-danger').html("Echec lors de l'envoie").show();
            },
            success: function (data) {
                $(document).find('#friendModal').modal('hide');
            },
            complete: function () {
                $.unblockUI();
            }
        }
        $.ajax(_options);
    });

    $(document).find('#friendModal').on('shown.bs.modal', function (e) {
        var _id = $(e.relatedTarget).data('url-id');
        globalId = _id;
    });

    $(document).find('#friendModal').on('hidden.bs.modal', function () {
        globalId = undefined;
        $(this).find('[name="friendEmail"]').val('');
        $(this).find('[name="friendContent"]').val('');
        $('#responseStore').hide();
    });

});