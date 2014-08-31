mapDrawerProvider = ->
  class MapDrawer
    constructor: (@map) ->
      @markers = []

    drawHotels: (hotels, markerCallback) ->
      angular.forEach hotels, (h) => @drawHotel(h, markerCallback)

    drawHotel: (hotel, markerCallback) ->
      latLng = new google.maps.LatLng(hotel.latitude, hotel.longitude)
      marker = new google.maps.Marker
        position: latLng
        map: @map
        title: hotel.hotelName
        hotel: hotel
      @markers.push(marker)
      if markerCallback?
        cb = (marker) ->
          markerCallback(marker, hotel)
        google.maps.event.addListener(marker, 'click', cb)

angular.module('BookTonight').factory 'MapDrawer', [
  mapDrawerProvider
]
