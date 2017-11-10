$(function () {
    var is_processing = false;
    var last_page = false;
    var add_more = false;
    var blockableElement = null;
    var xhr = null;
    var last_phrases = "";
    var first = true;
    var options = {
        target: '#offreList', // target element(s) to be updated with server response 
        beforeSubmit: showRequest, // pre-submit callback 
        success: showResponse, // post-submit callback 

        // other available options: 
        url: Routing.generate('eco_job_anonymous_offre_search_ajax_templated'),
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
    })
    $("#contrat").on('change', function () {
        xhr = performSearch();
    });
    $("#reset").click(function (e) {
        e.preventDefault();
        resetForm();
        resetDetails();
    });
    function resetDiv() {
        $('#offreList').children().remove();
        $('#offreList').empty();
    }
    function resetDetails() {
        $('#details').children().remove();
        $("#details").empty();
    }
    function showRequest(formData, jqForm, options) {

    }
    function showResponse(responseText, statusText, xhr, $form) {
        if (xhr.status == 200) {
            console.log("response");
            console.log(responseText.responseJSON);
            if (!add_more) {
                resetDetails();
                if (responseText.total > 0) {
                    resetDiv();
                    $("#offreList").append("<div class='title6'>Résultats </div> <br> Total: " + responseText.total);
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
        } else
            $('#offreList').append("Echec de la connexion au serveur");
        loadCards();
        loadNetworks();
        IN.parse();
        
    }
    $(document).on('click', '.save', function () {
        $('#globModal').modal('show');
    });
    $("#limit").on('change', function () {
        xhr = performSearch();
    });
    function resetForm() {
        $("#offreList").append("<div class='loader'></div>");
        $("#exp").val("0");
        $("#contrat3").prop('checked', true);
        $("#searchBar").val("");
        xhr = performSearch();

    }
    function performSearch() {
        last_page = false;
        $('.loader').remove();
        $("#offreList").children().remove();
        $("#offreList").append("<div class='loader'></div>");
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

    function showOffre(id) {
        $.ajax({
            url: Routing.generate('eco_job_anonymous_offre_details', {id: id}),
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            beforeSend: function () {
                resetDetails();
                $('#details').block({message: "<div class='loader'></div>", css: {border: 'none', backgroundColor: 'transparent', width: '66px'}});
            },
            contentType: false,
            statusCode: {
                200: function (response) {
                    resetDetails();
                    $('#details').append(response.html);
                    console.log(response);
                },
                412: function (response) {
                    resetDetails();
                    $('#details').append("Echec de la connexion au serveur");

                },
                500: function (response) {
                    resetDetails();
                    $('#details').append("Echec de la connexion au serveur");
                },
                complete: function () {
                    $('#details').unblock();
                }
            }
        });
    }
    ;
    $(document).on('click', '.offre:not(.offre>.cd-add-to-cart)', function () {
        showOffre($(this).attr('offreId'));
    });
    $("#offreList").scroll($.debounce(addMore, 500));
    $(document).on('click', '.save', function () {
        $('#globModal').modal('show');
    });
    function addMore() {
        if ($(this).scrollTop() + $(this).innerHeight() == $(this)[0].scrollHeight) {
            if (!(is_processing && last_page)) {
                $('.loader').remove();
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
    }
    ;
});
