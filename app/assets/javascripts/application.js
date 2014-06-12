// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

jQuery.fn.exists = function(){return this.length>0;};

// jQuery(document).ready(function() {
//   if (jQuery('#categories').length > 0) {
//     jQuery('#categories > .clickable').unbind('mouseover').bind('mouseover', function(evt) {
//       jQuery('#categories > .clickable').removeClass('on');
//       jQuery('.submenu').hide();
//       jQuery(this).addClass('on');
//       if (jQuery(this).hasClass('home')) {
//         jQuery('.submenu.home').show();
//         jQuery('.clickable:nth-child(3)').css('visibility', 'hidden');
//         jQuery('.clickable:nth-child(5)').css('visibility', 'hidden');
//       }else if (jQuery(this).hasClass('business')) {
//         jQuery('.submenu.business').show();
//         jQuery('.clickable:nth-child(5)').css('visibility', 'hidden');
//         jQuery('.clickable:nth-child(7)').css('visibility', 'hidden');
//       }else if (jQuery(this).hasClass('pro')) {
//         jQuery('.submenu.pro').show();
//         jQuery('.clickable:nth-child(1)').css('visibility', 'hidden');
//         jQuery('.clickable:nth-child(3)').css('visibility', 'hidden');
//       }else if (jQuery(this).hasClass('temp')) {
//         jQuery('.submenu.temp').show();
//         jQuery('.clickable:nth-child(3)').css('visibility', 'hidden');
//         jQuery('.clickable:nth-child(5)').css('visibility', 'hidden');
//       }
//     });
//     jQuery('#categories > .clickable').unbind('mouseout').bind('mouseout', function(evt) {
//       jQuery('#categories > .clickable').removeClass('on');
//       jQuery('.submenu').hide();
//       jQuery('.clickable').css('visibility', 'visible');
//     });
//   }
// });
