var map;
var markersArray = [];
google.maps.Map.prototype.clearOverlays = function() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
}
function set_marker (evt) {
  map.clearOverlays();
  var marker = new google.maps.Marker({
    position: evt.latLng,
    map: map,
    title: 'La tarea se realizará cerca de esta zona'
  });
  markersArray.push(marker);
  jQuery('#job_latlong').val(evt.latLng);
}
function load_map (map_id, latitud, longitud) {
  google.maps.visualRefresh = true;
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(latitud, longitud),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById(map_id), mapOptions);
  google.maps.event.addListener(map, 'click', function(evt) {
    set_marker (evt);
  });
}
function initialize_map (map_id, latlong) {
  var loc = {};
  var geocoder = new google.maps.Geocoder();
  var latitud = 19.432560;
  var longitud = -99.128952;
  if (typeof latlong != 'undefined') {
    var coords = string_to_coords (latlong);
    latitud = jQuery.trim(coords[0]);
    longitud = jQuery.trim(coords[1]);
    load_map (map_id, latitud, longitud);
  }else{
    if(google.loader.ClientLocation) {
        loc.lat = google.loader.ClientLocation.latitude;
        loc.lng = google.loader.ClientLocation.longitude;

        var latlng = new google.maps.LatLng(loc.lat, loc.lng);
        geocoder.geocode({'latLng': latlng}, function(results, status) {
            if(status == google.maps.GeocoderStatus.OK) {
                latitud = results[0].geometry.location.jb;
                longitud = results[0].geometry.location.kb;
                load_map (map_id, latitud, longitud);
            };
        });
    }else{
      load_map (map_id, latitud, longitud);
    }
  }
}
function string_to_coords (latlong) {
  latlong = latlong.replace ('(', '');
  latlong = latlong.replace (')', '');
  return coords = latlong.split (',');
}
function onInit_Jobs() {
  if (jQuery('#map-canvas').exists()) {
    google.maps.visualRefresh = true;
    initialize_map ('map-canvas');
  }else if (jQuery('#single-map-canvas').exists()) {
    jQuery('section#listing > div.items > div.item').bind('click', function(item) {
      jQuery(this).next().toggle();
    });
    jQuery('section#listing > div.items > div.item.wrapper div.map').bind('click', function () {
      var latlong = jQuery(this).next().val();
      if (latlong != '') {
        var coords = string_to_coords (latlong);
        var latlong = new google.maps.LatLng (coords[0], coords[1]);
        new google.maps.Marker({
          position: latlong,
          map: map
        });
        jQuery('#single-map-canvas').show();
        google.maps.event.trigger (map, 'resize');
        map.setCenter(latlong);
      }
    });
    jQuery('div.clickable.choose').bind('click', function () {
      
    });
    initialize_map ('single-map-canvas', jQuery('#job_latlong').val());
  }
  jQuery('div.show').bind('click', function (item) {
    jQuery(this).next().toggle();
    if (jQuery('#map-canvas').exists() || jQuery('#single-map-canvas').exists()) {
      google.maps.event.trigger(map, 'resize');
    }
  });
}
jQuery (document)
  .on('page:change', function() {
    onInit_Jobs();
  })
  .ready(function() {
    onInit_Jobs();
  });
