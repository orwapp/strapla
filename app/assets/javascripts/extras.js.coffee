window.onpopstate = ->
  url = document.location.toString()
  $(".nav-tabs a[href=#" + url.split("#")[1] + "]").tab "show"  if url.match("#")
# Global toggle button
$(document).on 'click', '[data-toggle-class]', (e) ->
  e.preventDefault()
  toggle_class = $(this).data('toggle-class')
  $(".#{toggle_class}").slideToggle()
