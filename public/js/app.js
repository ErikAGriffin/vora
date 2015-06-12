(function() {
  var app = angular.module('vora', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {

    $stateProvider
      .state('gate', {
        url:'/',
        controller:'GateController as gateCtrl',
        templateUrl: '/views/partials/login.html'
      });

    $urlRouterProvider.otherwise('/');

    $locationProvider.html5Mode(true);
  });

  app.controller('ApplicationController', function() {
    var self = this;
  });



  app.controller('GateController', ['$http', function($http) {
    var self = this;

    self.isNewUser = false;

    self.submit = function() {
      if (self.isNewUser) {
        $http.post('/createuser/'+self.userEmail+'/'+self.userPassword+'/'+self.userPasswordConfirmation)
          .success(function(data, status) {
            console.log(status+': Post successful, yet');
            console.log(data);
          })
          .error(function(data, status) {
            console.log('Error making post: '+status);
            console.log(data);
      });} else {
        $http.post('/login/'+self.userEmail+'/'+self.userPassword)
          .success(function(data, status) {
            console.log('success');
          })
          .error(function(data, status) {
            console.log('erroar');
      });}
    };


    self.checkUniqueEmail = function() {
      $http.post('/checkemail/'+self.userEmail)
        .success(function(email, status) {
          if (!email.exists) {
            self.isNewUser = true;
          } else {
            self.isNewUser = false;
          }
        })
        .error(function(data, status) {
          console.log('Error making post: '+status);
          console.log(data);
    });};



  }]);

}());
