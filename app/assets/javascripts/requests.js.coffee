$ ->
  $("#expert_carousel").each ->
    $(this).carousel interval: false


  # Expand code preview
  $(document).on 'click', '.browse_code', (e) => 
    $('.code_details').slideToggle()
    $(this).find('i').toggleClass('icon-collapse')
    $(this).find('i').toggleClass('icon-collapse-top')


  # Expand price quote form
  $(document).on 'click', '.show_price_quote_form', (e) => 
    e.preventDefault()
    $('.price_quote_form').slideToggle()


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
    current_part.hide()
    next_part= $(current_part).next('.part')
    $(next_part).show()
    increment_status_bar()
