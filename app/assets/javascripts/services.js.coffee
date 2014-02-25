# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  parts_used = []
  $('#serv_parts_list').on('click', 'li', ->
    $(this).remove())

  $("#parts_used").keydown (e) ->
    if e.keyCode == 13
      e.preventDefault()
    if e.keyCode is 40
      sku = $("#parts_used").val()
      if sku != ''
        $.ajax({
          url: '/part_lookup'
          method: 'POST'
          data: {
            part: {
              sku: sku
            }
          }
        })
        $("#parts_used").val('')
