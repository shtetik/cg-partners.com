document.addEventListener 'turbolinks:load', ->
  $('.masonry-grid').masonry
    itemSelector: '.masonry-grid__column'
