$(function(){
    $("#editCv").click( function(){
        $('form input').attr('readOnly',false);

        $('#editCv').replaceWith("<button type='submit' id='subCv' class='btn-default btn-cf-submit'>Modifier</button>")     
    });
    
});

