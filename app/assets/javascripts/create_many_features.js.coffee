$ ->
  post_features = (values, id) ->
    target = {}
    request_id = JSON.parse('{"request_id": ' + id + '}');
    merged_data = $.extend(target, values, request_id)
    
    $.ajax
      url: "/features"
      type: "post"
      data: merged_data
      success: ->
        alert "success"
    
      error: ->
        alert "failure"


  $.fn.serializeObject = ->
    o = {}
    a = @serializeArray()
    $.each a, ->
      if o[@name]
        o[@name] = [o[@name]]  unless o[@name].push
        o[@name].push @value or ""
      else
        o[@name] = @value or ""
    o


  
  $('.save_feature').on "click", (e) ->
    e.preventDefault()
    feature_list = $('ol.features')
    title        = $(this).closest('form').find('#feature_title')
    text         = $(this).closest('form').find('#feature_text')
    form_content = $('form.new_feature').serializeObject()
    element      = "<li class='feature' data-form-content='#{form_content}'> #{title.val()} – #{text.val()} </li>"

    feature_list.prepend(element)
    feature_list.find('li').first().data('form-content', form_content)
    title.val('')
    text.val('')
    $('.features_added').fadeIn()



  $('.continue_from_the_create_many_page').on "click", (e) ->
    e.preventDefault()
    id = $(this).data('request-id')
    #console.log 'click'
    size = $('ol.features li.feature').size()
    i = 0
    $('ol.features li.feature').each (f) ->
      i +=1
      #console.log 'each li'
      form_content = $(this).data('form-content')
      setTimeout (->
        #console.log 'posting li'
        post_features(form_content, id)
      ), 30
      #console.log  "DONE"  if i == size
      #console.log 'after each'
    #window.location.href= $(this).data('navigate-to')
    
