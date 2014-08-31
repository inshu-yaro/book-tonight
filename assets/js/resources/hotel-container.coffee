hotelContainerProvider = ->
  hotels = []

  setHotels: (_hotels) ->
    hotels = _hotels
  getHotels: -> hotels

angular.module('BookTonight').factory 'HotelContainer', [
  hotelContainerProvider
]
