angular.module("app").directive "status", ->
  restrict: "E"
  scope: true
    #featureId: "="
    #features: "&features"

  templateUrl: "/templates/status.html.slim"

  controller: ($scope, $attrs, Feature, $filter) ->

    isOwner = $attrs.owner
    featureId = parseInt($attrs.featureId, 10)

    $scope.feature = new Feature(id: featureId)

    $scope.$watch "features", (features, old) ->
      if features
        feature = $filter('filter')(features, {id: featureId})[0];
        $scope.feature.status = feature.status

    $scope.statuses = [
        code: 'not_started',
        label: 'Not started',
        enabled: true
      ,
        code: 'started',
        label: 'Started',
        enabled: true
      ,
        code: 'completed',
        label: 'Completed'
        enabled: true
      ,
        code: 'accepted',
        label: 'Accepted',
        enabled: !isOwner

    ]

    $scope.changeStatus = (feature, newStatus) ->
      feature.status = newStatus.code
      feature.update().then ->
        console.log 'updated'