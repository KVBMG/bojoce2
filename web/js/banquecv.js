$(function () {
    var is_processing = false;
    var last_page = false;
    var add_more = false;
    var blockableElement = null;
    var xhr = null;
    var last_phrases = "";
    var first = true;
    var autocomplete;
    var options = {
        target: '#cvList', // target element(s) to be updated with server response 
        beforeSubmit: showRequest, // pre-submit callback 
        success: showResponse, // post-submit callback 

        // other available options: 
        url: Routing.generate('eco_job_recruteur_banquecv_search'),
        type: 'post', // 'get' or 'post', override for form's 'method' attribute 
        dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
                //clearForm: true        // clear all form fields after successful submit 
                //resetForm: true        // reset the form after successful submit 

                // $.ajax options can be used here too, for example: 
                //timeout:   3000 
    };

    $('#searchForm').submit(function () {
        $('#searchForm').ajaxSubmit(options);
        return false;
    })
    $("#searchBar").keyup($.debounce(flushSearch, 500));

    function flushSearch() {
        var val = $("#searchBar").val();
        if ((val.length >= 3) || (val.length == 0) && (last_phrases != val)) {
            //if((val.slice(-1) != " ")){
            console.log((val.slice(-1) != " "));
            xhr = performSearch();
            last_phrases = this.value;
            //}
        }

    }
    $("#exp").on('change', function () {
        xhr = performSearch();
    });
    $("#nivFormation").on('change', function () {
        xhr = performSearch();
    });    
    $("#secteur").on('change', function () {
        xhr = performSearch();
    });    
    $("#reset").click(function (e) {
        e.preventDefault();
        resetForm();
    });
    function resetDiv() {
        $('#cvList').children().remove();
        $('#cvList').empty();
    }

    function showRequest(formData, jqForm, options) {

    }
    function showResponse(responseText, statusText, xhr, $form) {
        if (xhr.status == 200) {
            console.log("response");
            console.log(responseText.responseJSON);
            if (!add_more) {
                
                if (responseText.objects.length > 0) {
                    resetDiv();
                    $('#cvList').append(responseText.html);

                } else {
                    if (!first) {
                        var html = "<div class='news1'><div class='txt2'>Aucune offre d'emploi trouvée</div><div class='txt3'></div></div>";
                        resetDiv();
                        $('#cvList').append(html);
                    }
                }
            } else {
                $(".loader").remove();
                $('#cvList').unblock();
                if (responseText.length > 0) {
                    $('#cvList').append(responseText.html);
                    $("#cvList").on('scroll', $.debounce(addMore, 500));

                } else {
                    console.log("last_page");
                    console.log(responseText);
                    last_page = true;
                    $('#cvList').append("Fin de la correspondance");
                }
            }
        } else
            $('#cvList').append("Echec de la connexion au serveur");
    }
    $(document).on('click', '.cv', function () {
        showCV($(this).attr('cvId'));
    });
    $("#limit").on('change', function () {
        xhr = performSearch();
    });
    function resetForm() {
        $("#cvList").append("<div class='loader'></div>");
        $("#exp").val("0");
        $("#localisation").val("");
        $("#secteur").val("0");        
        $("#searchBar").val("");
        $("#nivFormation").val("0");
        $("#limit").val("10");
        
        xhr = performSearch();

    }
    function performSearch() {
        last_page = false;
        $("#cvList").children().remove().append("<div class='loader'></div>");
        $("#cvList").append("<div class='loader'></div>");
        add_more = false;
        is_processing = false;
        first = false;
        $("#offset").val(0);
        if (xhr != null)
            xhr.abort();

        var form = $("#searchForm").submit();
        xhr = form.data('jqxhr');
        console.log("perf");
        console.log(last_page);
        console.log(add_more);

    }

    function showCV(id) {        
        $.ajax({
            url: Routing.generate('eco_job_recruteur_banquecv_show', {id: id}),
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            beforeSend: function () {                
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });            },
            contentType: false,
            statusCode: {
                200: function (response) {
                    $('#globModal .modal-body').children().remove();
                    $('#globModal .modal-body').append(response);
                    $('#globModal').modal('show');
                    $.unblockUI();
                    
                },
                412: function (response) {                    
                    alert("Echec de la connexion au serveur");
                    $.unblockUI();                    
                },
                500: function (response) {                    
                    alert("Echec de la connexion au serveur");
                    $.unblockUI();                    
                },
                complete: function () {
                    $.unblockUI();
                }
            }
        });

    };

    $(document).on('click', '.curv', function () {
        showOffre($(this).attr('offreid'));
    });
    $("#cvList").scroll($.debounce(addMore, 500));

    function addMore() {
        if ($(this).scrollTop() + $(this).innerHeight() == $(this)[0].scrollHeight) {
            if (!(is_processing && last_page)) {
                $("#cvList").off('scroll');
                $("#cvList").append("<div class='loader'></div>").scrollTop($(this)[0].scrollHeight);
                first = false
                add_more = true;
                is_processing = true;
                var currOffset = parseInt($("#offset").val());
                var limit = parseInt($("#limit").val());
                $("#offset").val(currOffset + limit);
                if (xhr != null)
                    xhr.abort();
                var form = $("#searchForm").submit();
                xhr = form.data('jqxhr');
            }
        }
    }
    ;
});
