$(function () {

    var _toggleState = true;
    var _editor = $(document).find('.editor');
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

    $(document).on('submit', '#candidatureForm', function (event) {
        event.preventDefault();

        var form_data = new FormData($(this)[0]);
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
    $(document).on('submit', '#candidatureFormT', function (event) {
        event.preventDefault();
        var options = {
            target: '#candidatureFormT', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponse, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_trad_post', {id: offreid}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };
        function showRequest(formData, jqForm, options) {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        }
        function showResponse(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                if (typeof curr_post !== 'undefined') {
                curr_post.replaceWith("<a href=\"#\" class=\"btn-default btn-warning\">Déja postulé</a>");
                }
                $('#postulerBtn').replaceWith("<a href=\"#\" class=\"btn-default btn-warning\">Déja postulé</a>");
                
                $('.modal').modal('hide');
            } else {
                alert("Une erreur s'est produite. Connexion au serveur impossible.");
            }
            $.unblockUI();
        }
        $('#candidatureFormT').submit(function (e) {
            e.preventDefault();
            $('#candidatureFormT').ajaxSubmit(options);
            return false;


        });
        $("#candidatureFormT").submit();
    });
});
