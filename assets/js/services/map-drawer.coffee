mapDrawerProvider = ->
  class MapDrawer
    constructor: (@map) ->
      @markers = []

    drawHotels: (hotels, markerCallback) ->
      angular.forEach hotels, (h) => @drawHotel(h, markerCallback)

    drawHotel: (hotel, markerCallback) ->
      latLng = new google.maps.LatLng(hotel.latitude, hotel.longitude)
      icon = if hotel.reviewAverage > 4 then 'img/map-pin3.jpg' else 'img/map-pin2.jpg'
      marker = new google.maps.Marker
        position: latLng
        map: @map
        title: hotel.hotelName
        hotel: hotel
        icon: icon
      @markers.push(marker)
      if markerCallback?
        cb = (marker) ->
          markerCallback(marker, hotel)
        google.maps.event.addListener(marker, 'click', cb)

angular.module('BookTonight').factory 'MapDrawer', [
  mapDrawerProvider
]
