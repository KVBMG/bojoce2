$(function(){
    var win = $('#offreList'),
        page = 1 ,
        cPage = 1,
        localData = [],
        offreLength = 0,
        user_id = $('#user-id-hidden').data('user-id');

    fetchItems(page);

    win.scroll(function() {
        var $this = $(this);
        var height = this.scrollHeight - $this.height(); // Get the height of the div
        var scroll = $this.scrollTop(); // Get the vertical scroll position
        var isScrolledToEnd = (scroll >= height);
        if (isScrolledToEnd) {
            page++;
            fetchItems(page);
        }
    });

    function fetchItems(start) {
        $.ajax({
            url: Routing.generate('eco_job_recruteur_candidatures_offre_list', {id: user_id, offset: start}),
        method: 'GET',
            beforeSend : function () {
            $.blockUI({
                message: '<p class="loader"></p>',
                css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
            });
        },
        success: function (data) {
            var _data = JSON.parse(data);
            renderItems(_data);
        },
        error: function (err) {
            console.warn(err);
        },
        complete: function () {
            $.unblockUI();
        }
    });
    }
    function renderItems(pageItem) {
        if(pageItem.length === 0) {
            $('#offreList').innerHTML ='Pas de résultats.';
            console.warn("empty");
            page = page - 1; // aucune incrémentation
        }else {
            pageItem.forEach(function (item, index, arr) {
                var itemState = '';
                var str = formatString(item.titre);
                if (item.valid === false) {
                    itemState = "list-group-item-warning disabled";
                }
                var list = '<a class="list-group-item offre-item ' + itemState + '" data-item-id="'+ item.id+'" href="'+ item.id+'"> ' + str + '</a>';
                $('#offreList').append(list);

            });
        }
    }
    function formatString(str) {
        if(str.length < 20) {
            return str;
        }else {
            return str.slice(0, 18) + '...';
        }
    }

    function formatDate(date) {
        date = new Date(date);
        var monthNames = [
            "January", "February", "March",
            "April", "May", "June", "July",
            "August", "September", "October",
            "November", "December"
        ];
        var day = date.getDate(),monthIndex = date.getMonth(),year = date.getFullYear();
        return day + ' ' + monthNames[monthIndex] + ' ' + year;
    }

    /**
     * onClick an offer and showing all its candidatures
     */
    $(document).on('click','a.offre-item',function(event){
        event.preventDefault();

        $('div#c-d').html('<div class="alert alert-info">En attente de votre choix....</div>');
        var _url = $(this).attr('href');
        var _offreId = $(this).attr('data-item-id');
        $(document).trigger("getOffreCandidatures",[event, _url,  _offreId]);

    });

    $(document).on("getOffreCandidatures", function (e, url, offreId) {
        var url = Routing.generate('eco_job_recruteur_offre_candidatures_template',{ 'id' : offreId});
        $.ajax({
            url : url,
            method: 'GET',
            beforeSend : function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success : function(result) {
                $('#candidatureList').html(result);
            },
            error : function (err) {
                console.warn(err);
            },
            complete: function () {
                $.unblockUI();
            }
        });

    });

    $(document).on('click','a.candidature-item',function(event){
        event.preventDefault();
        if(event.target !== this)
            return;
        var _id = $(this).attr('data-candidature-item-id');
        var _url = Routing.generate('eco_job_recruteur_candidature_detail',{ id : _id});

        $(document).trigger("getCandidatureDetail",_url);
    });
    1
    $(document).on('getCandidatureDetail', function (e,url) {
        $.ajax({
            url : url,
            method: 'GET',
            beforeSend : function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success : function(result) {
                $('#c-d').html(result);
            },
            error : function (err) {
                console.warn(err);
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
    var _cdId = null;
    var _ref = null;
    $('#modalDelete').on('show.bs.modal', function(e){
        var elem = $(e.relatedTarget);
        _ref = $(e.relatedTarget);
        _cdId = elem.data('candidature-id');
    });

    $('.btn-danger.d-c').on('click',function(e){
       $.ajax({
           'url' : Routing.generate('eco_job_recruteur_candidature_delete',{id : _cdId }),
           'method' : 'GET',
           beforeSend : function () {
               $.blockUI({
                   message: '<p class="loader"></p>',
                   css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
               });
           }
       }).success(function(data){
           $('#modalDelete').modal('hide');
           _ref.parent().hide();
       }).error(function(err){
            console.warn(err);
       }).complete(function(){
           _ref = null;
           _cdId = null;
           $.unblockUI();
       });
    });
});
