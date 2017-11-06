//

/*----------------------------------------------------*/
/* MOBILE DETECT FUNCTION
/*----------------------------------------------------*/
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};



/////////////////////// ready
$(document).ready(function() {



  /*----------------------------------------------------*/
  // carouFredSel.
  /*----------------------------------------------------*/
  var o = $('#banner .carousel.main ul');
  if (o.length > 0) {
    o.carouFredSel({
      auto: {
        timeoutDuration: 8000
      },
      responsive: true,
      prev: '.banner_prev',
      next: '.banner_next',
      width: '100%',
      scroll: {
        // fx : "crossfade",
        items: 1,
        duration: 1000,
        easing: "easeOutExpo"
      },
      items: {
            width: '300',
        height: 'variable', //  optionally resize item-height
        visible: {
          min: 1,
          max: 5
        }
      },
      mousewheel: false,
      swipe: {
        onMouse: true,
        onTouch: true
        }
    });
  }


  $(window).bind("resize",updateSizes_vat).bind("load",updateSizes_vat);
  function updateSizes_vat(){
    $('#banner .carousel.main ul').trigger("updateSizes");

  }
  updateSizes_vat();








	/*----------------------------------------------------*/
	// PARALLAX CALLING
	/*----------------------------------------------------*/
	$(window).bind('load', function () {
		parallaxInit();
	});
	function parallaxInit() {
		testMobile = isMobile.any();

		if (testMobile == null)
		{
			$('.parallax .bg1').addClass("bg-fixed").parallax("50%", 0.5);

		}
	}
	parallaxInit();




  /*----------------------------------------------------*/
  // Appear
  /*----------------------------------------------------*/
  $('.animated').appear(function() {
    // console.log("111111111111");
      var elem = $(this);
      var animation = elem.data('animation');
      if ( !elem.hasClass('visible') ) {
        var animationDelay = elem.data('animation-delay');
        if ( animationDelay ) {
          setTimeout(function(){
              elem.addClass( animation + " visible" );
          }, animationDelay);
        } else {
          elem.addClass( animation + " visible" );
        }
      }
  });


});

/////////////////////// load
$(window).load(function() {

  /*----------------------------------------------------*/
  // flexslider
  /*----------------------------------------------------*/


  /////// flexslider
  $('#flexslider').flexslider({
    animation: "fade",
    slideshow: true,
    slideshowSpeed: 7000,
    animationDuration: 600,
    pauseOnAction: true,
    prevText: "",
    nextText: "",
    controlNav: true,
    directionNav: false
  });




});