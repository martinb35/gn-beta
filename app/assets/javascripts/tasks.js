// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var gn_tasks = {

  el:$('body.tasks'),

  initialize: function(element){
  	this.el = element;
    this.event();
  },
  event: function(){
    var self = this;
    this.el.find('.clickable').click(function(e){
      self.el.find('nav[name=options]').hide();
      
      if (self.el.find(this).hasClass('home')) {
        self.el.find('.submenu.home').show();
        self.el.find('.clickable:nth-child(5)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(7)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(9)').removeClass('on');
      }else if (self.el.find(this).hasClass('business')) {
        self.el.find('.submenu.business').show();
        self.el.find('.clickable:nth-child(7)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(9)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(3)').removeClass('on');
      }else if (self.el.find(this).hasClass('pro')) {
        self.el.find('.submenu.pro').show();
        self.el.find('.clickable:nth-child(5)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(3)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(9)').removeClass('on');
      }else if (self.el.find(this).hasClass('temp')) {
        self.el.find('.submenu.temp').show();
        self.el.find('.clickable:nth-child(7)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(5)').css('visibility', 'hidden');
        self.el.find('.clickable:nth-child(3)').removeClass('on');
      }
    });

    this.el.find('div[option=service]').mouseout(function(){      
      //self.el.find('nav[name=list]').hide();
      //self.el.find('.clickable').css('visibility', 'visible');
    });

    this.el.find('#categories').mouseover(function(e){
      var _hasClasss = false;
      var _isShow = false;
      if (self.el.find(e.target).hasClass('clickable')) {
        _hasClasss = true;
      }

      else if (self.el.find(e.target).parent().hasClass('clickable')) {
        _hasClasss = true;
      }

      else if (self.el.find(e.target).children().hasClass('clickable')) {
        _hasClasss = true;
      }

      else if (self.el.find(e.target).parent().hasClass('submenu')) {
        _hasClasss = true;
      }
      else if (self.el.find(e.target).parent().parent().hasClass('submenu')) {
        _hasClasss = true;
      }
      else if (self.el.find(e.target).children().hasClass('submenu')) {
        _hasClasss = true;
      }

      else if (self.el.find(e.target).hasClass('submenu')) {
        _hasClasss = true;
      }
      
      if (self.el.find(e.target).attr('id') == 'categories') {
        _hasClasss = false;
      };      
      if (!_hasClasss) {
        $.each(self.el.find('nav[name=options]'), function(index, element){
          if (self.el.find(element).css('display') == "block")
            _isShow = true;
        });
        if (_isShow) {
          self.el.find('nav[name=options]').hide();
          self.el.find('.clickable').css('visibility', 'visible').addClass('on');
        };
      };
    });
  }
}

var ready = function() {
  if (jQuery('body.tasks').length)
    gn_tasks.initialize(jQuery('body.tasks'));
};

$(document).ready(ready);
$(document).on('page:load', ready);