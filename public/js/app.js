(function() {
  var app = angular.module('vora', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {

    $stateProvider.state('gateKeeper', {
      url: '/test',
      contoller: 'ApplicationController',
      templateUrl: '/views/partials/login.html'
    });

    $stateProvider.state('fest', {

      url:'/fest',
      controller: 'ApplicationController',
      template: 'HELLOOOOOO'

    });

    $urlRouterProvider.otherwise('/test');

    // $locationProvider.html5Mode(true);
  });

  app.controller('ApplicationController', function($location,$state) {

    var self = this;

    // Has to be in a function
    self.wut = function() {
      $state.go('gateKeeper');
    };





  });

}());
