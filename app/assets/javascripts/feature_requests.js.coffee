#$ ->
#  $('.continue_from_the_create_many_page').on "click", (e) ->
#    e.preventDefault()
#    $('form.new_feature').each (f) ->
#      setTimeout (->
#        console.log "Hello #{f}"
#        $("form.feature#{f}").find('input[type="submit"]').click()
#      ), 30
#
#
#
#      #window.location.href= $(this).data('navigate-to')


$ ->
  $('.save_feature').on "click", (e) ->
    e.preventDefault()
    feature_list = $('ol.features')
    title = $(this).closest('form').find('#feature_title')
    text  = $(this).closest('form').find('#feature_text')
    element = "<li> #{title.val()} – #{text.val()} </li>"
    feature_list.prepend(element)
    feature_list.find('li').first().fadeIn(500)
    title.val('')
    text.val('')

    
  
