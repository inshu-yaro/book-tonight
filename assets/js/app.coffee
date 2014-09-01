app = angular.module 'BookTonight', [
  'ngResource'
  'ui.router'
  'geolocation'
]

app.value 'API_ENDPOINT', 'http://book-tonight-api.herokuapp.com'
