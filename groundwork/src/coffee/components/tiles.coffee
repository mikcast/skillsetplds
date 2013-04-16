$ ->
  # init and set active tile
  $('.tiles').each ->
    $(this).find('.tile').attr('role','button')
    $(this).find('.tile[data-value='+$(this).find('input.value, select.value').val()+']').addClass('active')

  # tiles
  $('body').on 'click', '.tiles .tile', (e) ->
    unless $(this).hasClass('disabled')
      tiles = $(this).parents('.tiles')
      tiles.find('.tile').removeClass('active')
      tiles.find('input.value, select.value').val($(this).data('value')).change()
      $(this).addClass('active')
    e.preventDefault()
    return false

  # change active tile on callback
  $('body').on 'change', '.tiles input.value, .tiles select.value', (e) ->
    tiles = $(this).parents('.tiles')
    tiles.find('.tile').removeClass('active')
    tiles.find('.tile[data-value='+$(this).val()+']').addClass('active')
