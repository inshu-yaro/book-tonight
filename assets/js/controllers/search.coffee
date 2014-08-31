searchCtrl = ($scope, $state, geolocation, Hotel, hotelContainer) ->

  makeSearch = (params) ->
    Hotel.query params, (hotels) ->
      hotelContainer.setHotels hotels
      $state.go 'results'

  getPriceRange = ->
    switch $scope.price
      when '8000' then return [0, 8000]
      when '15000' then return [15000, 30000]
      when '30000' then return [30000, 99999999]
      else return [0, 99999999]

  getParams = (location) ->
    date = moment().format('YYYY-MM-DD')
    priceRange = getPriceRange()
    params =
      checkin_date: date
      checkout_date: date
      latitude: location.coords.latitude
      longitude: location.coords.longitude
      searchRadius: 2.9
      minCharge: priceRange[0]
      maxCharge: priceRange[1]

  $scope.searchHotels = ->
    console.log 'Searching'
    geolocation.getLocation().then (location) ->
      params = getParams(location)
      console.log params
      makeSearch(params)
    , (err) ->
      console.log 'Could not get location'
      $scope.error = '位置情報を取得できなかった。'

angular.module('BookTonight').controller 'SearchCtrl', [
  '$scope', '$state', 'geolocation', 'Hotel', 'hotelContainer', searchCtrl
]
