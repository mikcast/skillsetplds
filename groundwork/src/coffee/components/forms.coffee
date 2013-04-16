$ ->
  # select all text in invalid input field on focus
  $('body').on 'click', '
    .error input, 
    .error textarea, 
    .invalid input, 
    .invalid textarea, 
    input.error, 
    textarea.error, 
    input.invalid, 
    textarea.invalid', (e) ->
    $(this).focus().select()

  # polyfill select box placeholders
  $('span.select select').each ->
    if $(this).children('option').first().val() == '' and $(this).children('option').first().attr('selected')
      $(this).addClass('unselected')
    else
      $(this).removeClass('unselected')
  $('body').on 'change', 'span.select select', (e) ->
    if $(this).children('option').first().val() == '' and $(this).children('option').first().attr('selected')
      $(this).addClass('unselected')
    else
      $(this).removeClass('unselected')

  return