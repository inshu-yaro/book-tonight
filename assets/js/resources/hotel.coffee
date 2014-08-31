hotelProvider = ($resource) ->
  $resource('/hotels/:id', {userId: '@id'})

angular.module('BookTonight').factory 'Hotel', [
  '$resource', hotelProvider
]
