angular
  .module('app', ['ngRoute', 'restangular'])
  .config(['$routeProvider', 'RestangularProvider', 
  function($routeProvider, RestangularProvider) {
    // CRUD API not implemented yet. Will use Grape when needed.
    //RestangularProvider.setBaseUrl('/api/v1');
    // $routeProvider.when('/', {
    //   controller: 'MainCtrl'
    // }).when('/:status', {
    //   controller: 'HomeCtrl',
    // }).otherwise({
    //   redirectTo: '/'
    // });
  }]);
