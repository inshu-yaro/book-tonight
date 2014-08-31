hotelProvider = ($resource, API_ENDPOINT) ->
  $resource("#{API_ENDPOINT}/hotels/:id", {id: '@id'})

angular.module('BookTonight').factory 'Hotel', [
  '$resource', 'API_ENDPOINT', hotelProvider
]
