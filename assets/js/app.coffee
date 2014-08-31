app = angular.module 'BookTonight', [
  'geolocation'
]

runCallback = ($window, geolocation) ->
  initialize = ->
    geolocation.getLocation().then (location) ->
      callback(location.coords)
    , -> callback()

    callback = (loc) ->
      loc ?= { lat: 35.689735, long: 139.70026 }
      mapOptions =
        center: new google.maps.LatLng(loc.lat, loc.long)
        zoom: 14
      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

  google.maps.event.addDomListener($window, 'load', initialize)

app.run ['$window', 'geolocation', runCallback]
