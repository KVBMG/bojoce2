$(function () {

    var _toggleState = true;
    var _editor = $(document).find('#froala-editor');
    var _editorOptions = {
        inlineMode: false,
        toolbarButtons: ['undo', 'redo' , '|', 'bold','color', 'fontFamily', 'fontSize', 'inlineStyle', 'paragraphStyle', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'outdent', 'indent', 'clearFormatting','|', 'paragraphFormat','align','print'],
        toolbarButtonsXS: ['undo', 'redo' , '-', 'bold', 'italic', 'underline'],
        height: 250,
        quickInsertTags : [''],
        colorsBackground: ['#61BD6D', '#1ABC9C', '#54ACD2', 'REMOVE']
    };

    console.log('editor', _editor);
    _editor.froalaEditor(_editorOptions);


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

    $(document).on('submit', '#candidatureForm', function (event) {
        event.preventDefault();
        var description = _editor.froalaEditor('html.get');
        if(description === "") {
            alert("Veuillez remplir votre formulaire");
            return;
        }
        var form_data = new FormData($(this)[0]);
            form_data.set('description', description);
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
