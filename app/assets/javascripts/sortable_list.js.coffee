calculateOrderOfFeatures = () ->
  sorted = []
  url = $("tbody.sortable").data('post-to-url')
  request_id = $("tbody.sortable").data('request-id')

  $("tbody.sortable tr").each ->
    $this = $(this)
    sorted.push $this.attr("data-id")

    $.ajax(
      url: url
      type: "post"
      data: {id: request_id, priority_order: sorted}
    )


$ ->

  # Sortable rows
  $(".sortable").sortable 
    stop: (event, ui) ->
      calculateOrderOfFeatures()
