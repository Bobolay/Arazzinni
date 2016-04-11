function initialize() {
	var styles = [
	  {
	    stylers: [
	      { hue: "#ffaa00" },
	      { saturation: -8 },
	      { lightness: 6 },
	      { gamma: 0.87 }
	    ]
	  }
	];
    var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
    
    var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
    var isDraggable = w > 640 ? true : false;
    var xCordinate, zoomZoom = null;
    if (w > 640){
        xCordinate = 23.9097038;
        zoomZoom = 15;
    } else {
        xCordinate = 23.9097038;
        zoomZoom = 15;
    }

    var mapOptions = {
        zoom: zoomZoom,
        center: new google.maps.LatLng(40.6097477, -74.2979765),
        panControl:false,
        zoomControl:false,
        mapTypeControl:false,
        scaleControl:false,
        streetViewControl:false,
        overviewMapControl:false,
        rotateControl:false,
        draggable: isDraggable,
        scrollwheel: false,
        mapTypeControlOptions:{
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, "map_style"]
        }
    };
    var map = new google.maps.Map(document.getElementById('googleMap'),
        mapOptions);
    var image = '/assets/icons/map-icon.svg'
    var marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: new google.maps.LatLng(40.6097477, -74.2979765),
        icon: image
    });


    var div = '<div id="marker-popup">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Arazzinni</h1>'+
    '<div id="bodyContent">'+
    '<p>Arazzinni address</p>'+
    '</div>'+
    '</div>';

    marker = new RichMarker({
        map: map,
        position: new google.maps.LatLng(m.lat, m.lng),
        draggable: false,
        flat: true,
        anchor: RichMarkerPosition.MIDDLE,
        content: div
    });

    google.maps.event.addListener(marker, 'position_changed', function () {
        log('Marker position: ' + marker.getPosition());
    });

    // map.mapTypes.set('map_style', styledMap);
    // map.setMapTypeId('map_style');
    // google.maps.event.addListener(marker, 'click', function () {
    //     var popup = document.getElementById('marker-popup'),
    //     style = window.getComputedStyle(popup),
    //     opacity = style.getPropertyValue('opacity');
    //     if(opacity=='0'){
    //         popup.style.opacity=1;
    //     } else {
    //         popup.style.opacity=0;
    //     }
    //     console.log(opacity)
    // });
}
google.maps.event.addDomListener(window, 'resize', initialize);
google.maps.event.addDomListener(window, 'load', initialize)