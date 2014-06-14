// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_jobs = {

  initialize: function(element){
    this.el = element;
    this.event();
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
    });

    this.el.find('#job_category_id').bind('change', function(e){
      self.el.find('#gn-change-category').addClass('active');
    });

  }
}

$(function(){
  if ($('.jobs').length)
    gn_jobs.initialize($('.jobs'));
});