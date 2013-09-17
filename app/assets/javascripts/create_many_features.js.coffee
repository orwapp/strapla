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


post_features = (values) ->
  console.log "Posting: #{values}"
  extra_parms = '{"request_id": 123}'
  
  $.ajax
    url: "/features"
    type: "post"
    data: $.extend(values, extra_parms)
    success: ->
      alert "success"
      #$("body").html "Submitted successfully"
  
    error: ->
      alert "failure"
      #$("body").html "There is error while submit"


$ ->
  $('.save_feature').on "click", (e) ->
    e.preventDefault()
    feature_list = $('ol.features')
    title        = $(this).closest('form').find('#feature_title')
    text         = $(this).closest('form').find('#feature_text')
    form_content = $('form.new_feature').serialize()
    element      = "<li class='feature' data-form-content='#{form_content}'> #{title.val()} – #{text.val()} </li>"

    feature_list.prepend(element)
    feature_list.find('li').first().fadeIn(500)
    title.val('')
    text.val('')

  $('.continue_from_the_create_many_page').on "click", (e) ->
    values = $('li.feature').data('form-content')
    post_features(values)

    
  
