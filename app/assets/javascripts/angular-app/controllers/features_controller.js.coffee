angular.module('app').controller 'FeaturesCtrl', (Feature, $scope, $location) ->

  match =  /requests\/(\d*)/.exec($location.absUrl())
  requestId = match.pop()

  Feature.query(requestId: requestId).then (rs) ->
    $scope.features = rs