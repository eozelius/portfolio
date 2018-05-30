$(function(){
  // EDIT ////
  if($('#driftmap_edit').length){
    DriftMapLeaflet.defaultInit();

    // submit form
    $('span.normal.save').on('click', function(){
      var lat = window.m.getCenter().lat;
      var lng = window.m.getCenter().lng;
      var zoom = window.m.getZoom();
      $('#driftmap_init_x').val(lat);
      $('#driftmap_init_y').val(lng);
      $('#driftmap_init_zoom').val(zoom);
      $('form').submit();
    });
  }
})