searchCtrl = ($scope, $state, geolocation, Hotel, hotelContainer) ->

  params =
    checkin_date: "2014-10-01"
    checkout_date: "2014-10-01"
    latitude: 35.6906
    longitude: 139.700078
    searchRadius: 1

  Hotel.query params, (hotels) ->
    hotelContainer.setHotels hotels
    $state.go 'results'


angular.module('BookTonight').controller 'SearchCtrl', [
  '$scope', '$state', 'geolocation', 'Hotel', 'hotelContainer', searchCtrl
]
