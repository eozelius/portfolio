/* INDEX ACTION */
$(function(){
  $.ajax({
    url: '/get_driftmap',
    method: 'POST',
    data: { driftmap_id: $('#driftmap_id').val() },
    dataType: 'JSON',
    complete: function(response) {
      var r = response.responseJSON;
      window.r = r

      // init Timeline
      // DriftMapTimeline.init(r)
      
      DriftMapLeaflet.init(r)

      // init Accordian
      // DriftMapAccordian.init(r)

      // init Content
      // DriftMapContent.init(r)
    }
  })
})