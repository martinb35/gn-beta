// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var gn_users = {
  el:'',
  initialize: function(element){
    this.el = element;
    this.event();
  },
  event: function(){
    var self = this;
    this.el.find('div[name=prefs]').unbind('click').bind('click', function(e){
      var prefer = self.el.find(this).attr("prefer");
      self.el.find('#user_prefer').val(prefer);
      self.el.find('div[name*=prefs]').parent().removeClass('profesion-active').removeClass('oficios-active');;
      self.el.find(this).parent().addClass(prefer+'-active');
    });
  }
}
$(function(){
  if($('body.users').length)
    gn_users.initialize($('body.users'));
});