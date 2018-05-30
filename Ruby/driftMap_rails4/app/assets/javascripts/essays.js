$(function(){
  // New
  if($("#essays_new").length){
    // Leaflet
    var j = [{
      journey: {
        id: 0,
        description: '',
        title: '',
        driftmap_id: 0,
        coverphoto: { url: null }
      },

      waypoints: [{
        id: 0,
        title: '',
        body: '',
        x: $("#essay_x").val(),
        y: $("#essay_y").val(),
        driftmap_id: 0,
        date: { 
          year: 2017,
          month: 01,
          day: 01
        },
        images: []
      }]
    }];

    var opt = {
      init_x: $("#essay_x").val(),
      init_y: $("#essay_y").val(),
      init_zoom: 6
    };

    var myDefault = false;

    DriftMapLeaflet.init(j, opt, myDefault);

    // make the marker draggable
    var marker = window.leafletIndexer[0].leaflet.marker;
    marker.dragging.enable();
    marker.on('dragend', function(e){
      setLatLng(e.target.getLatLng().lat, e.target.getLatLng().lng)
    });
    
    function setLatLng(lat, lng) {
      $('#friend_x').val(lat);
      $('#friend_y').val(lng);      
    }
  }
});