pageCtrl = ($scope) ->
  $scope.isRootPage = false

  $scope.setRootPage = (b) ->
    $scope.isRootPage = b


angular.module('BookTonight').controller 'PageCtrl', [
  '$scope', pageCtrl
]
