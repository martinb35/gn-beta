var gn_sidebar_form = {
  options:{
    mapId: 'gn-job-location-map',
    inputId:'.direccion',
    latitud: 19.432560,
    longitud: -99.128952,
    markers: [],
    mapOptions:{
      zoom: 10,
      center: new google.maps.LatLng('19.432560', '-99.128952'),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
  },
  initialize: function(element){
    this.el = element;
    this.event();
    this.createMap();
    this.createGeocoding();
  },
  event: function(){
    var self = this;
  }, 
  createMap: function(){
    this.options.map = new google.maps.Map(document.getElementById(this.options.mapId), this.options.mapOptions);
    console.log('createMsp');
  },
  createGeocoding: function(){
    var self = this;
    var input = $(this.options.inputId).get(0);
    var map = this.options.map;
    var searchBox = new google.maps.places.SearchBox(input);
    google.maps.event.addListener(searchBox, 'places_changed', function() {
      var places = searchBox.getPlaces();
      for (var i = 0, marker; marker = self.options.markers[i]; i++) { marker.setMap(null);}
      self.options.markers = [];
      var bounds = new google.maps.LatLngBounds();
      for (var i = 0, place; place = places[i]; i++) {
        self.createMarker( place );
        bounds.extend(place.geometry.location);
      }
      map.fitBounds(bounds)
    });
    console.log('createGeocoding');
  },
  createMarker: function(place){
    var image = {
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(25, 25)
    };

    // Create a marker for each place.
    var marker = new google.maps.Marker({
      map: this.options.map,
      icon: image,
      title: place.name,
      position: place.geometry.location
    });
    this.options.markers.push(marker); 
  }
}

$(function(){
  if ($('.gn-sidebar').length)
    gn_sidebar_form.initialize($('.gn-sidebar'));
});