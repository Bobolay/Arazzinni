function initialize() {
	var styles = [
	  {
	    stylers: [
	      { hue: "#ffaa00" },
	      { saturation: -8 },
	      { lightness: 6 },
	      { gamma: 0.87 }
	    ]
	  },{
        featureType: "all",
        elementType: "geometry",
      },{
        featureType: "road",
        elementType: "labels",
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
        zoomControl:true,
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
        draggable: false,
        position: new google.maps.LatLng(40.6097477, -74.2979765),
        icon: image
    });
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');
}
google.maps.event.addDomListener(window, 'resize', initialize);
google.maps.event.addDomListener(window, 'load', initialize)