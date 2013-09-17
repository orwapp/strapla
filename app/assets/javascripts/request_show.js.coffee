$ ->

  # Expand code preview
  $(document).on 'click', '.browse_code', (e) => 
    $('.code_details').slideToggle()
    $(this).find('i').toggleClass('icon-collapse')
    $(this).find('i').toggleClass('icon-collapse-top')


  # Expand price quote form
  $(document).on 'click', '.show_price_quote_form', (e) => 
    e.preventDefault()
    $('.price_quote_form').slideToggle()
