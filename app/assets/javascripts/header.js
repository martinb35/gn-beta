// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_header= {

  initialize: function(element){
  	this.el = element;
  	this.event();
  },
  event: function(){
  	var self = this;

    // $('body').click(function(e){
    // 	if(self.el.find('.submenu').css('display') == "block")
    // 		self.el.find('.submenu').hide();

    // 	console.log($(this)[0]);
    // });

    this.el.find('.btn-submenu').click(function(){
    	self.el.find('.submenu').toggle();
    }).click();

  }
}

$(function(){
	if ($('#brand').length)
		gn_header.initialize($('#brand'));
});