jQuery (document).ready(function() {
  jQuery('section#listing > div.item').bind('click', function(item) {
    jQuery(this).next().toggle();
    console.log ('Clicked! ' + item);
  });
});
