$ ->
  $('.continue_from_the_create_many_page').on "click", (e) ->
    e.preventDefault()

    $('form.new_feature').each ->
      $(this).submit()

    console.log  $(this).data('navigate-to')
    window.location.href= $(this).data('navigate-to')

