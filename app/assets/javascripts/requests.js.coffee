$ ->
  $("#expert_carousel").each ->
    $(this).carousel interval: false


  $(document).on 'click', '.browse_code', (e) => 
    $('.code_details').slideToggle()
