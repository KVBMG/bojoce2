$(function () {

    var locations = [];
    firstTime();
    //setTimeout(function(){initialize()},5000);
    var map;
    var markers = [];
    var infowindow;
    var markerCluster;
    var currentRequest = null;
    var xhr = null;
    var blockableElement = null;
    var perform = false;
    var last_phrases = "";
    var is_processing = false;
    var last_page = false;
    var add_more = false;
    var first = true;
    var show_offre = true;

    function fillMap() {
        var marker, i;

        for (i = 0; i < locations.length; i++) {

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i].latitude, locations[i].longitude),
                map: map,
                scaledSize: new google.maps.Size(22, 32),
                icon: assetsBaseDir + 'm2m.png'
            });
            attachSecretMessage(marker, locations[i]);
            markers.push(marker);

        }


        markerCluster = new MarkerClusterer(map, markers,
                {imagePath: assetsBaseDir + 'm'});
    }
    function attachSecretMessage(marker, secretMessage) {
        //var infowindow = new google.maps.InfoWindow({
        //    content: secretMessage.contenu
        //});

        marker.addListener('click', function () {
            $('#offreList').children().remove();
            showOffre(secretMessage.id);
        });
    }
    function firstTime() {
        infowindow = new google.maps.InfoWindow();
        $.ajax({
            url: Routing.generate('eco_job_anonymous_offre_search_ajax_templated'),
            type: 'GET',
            contentType: 'application/json',
            contentType: false,
            success: function (response) {
                response = $.parseJSON(response.objects);
                locations = response;
            },
            error: function () {
                alert("Echec lors de la connexion au serveur. Veuillez réessayer ou contacter l'administrateur");
            },
        }).done(function (response) {
            initialize();
        });
    }


    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng(46.9, 1.56),
            zoom: 6,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL
            },
            gestureHandling: 'greedy',
            styles: [{"featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"color": "#444444"}]}, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]}, {"featureType": "poi", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "road", "elementType": "all", "stylers": [{"saturation": -100}, {"lightness": 45}]}, {"featureType": "road.highway", "elementType": "all", "stylers": [{"visibility": "simplified"}]}, {"featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "water", "elementType": "all", "stylers": [{"color": "#01a2a6"}, {"visibility": "on"}]}]

        };
        map = new google.maps.Map(document.getElementById('google_map'),
                mapOptions);
        fillMap();
    }
    function removeMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers.length = 0;
        markerCluster.clearMarkers();
    }


    function showOffre(id) {
        $.ajax({
            url: Routing.generate('eco_job_anonymous_offre_details', {id: id}),
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            beforeSend: function () {
                resetDiv();
                $("#details").append("<div class='loader'></div>");
            },
            beforeSend: function () {
                if (blockableElement == null)
                    blockableElement = $('#google_map').block({message: "<div class='loader'></div>", css: {border: 'none', backgroundColor: 'transparent', width: '66px'}});
                else {
                    if (!(blockableElement.data('blockUI.isBlocked')))
                        blockableElement = $('#google_map').block({message: "<div class='loader'></div>", css: {border: 'none', backgroundColor: 'transparent', width: '66px'}});
                }

                if (xhr != null)
                    xhr.abort();
            },
            contentType: false,
            statusCode: {
                200: function (response) {
                    resetDiv();
                    $("#offreList").append(response.list);
                    $('#details').append(response.html);
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(response.lat, response.long),
                        map: map,
                        scaledSize: new google.maps.Size(22, 32),
                        icon: assetsBaseDir + 'm2m.png'
                    });
                    map.setZoom(17);
                    map.panTo(new google.maps.LatLng(response.lat, response.long));
                    google.maps.event.addListener(marker, 'click', function () {
                        return function () {
                            infowindow.setContent(response.titre);
                            showOffre(response.id);
                        }
                    });
                    //markerCluster = new MarkerClusterer(map, markers,{imagePath: assetsBaseDir + 'm'});

                },
                412: function (response) {
                    resetDiv();
                    $('#details').append("Echec de la connexion au serveur");

                },
                500: function (response) {
                    resetDiv();
                    $('#details').append("Echec de la connexion au serveur");
                }
            },
            complete: function () {
                $('#google_map').unblock();
            }
        });
    }
    ;
    $(document).on('click', '.offre', function () {
        showOffre($(this).attr('offreId'));
        show_offre = true;
    });
    $(document).on('click', '.save', function () {
        $('#globModal').modal('show');
    });
    function getOffres() {
        $.ajax({
            url: Routing.generate('eco_job_anonymous_offres_json'),
            type: 'GET',
            contentType: 'application/json',
            contentType: false,
            success: function (response) {
                response = $.parseJSON(response);
                locations = response;
            },
            error: function () {
                alert("Echec lors de la connexion au serveur. Veuillez réessayer ou contacter l'administrateur");
            }
        });
    }
    ;
    function resetDiv() {
        $('#details').children().remove();
        $('#details').empty();
    }
    function resetList() {
        $('#offreList').children().remove();
        $('#offreList').empty();
    }

    var options = {
        target: '#details',
        async: false,
        cache: false,
        beforeSubmit: showRequest,
        success: showResponse,
        url: Routing.generate('eco_job_anonymous_offre_search_ajax_templated'),
        type: 'post',
        dataType: 'json'
    };

    $('#searchForm').submit(function () {
        $('#searchForm').ajaxSubmit(options);
        return false;
    })
    $("#searchBar").keyup($.debounce(flushSearch, 500));

    function flushSearch() {
        var val = $("#searchBar").val();
        if ((val.length >= 3) || (val.length == 0) && (last_phrases != val)) {
            currentRequest = performSearch();
            last_phrases = this.value;
        }
    }
    $("#datePublication").on('change', function () {
        currentRequest = performSearch();
    });
    $("#secteur").on('change', function () {
        currentRequest = performSearch();
    });    
    $("#contrat").on('change', function () {
        currentRequest = performSearch();
    });
    $("#limit").on('change', function () {
        currentRequest = performSearch();
    });
    $("#reset").click(function (e) {
        e.preventDefault();
        resetDiv();
        removeMarkers();
        locations = [];
        var mapOptions = {
            center: new google.maps.LatLng(46.9, 1.56),
            zoom: 6,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true,
            gestureHandling: 'greedy',
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL
            },
            styles: [{"featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"color": "#444444"}]}, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]}, {"featureType": "poi", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "road", "elementType": "all", "stylers": [{"saturation": -100}, {"lightness": 45}]}, {"featureType": "road.highway", "elementType": "all", "stylers": [{"visibility": "simplified"}]}, {"featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "water", "elementType": "all", "stylers": [{"color": "#01a2a6"}, {"visibility": "on"}]}]


        };
        map = new google.maps.Map(document.getElementById('google_map'),
                mapOptions);
        markerCluster = new MarkerClusterer(map, markers,
                {imagePath: '../../../images/m'});
        resetForm();
    });

    function showRequest(formData, jqForm, options) {
        perform = true;
    }
    function showResponse(responseText, statusText, xhr, $form) {
        var resultats = $.parseJSON(responseText.objects);
        xhr = null;
        perform = false;
        if (!show_offre)
            removeMarkers();
        if (add_more) {
            console.log(locations);
            if (resultats.length > 0) {
                for (var i = 0; i < resultats.length; i++) {
                    locations.push(resultats[i]);
                }
            }
            console.log(locations);
        } else {
            locations = [];
            locations = resultats;
            resetList();
            resetDiv();
        }
        fillMap();
        $('#google_map').unblock();
        if (!add_more) {
            resetDiv();
            if (responseText.total > 0) {
                resetDiv();
                $("#offreList").append("<div class='title6' id='res'>Résultats  <br> Total: " + responseText.total+ "</div>");
                $('#offreList').append(responseText.html);

            } else {
                if (!first) {
                    var html = "<div class='news1'><div class='txt2'>Aucune offre d'emploi trouvée</div><div class='txt3'></div></div>";
                    resetDiv();
                    $('#offreList').append(html);
                }
            }
            $("#offreList").on('scroll', $.debounce(addMore, 500));

        } else {
            $(".loader").remove();
            $('#offreList').unblock();
            if (responseText.total > 0) {
                $('#offreList').append(responseText.html);
                $("#offreList").on('scroll', $.debounce(addMore, 500));

            } else {
                console.log("last_page");
                console.log(responseText);
                last_page = true;
                $('#offreList').append("Fin de la correspondance");
            }
        }
        loadCards();
        loadNetworks();
        IN.parse();
    }
    function resetForm() {
        $("#datePublication").val("-1");
        $("#contrat").val("0");
        $("#secteur").val("0");        
        $("#searchBar").val("");
        $("#limit").val("10");
        currentRequest = performSearch();
    }
    function performSearch() {
        $("#offreList").children().remove().append("<div class='loader'></div>");
        $("#offreList").append("<div class='loader'></div>");
        add_more = false;
        is_processing = false;
        last_page = false;
        show_offre = false;
        first = false;
        $("#offset").val(0);
        $('#offreList').scrollTop(0);
        if (blockableElement == null)
            blockableElement = $('#google_map').block({message: "<div class='loader'></div>", css: {border: 'none', backgroundColor: 'transparent', width: '66px'}});
        else {
            if (!(blockableElement.data('blockUI.isBlocked')))
                blockableElement = $('#google_map').block({message: "<div class='loader'></div>", css: {border: 'none', backgroundColor: 'transparent', width: '66px'}});
        }

        if (xhr != null)
            xhr.abort();
        removeMarkers();
        locations = [];

        var form = $("#searchForm").submit();
        xhr = form.data('jqxhr');
    }

    $("#offreList").scroll($.debounce(addMore, 500));

    $(document).on('click', '.save', function () {
        $('#globModal').modal('show');
    });
    function addMore() {
        if ($(this).scrollTop() + $(this).innerHeight() == $(this)[0].scrollHeight) {
            if (!(is_processing && last_page)) {
                $("#offreList").off('scroll');
                $("#offreList").append("<div class='loader'></div>").scrollTop($(this)[0].scrollHeight);
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
    function loadCards() {
        var cartWrapper = $('.cd-cart-container');
        //product id - you don't need a counter in your real project but you can use your real product id
        var productId = 0;

        if (cartWrapper.length > 0) {
            //store jQuery objects
            var cartBody = cartWrapper.find('.body')
            var cartList = cartBody.find('ul').eq(0);
            var cartTotal = cartWrapper.find('.checkout').find('span');
            var cartTrigger = cartWrapper.children('.cd-cart-trigger');
            var cartCount = cartTrigger.children('.count')
            var addToCartBtn = $('.cd-add-to-cart');
            var undo = cartWrapper.find('.undo');
            var undoTimeoutId;

            //add product to cart
            addToCartBtn.on('click', function (event) {
                event.preventDefault();
                addToCart($(this));
                animate($(this));
            });

            //open/close cart
            cartTrigger.on('click', function (event) {
                event.preventDefault();
                toggleCart(true);
            });

            //close cart when clicking on the .cd-cart-container::before (bg layer)
            cartWrapper.on('click', function (event) {
                if ($(event.target).is($(this)))
                    toggleCart(true);
            });

            //delete an item from the cart
            cartList.on('click', '.delete-item', function (event) {
                event.preventDefault();
                removeProduct($(event.target).parents('.product'));
            });

            //update item quantity
            cartList.on('change', 'select', function (event) {
                quickUpdateCart();
            });

            //reinsert item deleted from the cart
            undo.on('click', 'a', function (event) {
                clearInterval(undoTimeoutId);
                event.preventDefault();
                cartList.find('.deleted').addClass('undo-deleted').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function () {
                    $(this).off('webkitAnimationEnd oanimationend msAnimationEnd animationend').removeClass('deleted undo-deleted').removeAttr('style');
                    quickUpdateCart();
                });
                undo.removeClass('visible');
            });
        }

        function toggleCart(bool) {
            var cartIsOpen = (typeof bool === 'undefined') ? cartWrapper.hasClass('cart-open') : bool;

            if (cartIsOpen) {
                cartWrapper.removeClass('cart-open');
                //reset undo
                clearInterval(undoTimeoutId);
                undo.removeClass('visible');
                cartList.find('.deleted').remove();

                setTimeout(function () {
                    cartBody.scrollTop(0);
                    //check if cart empty to hide it
                    cartWrapper.addClass('empty');
                }, 500);
            } else {
                cartWrapper.addClass('cart-open');
            }
        }

        function addToCart(trigger) {
            var cartIsEmpty = cartWrapper.hasClass('empty');

            var _offreId = trigger.data('offre-id');
            //update cart product list
            addProduct(cartIsEmpty, _offreId).complete(function () {
                cartWrapper.removeClass('empty');
                trigger.replaceWith('<a href="#" class="btn-default btn-warning">Déja sauvegardée</a>');
                toggleCart(true);
            });

        }

        function animate(trigger) {
            var imgtodrag = trigger;
            if (imgtodrag) {
                var imgclone = imgtodrag.clone()
                        .offset({
                            top: imgtodrag.offset().top,
                            left: imgtodrag.offset().left
                        })
                        .css({
                            'opacity': '0.5',
                            'position': 'absolute',
                            'height': '150px',
                            'width': '150px',
                            'z-index': '100'
                        })
                        .appendTo($('body'))
                        .animate({
                            'top': cartTrigger.offset().top - 150,
                            'left': cartTrigger.offset().left,
                            'width': 75,
                            'height': 75
                        }, 3000, 'easeInOutExpo');

                setTimeout(function () {
                    cartTrigger.effect("shake", {
                        times: 2
                    }, 200);
                }, 1500);

                imgclone.animate({
                    'width': 0,
                    'height': 0
                }, function () {
                    $(this).detach();
                });
            } else {
                alert("not defined");
            }
        }

        function addProduct(cartIsEmpty, id) {
            var xhr = $.ajax({
                url: Routing.generate('eco_job_candidat_offre_save_async', {id: id}),
                method: 'GET'
            }).success(function (data) {
                //update number of items
                updateCartCount(cartIsEmpty, data.saved);
            }).error(function (err) {
                console.warn(err);
            });
            return xhr;
        }

        function removeProduct(product) {
            clearInterval(undoTimeoutId);
            cartList.find('.deleted').remove();

            var topPosition = product.offset().top - cartBody.children('ul').offset().top,
                    productQuantity = Number(product.find('.quantity').find('select').val()),
                    productTotPrice = Number(product.find('.price').text().replace('$', '')) * productQuantity;

            product.css('top', topPosition + 'px').addClass('deleted');

            //update items count + total price
            //(productTotPrice, false);
            updateCartCount(true, -productQuantity);
            undo.addClass('visible');

            //wait 8sec before completely remove the item
            undoTimeoutId = setTimeout(function () {
                undo.removeClass('visible');
                cartList.find('.deleted').remove();
            }, 8000);
        }

        function quickUpdateCart() {
            var quantity = 0;
            var price = 0;

            cartList.children('li:not(.deleted)').each(function () {
                var singleQuantity = Number($(this).find('select').val());
                quantity = quantity + singleQuantity;
                price = price + singleQuantity * Number($(this).find('.price').text().replace('$', ''));
            });

            cartTotal.text(price.toFixed(2));
            cartCount.find('li').eq(0).text(quantity);
            cartCount.find('li').eq(1).text(quantity + 1);
        }

        function updateCartCount(emptyCart, quantity) {
            // if( typeof quantity === 'undefined' ) {
            //     var actual = Number(cartCount.find('li').eq(0).text()) + 1;
            //     var next = actual + 1;
            //
            //     if( emptyCart ) {
            //         cartCount.find('li').eq(0).text(actual);
            //         cartCount.find('li').eq(1).text(next);
            //     } else {
            //         cartCount.addClass('update-count');
            //
            //         setTimeout(function() {
            //             cartCount.find('li').eq(0).text(actual);
            //         }, 150);
            //
            //         setTimeout(function() {
            //             cartCount.removeClass('update-count');
            //         }, 200);
            //
            //         setTimeout(function() {
            //             cartCount.find('li').eq(1).text(next);
            //         }, 230);
            //     }
            // } else {
            //     var actual = Number(cartCount.find('li').eq(0).text()) + quantity;
            //     var next = actual + 1;

            cartCount.find('li').eq(0).text(quantity);
            cartCount.find('li').eq(1).text(quantity);
            //}
        }


    }
    ;
    function loadNetworks() {
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
            }, function (response) {});
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
                        css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
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
    }
    ;
});
