mapDrawerProvider = ->
  class MapDrawer
    constructor: (@map) ->

    drawHotels: (hotels) ->
      angular.forEach hotels, @drawHotel

    drawHotel: (hotel) ->
      console.log hotel


angular.module('BookTonight').factory 'MapDrawer', [
  mapDrawerProvider
]
