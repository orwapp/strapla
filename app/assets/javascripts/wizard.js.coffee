$ ->

  # Initialize the datepicker
  $('[data-behaviour=datepicker]').datepicker()

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
  


  # Populate the example box
  $(document).on 'focus', '#wizard .help_text', (e) ->
    e.stopPropagation()
    # The description box
    hint_text = $(this).data('hint')
    title     = $(this).closest('div').siblings('label').text()
    $('#info-box .content').html(hint_text)
    $('#info-box strong').html(title)
    $('#info-box').show()
    if hint_text and title
      $('#info-box').show() 
    else 
      $('#info-box').hide() 

    # The example box
    example_text = $(this).data('example')
    $('#example-box .content').html(example_text)
    if example_text
      $('#example-box').show() 
    else 
      $('#example-box').hide() 


  # The select_what_kind_of_software page
  $('body#build_show input[type=radio]').hide()

  $(document).on 'click', '#wizard form span', (e) ->
    $(this).first().find('input[type="radio"]').prop("checked", true)
