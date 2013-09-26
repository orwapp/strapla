$ ->

  increment_status_bar = -> 
    completed_bar = $('.bar.completed') 
    remaining_bar = $('.bar.remaining') 
    current_completed_percent = completed_bar.data('percent')
    current_remaining_percent = remaining_bar.data('percent')
    new_completed_percent = eval(current_completed_percent + 12.5)
    new_remaining_percent = eval(current_remaining_percent - 12.5)

    $(completed_bar).attr('style', "width: #{new_completed_percent}%;")
    $(completed_bar).data('percent', new_completed_percent)
    $(remaining_bar).attr('style', "width: #{new_remaining_percent}%;")
    $(remaining_bar).data('percent', new_remaining_percent)
  

  # Guided the user through the wizard
  $(document).on 'click', '.next_btn', (e) -> 
    e.preventDefault()
    current_part = $(this).closest('.part')
    next_part    = $(current_part).next('.part')
    current_part.hide()
    $(next_part).show()
    increment_status_bar()


  # Populate the example box
  $(document).on 'focus', '#wizard .help_text', (e) ->
    e.stopPropagation()
    hint_text = $(this).data('hint')
    title = $(this).closest('div').siblings('label').text()
    $('#info-box .content').html(hint_text)
    $('#info-box strong').html(title)
    $('#info-box').show()

    example_text = $(this).data('example')
    $('#example-box .content').html(example_text)
    $('#example-box').show()


  $('.next_btn').click (e) ->
    $('#info-box').html("In this box you'll see examples on what data to provide.")
    $('#example-box').html("Examples describing a web caluclator")



  $('[data-behaviour=datepicker]').datepicker()
  
   
