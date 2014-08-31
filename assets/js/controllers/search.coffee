searchCtrl = ($scope, $state, geolocation, Hotel, HotelContainer) ->

  params =
    checkin_date: "2014-10-01"
    checkout_date: "2014-10-01"
    latitude: 128440.51
    longitude: 503172.21
    searchRadius: 1

  Hotel.query params, (hotels) ->
    HotelContainer.setHotels hotels
    $state.go 'results'


angular.module('BookTonight').controller 'SearchCtrl', [
  '$scope', '$state', 'geolocation', 'Hotel', 'HotelContainer', searchCtrl
]
