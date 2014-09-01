(function() {
  var reservationCtrl;

  reservationCtrl = function($scope, hotelContainer) {
    return $scope.hotel = hotelContainer.getCurrentHotel();
  };

  angular.module('BookTonight').controller('ReservationCtrl', ['$scope', 'hotelContainer', reservationCtrl]);

}).call(this);
