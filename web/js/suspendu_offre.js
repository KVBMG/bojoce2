$(function() {

	// $('#btn-republish').popover({
	// 	template : '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div><div style=" margin: 0;font-size: 14px;background-color: #f7f7f7;border-bottom: 1px solid #ebebeb;border-radius: 5px 5px 0 0;"><button type="button" class="btn btn-default" style="width:100%">Valider</button></div></div>',
	// 	content : '<div class="radio"><label><input type="radio" name="validite" value="2" checked="checked">2 jours</label></div><div class="radio"><label><input type="radio" name="validite" value="30">1 mois</label></div><div class="radio"><label><input type="radio" name="validite" value="90">3 mois</label></div><div class="radio"><label><input type="radio" name="validite" value="180">6 mois</label></div><div class="radio"><label><input type="radio" name="validite" value="360">1 an</label></div>',
	// 	html : true
	// });


	$('.btn-republish').click(function(event) {
		event.preventDefault();
		$href_btn = $(this);
		
		$('.popover').hide();
		$popover = $(this).next('div.popover');
		$popover.removeClass('hidden');
		$popover.fadeToggle();

		
		var position = $(this).position();
		var height = $popover.height() ;
		var width = $(this).width();
		$popover.css({
			top : position.top - (height/2) + $(this).height(),
			left: position.left + width

		});

		if($href_btn != null)
			$('.btn_valid_republish').click(function(event) {
				$(this).text('Veillez patienter ...');
				$(this).attr("disabled","disabled")
				var nbJour = $(this).parent('div').prev('div.popover-content').find('input:checked').val();
				var url = $href_btn.attr('href') + '/'+nbJour;
				$.ajax({
					url: url,
					type: 'GET',
				})
				.done(function() {
					window.location.reload();
				});
				$href_btn = null;
			});

		$('.popover').mouseleave(function(event) {
			$(this).fadeOut();
		});
		
	});

	

	


});