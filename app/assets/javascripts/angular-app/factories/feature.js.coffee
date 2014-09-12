angular.module('app').factory 'Feature', (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: '/features/{{id}}'
    name: 'feature'
