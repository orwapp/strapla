angular.module('app').controller 'FeaturesCtrl', (Feature, $scope) ->
  console.log 'FeaturesCtrl'
  Feature.query(requestId: 1).then (rs) ->
    $scope.features = rs