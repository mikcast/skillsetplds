$ ->
  # initialize
  equalizeColumns()

$(window).resize ->
  # adjust on resize
  equalizeColumns()

equalizeColumns = ->
  $('.row.equalize').each ->
    $row = $(this)
    tallest = 0
    collapsed = false
    $(this).children('*').each (i) ->
      $(this).css('min-height','1px')
      collapsed = ($(this).outerWidth() == $row.outerWidth())
      unless collapsed
        $(this).addClass('equal') unless $(this).hasClass('equal')
        if $(this).outerHeight() > tallest
          tallest = $(this).outerHeight()
    $(this).children('*').css('min-height',tallest) unless collapsed
