
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
    this.$el.find( "#job_when_date" ).datepicker({
      dateFormat: "dd-M-yy",
      minDate: new Date(),
      onSelect: function(){
        $('#gn-job-date').text( $( "#job_when_date" ).val() );
         if($( "#job_when_date" )!=="")
          self.active_section('.gn-sub-form-when'); 
        else
          self.inactive_section('.gn-sub-form-when');
      }
    });
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

    this.$el.find('#job_when_date').bind('change', function(e){
      if($(this).val()!=="")
        self.active_section('.gn-sub-form-when'); 
      else
        self.inactive_section('.gn-sub-form-when');       
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
    //onInit_Jobs();
    Jobs.init();
  })
  .ready(function() {
   // onInit_Jobs();
    Jobs.init();
});
