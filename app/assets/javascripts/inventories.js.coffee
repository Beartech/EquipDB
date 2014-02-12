parts = []
partList = $("#part_list")
inventory = {}
$(document).ready ->
  $("#part").keydown (e) ->
    if e.keyCode == 13
      e.preventDefault()
    if e.keyCode is 40
      sku = $("#part").val()
      parts.push sku
      part = [sku]
      $.ajax({
        url: '/adjust_inventory'
        method: 'POST'
        data: {
          inventory: {
            part: part
            operator: '+'
          }
        }
      })



