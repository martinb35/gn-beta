// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_jobs = {

  initialize: function(element){
    this.el = element;
    this.removeHeader();
    this.event();
  },
  removeHeader: function(){
    //this.el.find('#brand').remove();
  },
  showDescriptionLimpiezaHogar: function(){
    this.el.find('#job_notes').show();
    this.el.find('#hideDescriptionLimpiezaHogar').show();
    this.el.find('#addNotePrivate').show();
  },
  hideDescriptionLimpiezaHogar: function(){
    this.el.find('#job_notes').hide();
    this.el.find('#hideDescriptionLimpiezaHogar').hide();
    this.el.find('#addNotePrivate').hide();
  },
  showGastosHandy: function(element){
    //Show 
    console.log(element);
  },
  event: function(){
    var self = this;

    this.el.find('section.gn-sub-form-money .nav-tabs li > a').bind('click', function(e){
      self.el.find('section.gn-sub-form-money .nav-tabs li[class*=active]').removeClass('active');
      self.el.find(this).parent('li').addClass('active');
      self.el.find('section.gn-sub-form-money .tab-content div[class*=active]').removeClass('active');
      self.el.find('section.gn-sub-form-money #'+ self.el.find(this).attr('data-toggle') ).addClass('active');
    });

    this.el.find('.icon.checkbox > input[type=checkbox]').bind('click', function(e){
      if(self.el.find(this).is(':checked'))
        self.el.find(this).parent().addClass('checked');
      else
        self.el.find(this).parent().removeClass('checked');
    });

    this.el.find('.icon.radio').bind('click', function(){
      var $child = $(this).find('input[type=radio][name="job[material]"]');
      self.el.find('div.icon.radio[class*=checked]').removeClass('checked');
      self.el.find(this).addClass('checked');
      $child.attr('checked', true); 
      self.showGastosHandy($child);
    });

    this.el.find('#job_category_id').bind('change', function(e){
      self.el.find('#gn-change-category').addClass('active');
    });

    //description-limpieza-hogar
    this.el.find('#showDescriptionLimpiezaHogar').click(function(){
      self.el.find(this).addClass('selected');
      self.showDescriptionLimpiezaHogar();
    });

    this.el.find('#hideDescriptionLimpiezaHogar').click(function(){
      self.el.find('#showDescriptionLimpiezaHogar').removeClass('selected');
      self.hideDescriptionLimpiezaHogar();
    });

    this.el.find('#hideNotePrivate').click(function(){
      self.el.find('#NotePrivate').hide();
    });

    this.el.find('#addNotePrivate').click(function(){
      self.el.find('#NotePrivate').show();
    });

    this.el.find('input[name="job[material]"]').click(function(){
      alert('job[material]');
    });
  }
}

$(function(){
  if ($('.jobs').length)
    gn_jobs.initialize($('.jobs'));
});