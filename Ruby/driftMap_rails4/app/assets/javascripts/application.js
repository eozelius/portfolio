// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require leaflet-src.js
//= require moment.js
//= require bootstrap.min.js
//= require bootstrap-datetimepicker.min.js
//= require driftMapLeaflet.js

/* Application-wide helper functions */

// add photos 

var photo_index = 0;

$(document).on('click', '.add-photo', function(){
  $(this).data('photo-index', ++photo_index)
  var index = $(this).data('photo-index')
  var new_img = '<input class="blip-image" name="photo['+ index +']" accept="image/jpeg, image/gif, image/png, image/jpg" type="file" data-image="'+ index +'" style="margin: 6% 6% 5% 3%; width:100%;">';
  $('.add-photo').last().after(new_img);
});