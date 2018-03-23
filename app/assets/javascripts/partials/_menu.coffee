$(document)
  .on 'turbolinks:load', ->
    $('#touch-menu').click (event) ->
      event.preventDefault()

      $(@).closest('.header__nav').toggleClass('header__nav--active')

      if Helpers.isMobileWidth()
        $('html').toggleClass('js-menu')

  .on 'turbolinks:before-cache', ->
    $('.header__nav').removeClass('header__nav--active')
    $('html').removeClass('js-menu')
