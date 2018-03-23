@initMasonryGrid = ->
  $('.masonry-grid').masonry
    itemSelector: '.masonry-grid__column'

$(window).on 'load', ->
  setTimeout ->
    initMasonryGrid()
  , 100

$(document).on 'turbolinks:load', ->
  initMasonryGrid()
