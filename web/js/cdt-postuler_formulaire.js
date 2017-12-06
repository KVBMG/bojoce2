$(function () {

    var _toggleState = true;
    var _editor = $(document).find('.editor');
    var _id = undefined;
    var _editorOptions = {
        imageUpload: false,
        fileUpload: false,
        videoUpload: false,
    }
    _editor.richText(_editorOptions);

    var handleChange = function (event) {
        if (_toggleState) {
            $(document).find('#ecojob_candidatbundle_candidature_cvFile_cvFile').attr('required', false);
            $(document).find('#ecojob_candidatbundle_candidature_cvFile_cvFile').hide();
            _toggleState = false;
            console.log(_toggleState);
        } else {
            $(document).find('#ecojob_candidatbundle_candidature_cvFile_cvFile').show();
            _toggleState = true;
            console.log(_toggleState);
        }
    };

    $(document).on('change', '#externalFile', handleChange.bind(this));

    $('#m-m-u').on('show.bs.modal', function (e) {
        _id = $(e.relatedTarget).data('offre-id');
        var html = $(e.relatedTarget).data('offre-titre');
        html = 'Postuler pour l\'offre : '+ html +'<button type="button" class="close" data-dismiss="modal">&times;</button>';
        $(this).find('.modal-title').html(html);
    });

    $('#m-m-u').on('hidden.bs.modal', function (e) {
        _id = undefined;
    });

    $(document).on('submit', '#candidatureForm', function (event) {
        event.preventDefault();
        var form_data = new FormData($(this)[0]);
        if(_id === undefined) {
            return;
        }
        form_data.set('offre_id',_id);
        $.ajax({
            url: $(this).attr('action'),
            method: 'POST',
            data: form_data,
            dataType: 'json',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
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
                console.log(data);
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
});
