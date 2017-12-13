$(function () {
    var cv = loadCVSubmition();
    var cv_edit = loadCVEditSubmition();
    var lettre = loadLettreSubmition();
    var lettre_edit = loadLettreEditSubmition();
    var lettre_id =0;
    var cv_id = 0;

    function loadCVSubmition() {
        function showRequest(formData, jqForm, options) {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        }
        var cvOptions = {
            target: '#cv', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseCV, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_cv_fichier'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 addCV
        };

        function showResponseCV(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#cv").children().remove();
                $("#cv").append(responseText.html);
                if(responseText.error == true){
                    $("#cv .collapse").addClass('in');
                }                

            } else {
                alert("Une erreur s'est produite.");
            }
            cv = loadCVSubmition();
            $.unblockUI();
        }
        $(document).on('submit', '#addCVForm', function (e) {
            e.preventDefault();
            if ($("#ecojob_candidatbundle_cvfichier_fichier").val() == "") {
                alert("Veuillez d'abord choisir le fichier.");
                return false;
            } else {
                $('#addCVForm').ajaxSubmit(cvOptions);
                return false;
            }
        });
    }
    function loadCVEditSubmition(id) {
        function showRequest(formData, jqForm, options) {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        }
        var cvOptions = {
            target: '#cv', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseCV, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_cv_fichier',{id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 addCV
        };

        function showResponseCV(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#cv").children().remove();
                $("#cv").append(responseText.html);
                if(responseText.error == true){
                    $("#cv .collapse").addClass('in');
                }

            } else {
                alert("Une erreur s'est produite.");
            }
            //cv = loadCVSubmition();
            $.unblockUI();
        }
        $('#editCVForm').submit(function (e) {
            e.preventDefault();
            if ($("#ecojob_candidatbundle_cvfichier_fichier").val() == "") {
                alert("Veuillez d'abord choisir le fichier.");
                return false;
            } else {
                $('#editCVForm').ajaxSubmit(cvOptions);
                return false;
            }
        });
    }

    $(document).on('click', '.editCV', function () {
        var id = $(this).attr('cvId');
        cv_id = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_cv_fichier', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $("#cv").children().remove();
                $("#cv").append(response.html);
                $("#cv .collapse").addClass('in');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });

    });
    function loadLettreSubmition() {
        function showRequest(formData, jqForm, options) {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        }
        var lOptions = {
            target: '#lettre', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseL, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_lettre'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 addCV
        };

        function showResponseL(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#lettre").children().remove();
                $("#lettre").append(responseText.html);
                if(responseText.error == true){
                    $("#lettre .collapse").addClass('in');
                }                

            } else {
                alert("Une erreur s'est produite.");
            }
            //lettre = loadLettreSubmition();
            //lettre_edit = loadLettreEditSubmition();
            $.unblockUI();
        }
        $('#addLettreForm').submit(function (e) {
            e.preventDefault();
            if ($("#ecojob_candidatbundle_lettre_fichier").val() == "") {
                alert("Veuillez d'abord choisir le fichier.");
                return false;
            } else {
                $('form[name=ecojob_candidatbundle_lettre]').ajaxSubmit(lOptions);
                return false;
            }
        });
    }

    $(document).on('click', '.editLettre', function () {
        var id = $(this).attr('lettreId');
        lettre_id = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_lettre', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $("#lettre").children().remove();
                $("#lettre").append(response.html);
                $("#lettre .collapse").addClass('in');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });

    });
    $(document).on('click', '#editLettreForm button[type=submit]', function () {
        lettre_edit = loadLettreEditSubmition(lettre_id);
    });

    $(document).on('click', '#editCVForm button[type=submit]', function () {
        cv_edit = loadCVEditSubmition(cv_id);
    });    
    function loadLettreEditSubmition(id) {
        function showRequest(formData, jqForm, options) {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        }
        var lOptions = {
            target: '#lettre', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseL, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_lettre',{id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 addCV
        };

        function showResponseL(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#lettre").children().remove();
                $("#lettre").append(responseText.html);
                if(responseText.error == true){
                    $("#lettre .collapse").addClass('in');
                }                  

            } else {
                alert("Une erreur s'est produite.");
            }
            //lettre = loadLettreSubmition();
            //lettre_edit = loadLettreEditSubmition();
            $.unblockUI();
        }
        $('#editLettreForm').submit(function (e) {
            e.preventDefault();
            if ($("#ecojob_candidatbundle_lettre_fichier").val() == "") {
                alert("Veuillez d'abord choisir le fichier.");
                return false;
            } else {
                $('form[name=ecojob_candidatbundle_lettre]').ajaxSubmit(lOptions);
                return false;
            }
        });
    }

});