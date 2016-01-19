window.PhotoJS =
  setupMasonry: ->
    $('.photos').masonry
      itemSelector: '.card'
      columnWidth: 200
      gutter: 20

$(document).on "page:change", ->
  window.PhotoJS.setupMasonry()
