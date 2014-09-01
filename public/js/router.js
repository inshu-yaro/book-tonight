(function() {
  var router;

  router = function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/');
    return $stateProvider.state('search', {
      url: '/',
      templateUrl: 'search.html',
      controller: 'SearchCtrl'
    }).state('results', {
      url: '/results',
      templateUrl: 'results.html',
      controller: 'ResultsCtrl'
    }).state('reservation', {
      url: '/reservation',
      templateUrl: 'reservation.html',
      controller: 'ReservationCtrl'
    });
  };

  angular.module('BookTonight').config(['$stateProvider', '$urlRouterProvider', router]);

}).call(this);
