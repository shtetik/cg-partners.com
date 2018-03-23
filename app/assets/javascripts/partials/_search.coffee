closeSearch = ->
  $('html').removeClass('js-search js-search--result')

  setTimeout ->
    $('#search-query').val('')
  , 600

  $('#search-query').blur()
  $('#search-result').html(null)


$(document)
  .on 'click', '#search', (event) ->
    event.preventDefault()

    $('html, body').animate { scrollTop: 0 }, 300, ->
      $('html').addClass('js-search')

      setTimeout ->
        $('#search-query').focus()
      , 100

  .on 'click touchend', '#search-mask, #search-close', (event) ->
    event.preventDefault()

    closeSearch()

  .on 'turbolinks:before-cache', ->
    closeSearch()

  .on 'ajax:success', '#search-form', (event) ->
    $('#search-query').blur()
