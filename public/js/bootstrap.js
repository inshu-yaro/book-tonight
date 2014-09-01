(function() {
  var runCallback;

  runCallback = function($window, geolocation) {
    var initialize;
    return initialize = function() {
      var callback;
      geolocation.getLocation().then(function(location) {
        return callback(location.coords);
      }, function(err) {
        return callback();
      });
      return callback = function(loc) {
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
        return map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
      };
    };
  };

  angular.module('BookTonight').run(['$window', 'geolocation', runCallback]);

}).call(this);
