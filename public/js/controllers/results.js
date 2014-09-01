(function() {
  var resultsCtrl;

  resultsCtrl = function($scope, $window, $state, $stateParams, geolocation, hotelContainer, MapDrawer) {
    var drawHotels, initialize;
    $scope.setRootPage(false);
    initialize = function(callback) {
      var createMap;
      geolocation.getLocation().then(function(location) {
        return createMap(location.coords);
      }, function(err) {
        return createMap();
      });
      return createMap = function(loc) {
        var map, mapOptions;
        if (loc == null) {
          loc = {
            latitude: 35.689735,
            longitude: 139.70026
          };
        }
        mapOptions = {
          center: new google.maps.LatLng(loc.latitude, loc.longitude),
          zoom: 14
        };
        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
        return drawHotels(map);
      };
    };
    drawHotels = function(map) {
      var mapDrawer;
      mapDrawer = new MapDrawer(map);
      return mapDrawer.drawHotels(hotelContainer.getHotels(), function(marker, hotel) {
        hotelContainer.setCurrentHotel(hotel);
        return $state.go('reservation');
      });
    };
    google.maps.event.addDomListener($window, 'load', initialize);
    return initialize();
  };

  angular.module('BookTonight').controller('ResultsCtrl', ['$scope', '$window', '$state', '$stateParams', 'geolocation', 'hotelContainer', 'MapDrawer', resultsCtrl]);

}).call(this);
