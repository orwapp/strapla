updateServer = (feature_id, nr) ->
  console.log "Doing an ajax request"


$ ->

  # Sortable rows
  $(".sortable").sortable 
    stop: (event, ui) ->
      console.log ui.item[0]
      console.log $(ui.item[0]).attr('class')
  
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
