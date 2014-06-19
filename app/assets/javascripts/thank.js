// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_thank = {

  el:$('body.thank'),

  initialize: function(){
  	this.el = $('body.thank');
    this.event();
  },

  event: function(){
    var self = this;

    $(window).resize(function(){
      self.el.find('.container-body').height( $(this).height() - self.el.find('footer').height() - self.el.find('#brand').height() - 80 + 'px' );
    }).resize();
  }
}

var ready = function() {
  gn_thank.initialize();
};

$(document).ready(ready);
$(document).on('page:load', ready);