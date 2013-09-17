$ ->

  increment_status_bar = -> 
    bar = $('.progress .bar') 
    current_percent = bar.data('percent')
    new_percent = eval(current_percent + 10)
    $(bar).attr('style', "width: #{new_percent}%;")
    $(bar).data('percent', new_percent)
  

  # Guided the user through the wizard
  $(document).on 'click', '.next_btn', (e) -> 
    e.preventDefault()
    current_part = $(this).closest('.part')
    next_part    = $(current_part).next('.part')
    current_part.hide()
    $(next_part).show()
    increment_status_bar()
