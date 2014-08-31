mapDrawerProvider = ->
  class MapDrawer
    constructor: (@map) ->
      @markers = []

    drawHotels: (hotels) ->
      angular.forEach hotels, (h) => @drawHotel(h)

    drawHotel: (hotel) ->
      latLng = new google.maps.LatLng(hotel.latitude, hotel.longitude)
      marker = new google.maps.Marker
        position: latLng
        map: @map
        title: hotel.hotelName
      @markers.push(marker)

angular.module('BookTonight').factory 'MapDrawer', [
  mapDrawerProvider
]
