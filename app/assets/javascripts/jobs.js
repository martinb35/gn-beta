jQuery (document).on('page:change', function() {
  jQuery('section#listing > div.item').bind('click', function(item) {
    jQuery(this).next().toggle();
  });
});
