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

    function fillMap() {
        var marker, i;

        for (i = 0; i < locations.length; i++) {

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i].latitude, locations[i].longitude),
                map: map,
                scaledSize: new google.maps.Size(22, 32),
                icon: assetsBaseDir + 'm2.png'
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
            showOffre(secretMessage.id);
        });
    }
    function firstTime() {
        infowindow = new google.maps.InfoWindow();
        $.ajax({
            url: Routing.generate('eco_job_candidat_offres_json'),
            type: 'GET',
            contentType: 'application/json',
            contentType: false,
            success: function (response) {
                response = $.parseJSON(response);
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
            styles: [{"featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{"color": "#444444"}]}, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]}, {"featureType": "poi", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "road", "elementType": "all", "stylers": [{"saturation": -100}, {"lightness": 45}]}, {"featureType": "road.highway", "elementType": "all", "stylers": [{"visibility": "simplified"}]}, {"featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]}, {"featureType": "transit", "elementType": "all", "stylers": [{"visibility": "off"}]}, {"featureType": "water", "elementType": "all", "stylers": [{"color": "#01a2a6"}, {"visibility": "on"}]}]

        };
        map = new google.maps.Map(document.getElementById('google_map'),
                mapOptions);
        fillMap();
    }
    function removeMarkers() {
        locations = [];
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers.length = 0;
        markerCluster.clearMarkers();
    }


    function showOffre(id) {
        $.ajax({
            url: Routing.generate('eco_job_candidat_offre_details', {id: id}),
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
                    $('#details').append(response.html);
                    removeMarkers();
                    locations = [];
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(48.85661400000001, 2.3522219000000177),
                        map: map,
                        scaledSize: new google.maps.Size(22, 32),
                        icon: '../../../images/m2'
                    });
                    google.maps.event.addListener(marker, 'click', function () {
                        return function () {
                            infowindow.setContent(response.titre);
                            showOffre(response.id);
                        }
                    });
                    markerCluster = new MarkerClusterer(map, markers,
                            {imagePath: '../../../images/m'});

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
    });
    function getOffres() {
        $.ajax({
            url: Routing.generate('eco_job_candidat_offres_json'),
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
        url: Routing.generate('eco_job_candidat_offre_search_ajax'),
        type: 'post',
        dataType: 'json'
    };

    $('#searchForm').submit(function () {
        $('#searchForm').ajaxSubmit(options);
        return false;
    })
    $("#searchBar").on('keyup change', function () {
        var val = this.value;
        if(last_phrases != val){
        if ((val.length >= 3) || (val.length == 0)) {
            currentRequest = performSearch();
            console.log("Key up ato");
            last_phrases = this.value;
        }
    }
    });
    $("#exp").on('change', function () {
        currentRequest = performSearch();
        console.log("exp ato");
    });
    $("#contrat").on('change', function () {
        currentRequest = performSearch();
        console.log("contrat ato");
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
        resetList();
        resetDiv();
    }
    function showResponse(responseText, statusText, xhr, $form) {
        xhr = null;
        perform = false;
        locations = [];
        removeMarkers();
        locations = responseText;
        resetList();
        resetDiv();
        fillMap();
        $('#google_map').unblock();
        if (responseText.length > 0) {
            for (var i = 0; i < responseText.length; i++) {
                var html = "<div class='news1 offre' offreId=" + responseText[i].id + "><div class='txt2'><a href='#details'>" + responseText[i].titre + "</a></div><div class='txt3'>" + responseText[i].localisation + "</div></div>";
                $('#offreList').append(html);
            }
        } else {
            var html = "<div class='news1'><div class='txt2'>Aucune offre d'emploi trouvée</div><div class='txt3'></div></div>";
            $('#offreList').append(html);
            removeMarkers();
        }
    }
    function resetForm() {
        $("#exp").val("0");
        $("#contrat").val("0");
        $("#searchBar").val("");
        currentRequest = performSearch();
        console.log("Reset ato");
    }
    function performSearch() {
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
        resetList();
        resetDiv();
        var form = $("#searchForm").submit();
        xhr = form.data('jqxhr');
    }
});
