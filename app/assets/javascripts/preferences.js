// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_preferences = {

  el:$('.preferences'),

  initialize: function(){
    this.event();
  },

  event: function(){
    var self = this;

    this.el.find('.helper').bind('click', function(){
      self.el.find('.modal').show().find('.modal-body').children('section').hide().parent().find('#' + $(this).attr('name')).show();
    });

    this.el.find('.close').bind('click', function(){
      self.el.find('.modal').hide();
    });

    this.el.find('input[name=parent-ckeck]').bind('click', function(){
      self.el.find(this).parent().next().find('input[type=checkbox]').prop('checked', self.el.find(this).is(':checked'));
    });
  }
}

$(function(){
  gn_preferences.initialize();
});