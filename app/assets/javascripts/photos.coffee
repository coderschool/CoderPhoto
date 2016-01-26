window.PhotoJS =
  setupMasonry: ->
    window.$grid = $('.photos').masonry
      itemSelector: '.card'
      columnWidth: 200
      gutter: 20

$(document).on "page:change", ->
  window.PhotoJS.setupMasonry()

  $grid.imagesLoaded().progress ->
    $grid.masonry('layout')
