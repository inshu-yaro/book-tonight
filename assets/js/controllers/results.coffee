resultsCtrl = ($scope, $window, $stateParams, geolocation, hotelContainer, MapDrawer) ->

  initialize = (callback) ->
    geolocation.getLocation().then (location) ->
      createMap(location.coords)
    , (err) ->
      createMap()

    createMap = (loc) ->
      loc ?= { latitude: 35.689735, longitude: 139.70026 }
      mapOptions =
        center: new google.maps.LatLng(loc.latitude, loc.longitude)
        zoom: 14
      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
      drawHotels(map)


  drawHotels = (map) ->
    mapDrawer = new MapDrawer(map)
    mapDrawer.drawHotels(hotelContainer.getHotels())

  google.maps.event.addDomListener($window, 'load', initialize)
  initialize()


angular.module('BookTonight').controller 'ResultsCtrl', [
  '$scope', '$window', '$stateParams', 'geolocation'
  'hotelContainer', 'MapDrawer', resultsCtrl
]
