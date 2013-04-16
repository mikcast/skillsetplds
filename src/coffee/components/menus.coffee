$ ->
  # navigation menus
  delay = ''
  # open submenu function
  openMenu = (target) ->
    $(target).parent('li.menu').toggleClass('on')
  # hover on
  $('body').on 'mouseenter', '.nav > ul > li.menu:not(.disabled)', (e) ->
    if $(window).width() >= 768
      clearTimeout(delay)
      $('.nav > ul > li.menu.on').removeClass('on')
      $(this).addClass('on')
  # hover off
  $('body').on 'mouseleave', '.nav > ul > li.menu:not(.disabled)', (e) ->
    if $(window).width() >= 768
      delay = setTimeout (->
        $('.nav > ul > li.menu.on').removeClass('on')
      ), 350
  # click/touch
  $('body').on 'click', '.nav > ul > li.menu:not(.disabled) > a', (e) =>
    if Modernizr.touch || $(window).width() < 768
      openMenu(e.target)
    else
      $('.nav > ul > li.menu.on').removeClass('on')
      $(e.target).parents('li.menu').addClass('on')
    e.preventDefault()
    return false
  # keyboard accessibility
  $('body').on 'focus', '.nav > ul > li:not(.on) > a', ->
    $('.nav > ul > li.menu.on').removeClass('on')
  $('body').on 'focus', '.nav > ul > li.menu > a', (e) =>
    openMenu(e.target)
    e.preventDefault()
    return false

  
  # dropdown buttons
  $('body').on 'click', (e) ->
    if $(e.target).hasClass('dropdown')
      $(e.target).toggleClass('on')
    else
      if $('.dropdown').filter('.on').length
        $('.dropdown').filter('.on').removeClass('on')
    if $('.nav > ul > li').filter('.menu.on').length
      $('.nav > ul > li').filter('.menu.on').removeClass('on')
  # keyboard accessibility
  $('body').on 'focus', '.dropdown', (e) ->
    $(this).addClass('on')
  $('body').on 'blur', '.dropdown li:last-child a', (e) ->
    $('.dropdown').filter('.on').removeClass('on')


  # hamburger menus
  $('.nav.menu').each ->
    $(this).attr('data-label','Menu') unless $(this).attr('data-label')
    $(this).prepend('<a href="#" class="menu-toggle"><i class="icon-reorder"></i></a>') unless $(this).find('.menu-toggle').length > 0
  $('body').on 'click', '.nav.menu .menu-toggle', (e) ->
    $(this).parent('.nav.menu').toggleClass('on')
    e.preventDefault()
    return false
  # keyboard accessibility
  $('body').on 'focus', '.menu-toggle', (e) ->
    $(e.target).parent('.nav.menu').addClass('on')
  $('body').on 'blur', '.nav.menu > ul > li:last-child a', (e) ->
    $('.nav.menu').filter('.on').removeClass('on')


  return

$(window).on 'resize', ->
  if $('.nav > ul > li.menu.on').length > 1
    $('.nav > ul > li.menu.on').removeClass('on').first().addClass('on')