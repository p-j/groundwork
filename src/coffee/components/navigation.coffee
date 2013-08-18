###
 *
 *  jQuery ResponsiveNavigation by Gary Hepting
 *  
 *  Open source under the MIT License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
###

responsiveNavigationIndex = 0
delayNavigationClose = []

class ResponsiveNavigation

  constructor: (el) ->
    @index = responsiveNavigationIndex++
    @el = $(el)
    @init()

  init: ->
    @markers()
    @mouseBindings()

  markers: ->
    @el.find('li').each ->
      if $(@).find('ul').length
        $(@).addClass('menu')

  mouseBindings: ->
    $('body').on 'mouseenter', 'li.menu', ->
      clearTimeout(delayNavigationClose[@index])
      $('li.menu ul').removeClass('open')
      $(@).children('ul').addClass('open')

    $('body').on 'mouseleave', 'li.menu, ul.open', ->
      delayNavigationClose[@index] = setTimeout( =>
        $(@).find('ul').removeClass('open')
      , 500)


$ ->

  responsiveNavigationElements = []

  $('.nav').each ->
    responsiveNavigationElements.push( new ResponsiveNavigation(@) )
