(function() {
  var reservationCtrl;

  reservationCtrl = function($scope, hotelContainer) {
    $scope.hotel = hotelContainer.getCurrentHotel();
    if ($scope.hotel == null) {
      return $scope.hotel = {
        hotelName: "Hotel Name",
        reviewAverage: 4.12,
        hotelMinCharge: 8000,
        roomImageUrl: "http://img.travel.rakuten.co.jp/share/HOTEL/15915/15915_room.jpg",
        hotelMapImageUrl: "http://img.travel.rakuten.co.jp/share/HOTEL/15915/15915map.gif",
        telephoneNo: "03-8123-48123",
        addres1: "東京都新宿区",
        addres2: "歌舞伎町3-2-1"
      };
    }
  };

  angular.module('BookTonight').controller('ReservationCtrl', ['$scope', 'hotelContainer', reservationCtrl]);

}).call(this);
