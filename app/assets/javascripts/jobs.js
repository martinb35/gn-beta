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
    //jQuery(this).next().toggle();
    if (jQuery('#map-canvas').exists() || jQuery('#single-map-canvas').exists()) {
      google.maps.event.trigger(map, 'resize');
    }
  });
}
var Jobs = {
  options:{
    markers:[]
  },
  $el:$('body'),

  init: function(){
    var self = this;
    this.$el = $('.container-form');
    this.event();
    this.create_map('gn-job-location-map');
    this.create_geocoding('job_address');
    this.$el.find('.toggle-btn').first().click();
    this.$el.find('.gn-sub-form-description input[type=radio]').first().click();
    this.$el.find( ".job_when_date_otro" ).datepicker({
      dateFormat: "dd-M-yy",
      minDate: new Date(),
      onSelect: function(){
        $('.gn-job-date').text( $( ".job_when_date_otro" ).val() );
         if($( "#job_when_date" )!=="")
          self.active_section('.gn-sub-form-when'); 
        else
          self.inactive_section('.gn-sub-form-when');
      }
    });
    this.$el.find('#job_repeat_task_date_input').multiDatesPicker({
      dateFormat: "dd-M-yy"
    });
    $('#ui-datepicker-div').hide();
  },
  create_map: function(map_id){
    var latlong = this.$el.find('#job_latlong').val();
    var coords = this.string_to_coords (latlong);
    if (latlong != '') {
        var mapOptions = {
          zoom: 10,
          center: new google.maps.LatLng(coords[0], coords[1]),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
      this.options.map = new google.maps.Map(document.getElementById(map_id), mapOptions);
    }
  },
  create_geocoding: function(input_id){
    var self = this;
    var input = document.getElementById(input_id);
    var map = this.options.map;
    var searchBox = new google.maps.places.SearchBox(input);
    google.maps.event.addListener(searchBox, 'places_changed', function() {
      var places = searchBox.getPlaces();
      for (var i = 0, marker; marker = self.options.markers[i]; i++) { marker.setMap(null);}
      self.options.markers = [];
      var bounds = new google.maps.LatLngBounds();
      for (var i = 0, place; place = places[i]; i++) {
        self.create_marker( place );
        bounds.extend(place.geometry.location);
      }
      map.fitBounds(bounds)
    });
  },
  create_marker: function(place){
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

  },
  event: function(){
    var self = this;
    //$('.container').children('section').remove();
    this.$el.find('#gn-add-reference').bind('click', function(){
      self.$el.find('#job_references').toggle('slow');
    });

    this.$el.find('.icon.radio').bind('click', function(){
      var $child = $(this).find('input[type=radio][name="job[material]"]');
      self.$el.find('div.icon.radio[class*=checked]').removeClass('checked');
      $(this).addClass('checked');
      $child.attr('checked', true); 
    });

    $('.icon.checkbox > input[type=checkbox]').bind('click', function(e){
      if($(this).is(':checked'))
        $(this).parent().addClass('checked');
      else
        $(this).parent().removeClass('checked');
    });

    this.$el.find('div.toggle-btn').bind('click', function(e){
      self.$el.find('ul#job_level div[class*=active]').removeClass('active');
      self.$el.find(this).addClass('active');
    });

    this.$el.find('section.gn-sub-form-money .nav-tabs li > a').bind('click', function(e){
      self.$el.find('section.gn-sub-form-money .nav-tabs li[class*=active]').removeClass('active');
      self.$el.find(this).parent('li').addClass('active');
      self.$el.find('section.gn-sub-form-money .tab-content div[class*=active]').removeClass('active');
      self.$el.find('section.gn-sub-form-money #'+ self.$el.find(this).attr('data-toggle') ).addClass('active');

    });

    this.$el.find('section.gn-sub-form-description .label-highlight').bind('click', function(e){
      self.$el.find('#job_notes').toggle('slow');
    });

    this.$el.find('#job_category_id').bind('change', function(e){
      self.$el.find('#gn-change-category').addClass('active');     
    });

    this.$el.find('#gn-change-category').bind('click', function(e){      
      if($(this).hasClass('active')){
        $('#container-form form').hide();      
        switch( parseInt(self.$el.find( "#job_category_id option:selected" ).val()) ){
          case 1:
            self.$el.find('#gn-new-job-form-home-task').show();
            self.$el.find('.icon.category.cook-task').removeClass('cook-task').addClass('home-task');
            break;
          case 2:            
            break;
          case 3:
            self.$el.find('#gn-new-job-form-cook-task').show(); 
            self.$el.find('.icon.category.home-task').removeClass('home-task').addClass('cook-task');
            break;
          default:
            break;
        }        
      }
      self.$el.find(this).removeClass('active');  
    });

    this.$el.find('#job_offer').bind('change', function(e){
      $('#gn-job-offer').text( $(this).val() );
    });

    this.$el.find('.gn-job-time select').bind('change', function(){
      var gn_time = self.$el.find( "#job_when_hr option:selected" ).text() +':'+ self.$el.find( "#job_when_min option:selected" ).text()+' '+ self.$el.find( "#job_when_meridian option:selected" ).text();
      $('#gn-job-time').text( gn_time );      
    });

    this.$el.find('.gn-sub-form-description select').bind('change', function(){
      var is_empty = false;
      self.$el.find('.gn-sub-form-description select').each(function(index, element){
        if($(element).val()==""){
          is_empty = true;
          return false;
        }
          
      });
      if(!is_empty)
        self.active_section('.gn-sub-form-description'); 
      else
        self.inactive_section('.gn-sub-form-description'); 
    });

    this.$el.find('select.job_when_date').bind('change', function(e){
      var date_value = self.$el.find('select.job_when_date option:selected').val();
      if(date_value!="otro")
        self.active_section('.gn-sub-form-when');
      else{
        self.$el.find('div[name=job_when_date]').hide();
        self.$el.find('div[name=job_when_date_otro]').show();
        self.$el.find('section.gn-sub-form-when .close').show();
      }     
    });

    this.$el.find('select.job_repeat_task_date').bind('change', function(e){
      var option_value = self.$el.find( "select.job_repeat_task_date option:selected" ).val();
      if(option_value=='cada'){
        self.$el.find(this).parent().parent().hide();
        self.$el.find('.job_repeat_task_date_input').show();
        self.$el.find('.job_repeat_task_date_input .close').show();
      }
    });

    this.$el.find('section.gn-sub-form-when .close[name=job_when_date]').bind('click', function(e){
      self.$el.find(this).hide();
      self.$el.find('div[name=job_when_date_otro]').hide();
      self.$el.find('div[name=job_when_date]').show();
      self.$el.find('.job_when_date').val('hoy');
    });

    this.$el.find('section.gn-sub-form-when .close[name=close_job_when_date_cada]').bind('click', function(e){
      self.$el.find(this).hide();
      self.$el.find('div.job_repeat_task_date_input').hide();
      self.$el.find('select.job_repeat_task_date').parent().parent().show();
      self.$el.find('select.job_repeat_task_date').val('all');
    });

    this.$el.find('.gn-sub-form-where input[type=text]').bind('change', function(){
      if($(this).val()!=="")
        self.active_section('.gn-sub-form-where'); 
      else
        self.inactive_section('.gn-sub-form-where'); 
    });

    this.$el.find('.gn-sub-form-money input[type=text]').bind('change', function(){
      if($(this).val()!=="")
        self.active_section('.gn-sub-form-money'); 
      else
        self.inactive_section('.gn-sub-form-money'); 
    });

    this.$el.find('.job_repeat_task').bind('change', function(e){
      if(self.$el.find(this).is(':checked')){
        self.$el.find('div.field[name=job_repeat_task_date]').show();
      }
      else{
        self.$el.find('div.field[name=job_repeat_task_date]').hide();
      }
    });
  },
  active_section: function(section_id){
    this.$el.find(section_id).addClass('active');
    this.$el.find(section_id+' > .icon').addClass('active');
  },
  inactive_section: function(section_id){
    this.$el.find(section_id).removeClass('active');
    this.$el.find(section_id+' > .icon').removeClass('active');
  },
  string_to_coords: function (latlong) {
  latlong = latlong.replace ('(', '');
  latlong = latlong.replace (')', '');
  return coords = latlong.split (',');
  }
}

jQuery (document)
  .on('page:change', function() {
    onInit_Jobs();
    Jobs.init();
  })
  .ready(function() {
    onInit_Jobs();
    Jobs.init();
});
