searchCtrl = ($scope, $state, geolocation, Hotel, hotelContainer) ->
  $scope.setRootPage true

  makeSearch = (params) ->
    Hotel.query params, (hotels) ->
      $scope.setLoading  false
      hotelContainer.setHotels hotels
      $state.go 'results'

  getPriceRange = (price)->
    switch price
      when '1' then return [0, 8000]
      when '2' then return [8000, 16000]
      when '3' then return [24000, 32000]
      when '4' then return [32000, 99999999]
      else return [0, 99999999]

  getParams = (coords, price) ->
    date = moment().format('YYYY-MM-DD')
    priceRange = getPriceRange(price)
    params =
      checkin_date: date
      checkout_date: date
      latitude: coords.latitude
      longitude: coords.longitude
      searchRadius: 2.9
      minCharge: priceRange[0]
      maxCharge: priceRange[1]

  $scope.searchHotels = (price) ->
    $scope.setLoading true
    console.log 'Searching'
    geolocation.getLocation().then (location) ->
      params = getParams(location.coords, price)
      console.log params
      makeSearch(params)
    , (err) ->
      console.log 'Could not get location'
      $scope.error = '位置情報を取得できなかった。'
      params = getParams({ latitude: 35.689735, longitude: 139.70026 }, price)
      makeSearch(params)

angular.module('BookTonight').controller 'SearchCtrl', [
  '$scope', '$state', 'geolocation', 'Hotel', 'hotelContainer', searchCtrl
]
