angular.module('app').factory 'Feature', ['railsResourceFactory', (railsResourceFactory) ->
  resource = railsResourceFactory
    url: '/features/{{id}}'
    name: 'feature'
]
