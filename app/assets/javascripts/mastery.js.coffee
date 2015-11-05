$ ->
  $(document).on 'change', '#services', (e) ->
    $.ajax '/skills/index',
      type: 'GET'
      dataType: 'script'
      data: {
        service_id: $('#services option:selected').val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("AJAX success: #{textStatus}")
