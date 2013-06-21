function onInit_Jobs() {
  jQuery('section#listing > div.item').bind('click', function(item) {
    jQuery(this).next().toggle();
  });
}
jQuery (document)
  .on('page:change', function() {
    onInit_Jobs();
  })
  .ready(function() {
    onInit_Jobs();
  });
