pageCtrl = ($scope, $window) ->
  $scope.isRootPage = false

  $scope.setRootPage = (b) ->
    $scope.isRootPage = b

  $scope.loading = false

  $scope.setLoading = (b) ->
    $scope.loading = b

  $scope.back = ->
    $window.history.back()


angular.module('BookTonight').controller 'PageCtrl', [
  '$scope', '$window', pageCtrl
]
