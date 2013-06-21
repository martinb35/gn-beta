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
function load_map (latitud, longitud) {
  google.maps.visualRefresh = true;
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(latitud, longitud),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  google.maps.event.addListener(map, 'click', function(evt) {
    set_marker (evt);
  });
}
function initialize_map () {
  var loc = {};
  var geocoder = new google.maps.Geocoder();
  var latitud = 19.432560;
  var longitud = -99.128952;
  if(google.loader.ClientLocation) {
      loc.lat = google.loader.ClientLocation.latitude;
      loc.lng = google.loader.ClientLocation.longitude;

      var latlng = new google.maps.LatLng(loc.lat, loc.lng);
      geocoder.geocode({'latLng': latlng}, function(results, status) {
          if(status == google.maps.GeocoderStatus.OK) {
              latitud = results[0].geometry.location.jb;
              longitud = results[0].geometry.location.kb;
              load_map (latitud, longitud);
          };
      });
  }else{
    load_map (latitud, longitud);
  }
}
function onInit_Jobs() {
  jQuery('section#listing > div.item').bind('click', function(item) {
    jQuery(this).next().toggle();
  });
  if (jQuery('#map-canvas').exists()) {
    jQuery('div.show').bind('click', function (item) {
      jQuery(this).next().toggle();
      google.maps.event.trigger(map, 'resize');
    });
    google.maps.visualRefresh = true;
    initialize_map ();
  }
}
jQuery (document)
  .on('page:change', function() {
    onInit_Jobs();
  })
  .ready(function() {
    onInit_Jobs();
  });
