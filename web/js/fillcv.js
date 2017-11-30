$(function () {
    $('.form-group').addClass('col-sm-12');
    var photo = loadPhotoSubmition();
    var cv = loadCVSubmition();
    var et = loadEtatCivilSubmition();
    var formation = loadFormationSubmition();
    var experience = loadExperienceSubmition();
    var competence = loadCompetenceSubmition();
    var langue = loadLangueSubmition();
    var editFormation, formation_edit, experience_edit, editExperience, langue_edit, editLangue,competence_edit,editCompetence;
    $(document).on('click', '.editFormation', function () {
        var id = $(this).attr('formationId');
        formation_edit = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_formation', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal .modal-body').children().remove();
                $('#globModal .modal-body').append(response.html);
                $('#globModal').modal('show');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
    $(document).on('click', '.editExperience', function () {
        var id = $(this).attr('experienceId');
        experience_edit = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_experience', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal .modal-body').children().remove();
                $('#globModal .modal-body').append(response.html);
                $('#globModal').modal('show');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
    $(document).on('click', '.editLangue', function () {
        var id = $(this).attr('langueId');
        langue_edit = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_langue', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal .modal-body').children().remove();
                $('#globModal .modal-body').append(response.html);
                $('#globModal').modal('show');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
    $(document).on('click', '.editCompetence', function () {
        var id = $(this).attr('competenceId');
        competence_edit = id;
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_candidat_edit_competence', {id: id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal .modal-body').children().remove();
                $('#globModal .modal-body').append(response.html);
                $('#globModal').modal('show');
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });

    $(document).on('click', '#editFormationForm button[type=submit]', function () {
        editFormation = loadEditFormationSubmittion(formation_edit);
    });
    $(document).on('click', '#editExperienceForm button[type=submit]', function () {
        editExperience = loadEditExperienceSubmittion(experience_edit);
    });
    $(document).on('click', '#editLangueForm button[type=submit]', function () {
        editLangue = loadEditLangueSubmittion(langue_edit);
    });
    
    $(document).on('click', '#editCompetenceForm button[type=submit]', function () {
        editCompetence = loadEditCompetenceSubmittion(competence_edit);
    });    
    function loadEditCompetenceSubmittion(id) {
        var options = {
            target: '#editCompetenceForm', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseCompetence, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_competence', {id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseCompetence(responseText, statusText, xhr, $form) {
            $("#editCompetenceForm").children().remove();
            $("#competenced").children().remove();
            if (xhr.status == 200) {
                $("#competenced").append(responseText.html);
                if (responseText.error != undefined) {
                    $('#globModal').modal('hide');
                    $("#globModal .modal-body").children().remove();
                    $('#globModal .modal-body').append(responseText.html);
                    $('#globModal').modal('show');
                } else {
                    $('#globModal').modal('hide');

                }
            } else {
                alert("Une erreur s'est produite.");
            }
            editLangue = loadEditLangueSubmittion();
            langue = loadLangueSubmition();
            $.unblockUI();
        }
        $('#editCompetenceForm').submit(function (e) {
            e.preventDefault();
            $('#editCompetenceForm').ajaxSubmit(options);
            return false;


        })
    }
    
    function loadEditLangueSubmittion(id) {
        var options = {
            target: '#editLangueForm', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseLangue, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_langue', {id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseLangue(responseText, statusText, xhr, $form) {
            $("#editLangueForm").children().remove();
            $("#langued").children().remove();
            if (xhr.status == 200) {
                $("#langued").append(responseText.html);
                if (responseText.error != undefined) {
                    $('#globModal').modal('hide');
                    $("#globModal .modal-body").children().remove();
                    $('#globModal .modal-body').append(responseText.html);
                    $('#globModal').modal('show');
                } else {
                    $('#globModal').modal('hide');

                }
            } else {
                alert("Une erreur s'est produite.");
            }
            editLangue = loadEditLangueSubmittion();
            langue = loadLangueSubmition();
            $.unblockUI();
        }
        $('#editLangueForm').submit(function (e) {
            e.preventDefault();
            $('#editLangueForm').ajaxSubmit(options);
            return false;


        })
    }
    function loadEditFormationSubmittion(id) {
        var options = {
            target: '#editFormationForm', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseFormation, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_formation', {id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseFormation(responseText, statusText, xhr, $form) {
            $("#editFormationForm").children().remove();
            $("#formation").children().remove();
            if (xhr.status == 200) {
                $("#formation").append(responseText.html);
                if (responseText.error != undefined) {
                    $('#globModal').modal('hide');
                    $("#globModal .modal-body").children().remove();
                    $('#globModal .modal-body').append(responseText.html);
                    $('#globModal').modal('show');
                } else {
                    $('#globModal').modal('hide');

                }
            } else {
                alert("Une erreur s'est produite.");
            }
            editFormation = loadEditFormationSubmittion();
            formation = loadFormationSubmition();
            
            $.unblockUI();
        }
        $('#editFormationForm').submit(function (e) {
            e.preventDefault();
            $('#editFormationForm').ajaxSubmit(options);
            return false;


        })
    }
    function loadEditExperienceSubmittion(id) {
        var options = {
            target: '#editExperienceForm', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseExperience, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_edit_experience', {id: id}),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseExperience(responseText, statusText, xhr, $form) {
            $("#editExperienceForm").children().remove();
            $("#experience").children().remove();
            if (xhr.status == 200) {
                $("#experience").append(responseText.html);
                if (responseText.error != undefined) {
                    $('#globModal').modal('hide');
                    $("#globModal .modal-body").children().remove();
                    $('#globModal .modal-body').append(responseText.html);
                    $('#globModal').modal('show');
                } else {
                    $('#globModal').modal('hide');

                }
            } else {
                alert("Une erreur s'est produite.");
            }
            editExperience = loadEditExperienceSubmittion();
            experience = loadExperienceSubmition();
            $.unblockUI();
        }
        $('#editExperienceForm').submit(function (e) {
            e.preventDefault();
            $('#editExperienceForm').ajaxSubmit(options);
            return false;


        })
    }
    function showRequest(formData, jqForm, options) {
        $.blockUI({
            message: '<p class="loader"></p>',
            css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
        });
    }
    function loadPhotoSubmition() {
        var photoOptions = {
            target: '#photo', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponsePhoto, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_photo'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponsePhoto(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#photo img").remove();
                $("#photo .help-block").remove();
                $('#photo .form-group').removeClass('has-error');                
                if (responseText.error != undefined) {
                    $('#photo').children().remove();
                    $("#photo").append(responseText.html);
                } else {
                    $("#photo").prepend("<img class='img-responsive' height='200px' width='200px' src='" + assetsImages + "/" + responseText.url + "'/>");
                    $("#photo button").text("Mettre à jour");
                }

            } else {
                $("#photo").children().remove();

                if (responseText != undefined) {
                    $("#photo").append(responseText.html);
                } else
                    alert("Une erreur s'est produite.");
            }
            photo = loadPhotoSubmition();
            $.unblockUI();
        }
        $('#photoForm').submit(function (e) {
            e.preventDefault();
            if ($("#ecojob_userbundle_image_imageFile").val() == "") {
                alert("Veuillez d'abord choisir la photo.");
                return false;
            } else {
                $('#photoForm').ajaxSubmit(photoOptions);
                return false;
            }
        })
    }

    function loadCVSubmition() {
        var cvOptions = {
            target: '#cv', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseCV, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_cvfile'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseCV(responseText, statusText, xhr, $form) {
            if (xhr.status == 200) {
                $("#cv a").remove();
                $("#cv .help-block").remove();
                $('#cv .form-group').removeClass('has-error');
                if (responseText.error != undefined) {
                    $("#cv").children().remove();
                    $("#cv").append(responseText.html);
                } else {
                    $("#cv").prepend("<a href='" + assetsCv + responseText.url + "' target='_blank'>" + responseText.url + "</a>");
                    $("#cv button").text("Mettre à jour");
                }

            } else {
                $("#cv").children().remove();

                if (responseText != undefined) {
                    $("#cv").append(responseText.html);
                } else
                    alert("Une erreur s'est produite.");
            }
            cv = loadCVSubmition();
            $.unblockUI();
        }
        $('#cvForm').submit(function (e) {
            e.preventDefault();
            if ($("#ecojob_candidatbundle_cvfile_cvFile").val() == "") {
                alert("Veuillez d'abord choisir le fichier.");
                return false;
            } else {
                $('#cvForm').ajaxSubmit(cvOptions);
                return false;
            }
        })
    }

    function loadEtatCivilSubmition() {
        var cvOptions = {
            target: '#etat_civil', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseEtatCivil, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_et'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseEtatCivil(responseText, statusText, xhr, $form) {
            $("#etat_civil").children().remove();
            if (xhr.status == 200) {
                $("#etat_civil").append(responseText.html);
                if (responseText.error != undefined) {
                    $("#etat_civil .collapse").addClass('in');
                } else {
                    $("#etat_civil button[type=submit]").text("Mettre à jour");
                }

            } else {
                alert("Une erreur s'est produite.");
            }
            et = loadEtatCivilSubmition();
            $.unblockUI();
        }
        $('#etatCivilForm').submit(function (e) {
            e.preventDefault();
            $('#etatCivilForm').ajaxSubmit(cvOptions);
            return false;


        })
    }
    function loadFormationSubmition() {
        var formationvOptions = {
            target: '#formation', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseFormation, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_formation'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseFormation(responseText, statusText, xhr, $form) {
            $("#formation").children().remove();
            if (xhr.status == 200) {
                $("#formation").append(responseText.html);
                if (responseText.error != undefined) {
                    $("#formation .collapse").addClass('in');
                }
            } else {
                alert("Une erreur s'est produite.");
            }
            formation = loadFormationSubmition();
            $.unblockUI();
        }
        $('#formationForm').submit(function (e) {
            e.preventDefault();
            $('#formationForm').ajaxSubmit(formationvOptions);
            return false;


        })
    }
    function loadExperienceSubmition() {
        var formationvOptions = {
            target: '#experience', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseExperience, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_experience'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseExperience(responseText, statusText, xhr, $form) {
            $("#experience").children().remove();
            if (xhr.status == 200) {
                $("#experience").append(responseText.html);
                if (responseText.error != undefined) {
                    $("#experience .collapse").addClass('in');
                }
            } else {
                alert("Une erreur s'est produite.");
            }
            experience = loadExperienceSubmition();
            $.unblockUI();
        }
        $('#experienceForm').submit(function (e) {
            e.preventDefault();
            $('#experienceForm').ajaxSubmit(formationvOptions);
            return false;


        })
    }
    function loadLangueSubmition() {
        var formationvOptions = {
            target: '#langued', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseLangue, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_langue'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseLangue(responseText, statusText, xhr, $form) {
            $("#langued").children().remove();
            if (xhr.status == 200) {
                $("#langued").append(responseText.html);
                if (responseText.error != undefined) {
                    $("#langued .collapse").addClass('in');
                }
            } else {
                alert("Une erreur s'est produite.");
            }
            langue = loadLangueSubmition();
            $.unblockUI();
        }
        $('#langueForm').submit(function (e) {
            e.preventDefault();
            $('#langueForm').ajaxSubmit(formationvOptions);
            return false;


        })
    }

    function loadCompetenceSubmition() {
        var cvOptions = {
            target: '#competenced', // target element(s) to be updated with server response 
            beforeSubmit: showRequest, // pre-submit callback 
            success: showResponseEtatCivil, // post-submit callback 

            // other available options: 
            url: Routing.generate('eco_job_candidat_add_competence'),
            type: 'post', // 'get' or 'post', override for form's 'method' attribute 
            dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                    //clearForm: true        // clear all form fields after successful submit 
                    //resetForm: true        // reset the form after successful submit 

                    // $.ajax options can be used here too, for example: 
                    //timeout:   3000 
        };

        function showResponseEtatCivil(responseText, statusText, xhr, $form) {
            $("#competenced").children().remove();
            if (xhr.status == 200) {
                $("#competenced").append(responseText.html);
                if (responseText.error != undefined) {
                    $("#competenced .collapse").addClass('in');
                } else {
                    $("#competenced button[type=submit]").text("Mettre à jour");
                }

            } else {
                alert("Une erreur s'est produite.");
            }
            competence = loadCompetenceSubmition();
            $.unblockUI();
        }
        $('#competenceForm').submit(function (e) {
            e.preventDefault();
            $('#competenceForm').ajaxSubmit(cvOptions);
            return false;


        })
    }
});