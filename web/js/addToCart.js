jQuery(document).ready(function ($) {
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
            $(document).on('click','.cd-add-to-cart', function (event) {
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
                if ($(event.target).is($(this))) toggleCart(true);
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
            var cartIsOpen = ( typeof bool === 'undefined' ) ? cartWrapper.hasClass('cart-open') : bool;

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
                //trigger.replaceWith('<a href="#" class="btn-default btn-warning">Déja sauvegardée</a>');
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
                        'top': cartTrigger.offset().top-150,
                        'left': cartTrigger.offset().left,
                        'width': 75,
                        'height': 75
                    }, 3000, 'easeInOutExpo');

                // setTimeout(function () {
                //     cartTrigger.effect("shake", {
                //         times: 2
                //     }, 200);
                // }, 1500);

                imgclone.animate({
                    'width': 0,
                    'height': 0
                }, function () {
                    $(this).detach();
                });
            }else {
                alert("not defined");
            }
        }

        function addProduct(cartIsEmpty, id) {
            var xhr = $.ajax({
                url: Routing.generate('eco_job_candidat_offre_save_async', {id: id}),
                method: 'GET'
            }).success(function (data) {
                //update number of items
                $('.cd-add-to-cart[data-offre-id='+ id +']').replaceWith('<a href="#" class="btn-default btn-warning">Déja sauvegardée</a>');
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
);