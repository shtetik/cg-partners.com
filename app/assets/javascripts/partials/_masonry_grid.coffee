$(document).on 'turbolinks:load', ->
  $('.masonry-grid').masonry
    itemSelector: '.masonry-grid__column'
