 window.onpopstate = ->
   url = document.location.toString()
   $(".nav-tabs a[href=#" + url.split("#")[1] + "]").tab "show"  if url.match("#")
