(function() {
  var searchCtrl;

  searchCtrl = function($scope, $state, geolocation, Hotel, hotelContainer) {
    var getParams, getPriceRange, makeSearch;
    $scope.setRootPage(true);
    makeSearch = function(params) {
      return Hotel.query(params, function(hotels) {
        hotelContainer.setHotels(hotels);
        return $state.go('results');
      });
    };
    getPriceRange = function(price) {
      switch (price) {
        case '1':
          return [0, 8000];
        case '2':
          return [8000, 16000];
        case '3':
          return [24000, 32000];
        case '4':
          return [32000, 99999999];
        default:
          return [0, 99999999];
      }
    };
    getParams = function(coords, price) {
      var date, params, priceRange;
      date = moment().format('YYYY-MM-DD');
      priceRange = getPriceRange(price);
      return params = {
        checkin_date: date,
        checkout_date: date,
        latitude: coords.latitude,
        longitude: coords.longitude,
        searchRadius: 2.9,
        minCharge: priceRange[0],
        maxCharge: priceRange[1]
      };
    };
    return $scope.searchHotels = function(price) {
      console.log('Searching');
      return geolocation.getLocation().then(function(location) {
        var params;
        params = getParams(location.coords, price);
        console.log(params);
        return makeSearch(params);
      }, function(err) {
        var params;
        console.log('Could not get location');
        $scope.error = '位置情報を取得できなかった。';
        params = getParams({
          latitude: 35.689735,
          longitude: 139.70026
        }, price);
        return makeSearch(params);
      });
    };
  };

  angular.module('BookTonight').controller('SearchCtrl', ['$scope', '$state', 'geolocation', 'Hotel', 'hotelContainer', searchCtrl]);

}).call(this);
