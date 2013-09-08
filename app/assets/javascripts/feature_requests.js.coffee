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
