reservationCtrl = ($scope, hotelContainer) ->
  console.log hotelContainer.getCurrentHotel()


angular.module('BookTonight').controller 'ReservationCtrl', [
  '$scope', 'hotelContainer', reservationCtrl
]
