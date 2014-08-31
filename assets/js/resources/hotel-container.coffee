hotelContainerProvider = ->
  hotels = []
  currentHotel = null

  {
    setHotels: (_hotels) ->
      hotels = _hotels
    getHotels: -> hotels

    setCurrentHotel: (hotel) ->
      currentHotel = hotel
    getCurrentHotel: -> currentHotel
  }


angular.module('BookTonight').factory 'hotelContainer', [
  hotelContainerProvider
]
