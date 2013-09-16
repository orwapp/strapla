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


  $('.next_btn').on "click", (e) ->
    e.preventDefault()
    console.log 'clicked'
    current_form = $(this).closest('form')
    current_form.hide()
    next_form = $(current_form).next('form')
    $(next_form).show()
