pageCtrl = ($scope, $window) ->
  $scope.isRootPage = false

  $scope.setRootPage = (b) ->
    $scope.isRootPage = b

  $scope.back = ->
    $window.history.back()


angular.module('BookTonight').controller 'PageCtrl', [
  '$scope', '$window', pageCtrl
]
