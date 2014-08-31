reservationCtrl = ($scope, hotelContainer) ->
  $scope.hotel = hotelContainer.getCurrentHotel()

angular.module('BookTonight').controller 'ReservationCtrl', [
  '$scope', 'hotelContainer', reservationCtrl
]
