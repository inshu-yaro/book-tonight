(function() {
  var pageCtrl;

  pageCtrl = function($scope, $window) {
    $scope.isRootPage = false;
    $scope.setRootPage = function(b) {
      return $scope.isRootPage = b;
    };
    return $scope.back = function() {
      return $window.history.back();
    };
  };

  angular.module('BookTonight').controller('PageCtrl', ['$scope', '$window', pageCtrl]);

}).call(this);
