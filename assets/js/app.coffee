app = angular.module 'BookTonight', [
  'geolocation'
]

runCallback = ($window, geolocation) ->
  initialize = ->
    geolocation.getLocation().then (location) ->
      callback(location.coords)
    , (err) ->
      callback()

    callback = (loc) ->
      loc ?= { latitude: 35.689735, longitude: 139.70026 }
      mapOptions =
        center: new google.maps.LatLng(loc.latitude, loc.longitude)
        zoom: 14
      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

  google.maps.event.addDomListener($window, 'load', initialize)

app.run ['$window', 'geolocation', runCallback]
