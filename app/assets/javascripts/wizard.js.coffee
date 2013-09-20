$ ->

  increment_status_bar = -> 
    bar = $('.progress .bar') 
    current_percent = bar.data('percent')
    new_percent = eval(current_percent + 10)
    $(bar).attr('style', "width: #{new_percent}%;")
    $(bar).data('percent', new_percent)
  

  # Guided the user through the wizard
  $(document).on 'click', '.next_btn', (e) -> 
    console.log 'clieck'
    e.preventDefault()
    current_part = $(this).closest('.part')
    next_part    = $(current_part).next('.part')
    current_part.hide()
    $(next_part).show()
    increment_status_bar()
    #disable_next_btn()


  ## Disable Next button untill text is entered
#  disable_next_btn = ->
#    $(document).on 'keyup', 'input.required', (e) -> 
#      $(".next_btn.required").attr "disabled", true  if $("input.required").val() is ""
#      
#      $("input.required").keyup ->
#        unless $("input.required").val() is ""
#          $(".next_btn").not(':hidden').attr "disabled", false
#        else
#          $(".next_btn").not(':hidden').attr "disabled", true
#
  #disable_next_btn()
   

  #$('.required').focus (e) ->
  $(document).on 'focus', '#wizard .help_text', (e) ->
    e.stopPropagation()
    text = $(this).data('hint')
    $('#info-box').html(text)

  $('.next_btn').click (e) ->
    $('#info-box').html("In this box you'll see examples on what data to provide.")
  $('[data-behaviour=datepicker]').datepicker()
