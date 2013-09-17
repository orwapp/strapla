$ ->


  post_features = (values, id) ->
    target = {}
    #request_id = JSON.parse("{'request_id': eval(id) }")
    request_id = JSON.parse('{"request_id": ' + id + '}');
    merged_data = $.extend(target, values, request_id)
    console.log "Posting: #{merged_data}"
    
    $.ajax
      url: "/features"
      type: "post"
      data: merged_data
      success: ->
        alert "success"
        #$("body").html "Submitted successfully"
    
      error: ->
        alert "failure"
        #$("body").html "There is error while submit"
  



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
    element      = "<li class='feature'> #{title.val()} – #{text.val()} </li>"

    feature_list.prepend(element)
    feature_list.find('li').first().data('form-content', form_content)
    feature_list.find('li').first().fadeIn(500)
    title.val('')
    text.val('')

  $('.continue_from_the_create_many_page').on "click", (e) ->
    # Legg inn en each loop her som går over all elementene
    form_content = $('li.feature').data('form-content')
    id = $(this).data('id')
    console.log "id is #{id}"
    post_features(form_content, id)
