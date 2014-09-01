(function() {
  var mapDrawerProvider;

  mapDrawerProvider = function() {
    var MapDrawer;
    return MapDrawer = (function() {
      function MapDrawer(map) {
        this.map = map;
        this.markers = [];
      }

      MapDrawer.prototype.drawHotels = function(hotels, markerCallback) {
        return angular.forEach(hotels, (function(_this) {
          return function(h) {
            return _this.drawHotel(h, markerCallback);
          };
        })(this));
      };

      MapDrawer.prototype.drawHotel = function(hotel, markerCallback) {
        var cb, icon, latLng, marker;
        latLng = new google.maps.LatLng(hotel.latitude, hotel.longitude);
        icon = hotel.reviewAverage > 4.0 ? 'img/map-pin3.png' : hotel.reviewAverage > 3.6 ? 'img/map-pin4.png' : 'img/map-pin2.png';
        marker = new google.maps.Marker({
          position: latLng,
          map: this.map,
          title: hotel.hotelName,
          hotel: hotel,
          icon: icon
        });
        this.markers.push(marker);
        if (markerCallback != null) {
          cb = function(marker) {
            return markerCallback(marker, hotel);
          };
          return google.maps.event.addListener(marker, 'click', cb);
        }
      };

      return MapDrawer;

    })();
  };

  angular.module('BookTonight').factory('MapDrawer', [mapDrawerProvider]);

}).call(this);
