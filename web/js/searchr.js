$(function () {
    var options = { 
        target:        '#result',   // target element(s) to be updated with server response 
        beforeSubmit:  showRequest,  // pre-submit callback 
        success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url: Routing.generate('eco_job_recruteur_offre_search'),
        type: 'post',       // 'get' or 'post', override for form's 'method' attribute 
        dataType: 'json'        // 'xml', 'script', or 'json' (expected server response type) 
        //clearForm: true        // clear all form fields after successful submit 
        //resetForm: true        // reset the form after successful submit 
 
        // $.ajax options can be used here too, for example: 
        //timeout:   3000 
    }; 
   
    $('#searchForm').submit(function() { 
        $('#searchForm').ajaxSubmit(options); 
        return false; 
    })    
    $("#searchBar").on('keyup change', function () {
        var val = this.value;
        if ((val.length >= 3)||(val.length == 0)) {
            performSearch();
        }
    });
    $("#exp").on('change', function () {
        performSearch();
    })
    $("input:radio[name='contrat']").on('change',function(){
        performSearch();
    });    
    $("#reset").click(function(e){
        e.preventDefault();
        resetForm();
    });
    function resetDiv() {
        $('#result').children().remove();
        $('#result').empty();
    }
    function showRequest(formData, jqForm, options){
        resetDiv();
        $("#result").append("<div class='loader'>Recherche en cours</div>");    
    }
    function showResponse(responseText, statusText, xhr, $form){
        resetDiv();        
        if(xhr.status == 200)
            $('#result').append(responseText.html);
        else
            $('#result').append("Echec de la connexion au serveur");
    }    
    function resetForm(){
        $("#exp").val("0");
        $("#contrat3").prop('checked', true);
        $("#searchBar").val("");
        performSearch();
    }
    function performSearch(){
        $( "#searchForm" ).submit();        
    }
    /*function performSearch() {
        var $form = $("#searchForm");
        console.log($form[0]);
        $.ajax({
            url: Routing.generate('eco_job_candidat_offre_search'),
            type: 'POST',
            data: new FormData($form[0]),
            processData: false,
            contentType: 'application/json',
            beforeSend: function () {
                resetDiv();
                $("#result").append("<div class='loader'>Recherche en cours</div>");
            },
            contentType: false,
            statusCode: {
                200: function (response) {
                    resetDiv();
                    $('#result').append(response.html);
                    console.log(response);
                },
                412: function (response) {
                    resetDiv();
                    $('#result').append("Echec de la connexion au serveur");

                },
                500: function (response) {
                    resetDiv();
                    $('#result').append("Echec de la connexion au serveur");
                }
            }
        });
    }
    */
});
