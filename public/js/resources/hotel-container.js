(function() {
  var hotelContainerProvider;

  hotelContainerProvider = function() {
    var currentHotel, hotels;
    hotels = [];
    currentHotel = null;
    return {
      setHotels: function(_hotels) {
        return hotels = _hotels;
      },
      getHotels: function() {
        return hotels;
      },
      setCurrentHotel: function(hotel) {
        return currentHotel = hotel;
      },
      getCurrentHotel: function() {
        return currentHotel;
      }
    };
  };

  angular.module('BookTonight').factory('hotelContainer', [hotelContainerProvider]);

}).call(this);
