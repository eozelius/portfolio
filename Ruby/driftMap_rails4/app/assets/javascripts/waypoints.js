$(function(){
  /* NEW ACTION */
  if($('#waypoints_new').length){
    DriftMapLeaflet.defaultInit()

    // init date-picker-calender
    $('#datetimepicker1').datetimepicker();

    // var photo_index = 0;
    var locationSet = false;

    // set location of blip
    window.leafletIndexer[0].leaflet.map.on('click', function(e){
      window.leafletIndexer[0].leaflet.map.off('click');
      locationSet = true;
      setLatLng(e.latlng.lat, e.latlng.lng);

      var marker = L.marker([e.latlng.lat, e.latlng.lng]).addTo(window.leafletIndexer[0].leaflet.map)
      marker.dragging.enable();
      marker.on('dragend', function(e){
        setLatLng(e.target.getLatLng().lat, e.target.getLatLng().lng)
      });
    });

    // submit form
    $('.commit').on('click', function(){
      if(locationSet == false) {
        alert('A location must be set, click anywhere on the map to set your blip.');
        return false;
      } else {
        var date = $('#datepicker-input').val();
        var mm =   date.slice(0, 2)
        var dd =   date.slice(3, 5)
        var yyyy = date.slice(6, 10);
        $('#waypoint_date').val(yyyy + mm + dd);
        $('form').submit();
      }
    });

    function setLatLng(lat, lng) {
      $('#waypoint_x').val(lat);
      $('#waypoint_y').val(lng);      
    }
  }


/* CREATE ACTION */


/* EDIT ACTION */
  // init leaflet
  if($('#waypoints_edit').length){
    var d = $('#my_waypoint_date').val();
    var yy = d.slice(0, 4);
    var mm = d.slice(5, 7) - 1;
    var dd = d.slice(8, 10);

    var wpDate = new Date(yy, mm, dd);

    var data = [{
      journey: {
        id: 0,
        description: '',
        title: '',
        driftmap_id: 0,
        coverphoto: false,
        timeline: false
      },

      waypoints: [{
        id: $('.waypoint-content').data('waypoint'),
        title: $('#waypoint_title').val(),
        body: $('#waypoint_body').val(),
        x: $('#waypoint_x').val(),
        y: $('#waypoint_y').val(),
        driftmap_id: 0,
        journey_id: 0,
        date: {
          year: wpDate.getFullYear(),
          month: wpDate.getMonth(),
          day: wpDate.getDay()
        },
        images: []
      }]
    }]

    var myOpts = {
      init_x: $('#waypoint_x').val(),
      init_y: $('#waypoint_y').val(),
      init_zoom: 6
    }

    // DriftMapLeaflet.init(data, myOpts)
    /* End Leaflet */

    // Datepicker
    $('#datetimepicker1').datetimepicker({ defaultDate: wpDate });
    
    // enable dragging for the marker
    /*var marker = window.leafletIndexer[0].leaflet.marker; // this works because the index will only have one entry.  This is not always the case.
    marker.dragging.enable();
    marker.on('dragend', function(e){
      setLatLng(e.target.getLatLng().lat, e.target.getLatLng().lng);
    });*/

    // save edit
    $('.commit').on('click', function(){
      var date = $('#datepicker-input').val();
      var mm =   date.slice(0, 2)
      var dd =   date.slice(3, 5)
      var yyyy = date.slice(6, 10);

      $('#waypoint_date').val(yyyy + mm + dd);
      $('form').submit();
    });

    function setLatLng(lat, lng) {
      $('#waypoint_x').val(lat);
      $('#waypoint_y').val(lng);      
    }
  }
});

