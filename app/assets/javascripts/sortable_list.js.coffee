updateServer = (feature_id, nr) ->
  console.log "Doing an ajax request"

calculateOrderOfFeatures = () ->
  sorted = []
  url = $("tbody.sortable").data('post-to-url')
  request_id = $("tbody.sortable").data('request-id')

  $("tbody.sortable tr").each ->
    $this = $(this)
    sorted.push $this.attr("data-id")
    console.log "111 The order is #{sorted}"

    $.ajax(
      url: url
      type: "post"
      data: {id: request_id, priority_order: sorted}
    )
#    .done (subscription) ->
#      $(".price_pr_month").val subscription.price_pr_month
#      $(".price_total").val subscription.price_pr_month * subscription.length_in_months
#      subscription = null
#


$ ->

  # Sortable rows
  $(".sortable").sortable 
    stop: (event, ui) ->
      calculateOrderOfFeatures()
      #notifyServer(order)
  
  #  containerSelector: "table"
  #  itemPath: "> tbody"
  #  itemSelector: "tr"
  #  placeholder: "<tr class=\"placeholder\"/>"
  #  #onDrop: (item, ui, _super) ->
  #  #  console.log item
  #  #  updateServer(1,2)
    #  _super item

  
  
  ## Sortable column heads
  #oldIndex = undefined
  #$(".sorted_head tr").sortable
  #  containerSelector: "tr"
  #  itemSelector: "th"
  #  placeholder: "<th class=\"placeholder\"/>"
  #  vertical: false
  #  onDragStart: (item, group, _super) ->
  #    oldIndex = item.index()
  #    item.appendTo item.parent()
  #    _super item
  #
  #  onDrop: (item, container, _super) ->
  #    alert('klj')
  #    field = undefined
  #    newIndex = item.index()
  #    unless newIndex is oldIndex
  #      item.closest("table").find("tbody tr").each (i, row) ->
  #        row = $(row)
  #        field = row.children().eq(oldIndex)
  #        if newIndex
  #          field.before row.children()[newIndex]
  #        else
  #          row.prepend field
  #
  #    _super item

#  $('tbody.sortable tr').each(function(){
#    console.log $(this).attr('class')
#  })
#  
#  $("tbody.sortable tr").each(function() {
#    $this = $(this)
#    console.log $this.attr('data-id')
#    #var value = $this.find("span.value").html();
#    #var quantity = $this.find("input.quantity").val();
#  });
#  
#  
#  var sorted = []
#  $("tbody.sortable tr").each(function() {
#    $this = $(this);
#    sorted.push( $this.attr('data-id') );
#    console.log($this.attr('data-id'));
#  });
