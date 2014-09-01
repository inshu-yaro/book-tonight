(function() {
  var hotelProvider;

  hotelProvider = function($resource, API_ENDPOINT) {
    return $resource("" + API_ENDPOINT + "/hotels/:id", {
      id: '@id'
    });
  };

  angular.module('BookTonight').factory('Hotel', ['$resource', 'API_ENDPOINT', hotelProvider]);

}).call(this);
