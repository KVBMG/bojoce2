jQuery(document).ready(function($) {
	$('#alert_mail_non').change(function(event) {
		$('#ecojob_candidatbundle_paramcandidat_categorie').attr('disabled','disabled');
	});

	$('#alert_mail_oui').change(function(event) {
		$('#ecojob_candidatbundle_paramcandidat_categorie').removeAttr('disabled');
	});
});