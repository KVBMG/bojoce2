$(function () {
    var _url = window.location.href;
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1750551898578027',
            xfbml: true,
            version: 'v2.10'
        });
        FB.AppEvents.logPageView();
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    $('.fb-share').click(function (e) {
        e.preventDefault();
        var url = "ecojob.fr/valfid/developpement/web" + $(this).attr('href');
        FB.ui({
            method: 'share',
            display: 'popup',
            href: url, // to change with the true hrefLink when production
        }, function (response) {
        });
        return false;
    });

    $('.popup').click(function (event) {
        var width = 575,
            height = 400,
            left = ($(window).width() - width) / 2,
            top = ($(window).height() - height) / 2,
            url = this.href,
            opts = 'status=1' +
                ',width=' + width +
                ',height=' + height +
                ',top=' + top +
                ',left=' + left;

        window.open(url, 'twitter', opts);

        return false;
    });

    $('#candidatureForm').submit(function (event) {
        event.preventDefault();
        var form_data = $(this).serialize();
        console.log(form_data);
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: form_data,
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
            },
            complete: function () {
                $.unblockUI();
            }
        })
    });
})