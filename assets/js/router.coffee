router = ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state 'search',
      url: '/'
      templateUrl: 'search.html'
      controller: 'SearchCtrl'
    .state 'results',
      url: '/results'
      templateUrl: 'results.html'
      controller: 'ResultsCtrl'
    .state 'reservation',
      url: '/reservation'
      templateUrl: 'reservation.html'


angular.module('BookTonight').config [
  '$stateProvider', '$urlRouterProvider', router
]
