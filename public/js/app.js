(function() {
  var app = angular.module('vora', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {


    $locationProvider.html5Mode(true);
  });

  app.controller('ApplicationController', function() {
    var self = this;
  });



  app.controller('GateController', ['$http', function($http) {
    var self = this;

    self.userEmail = '';
    self.userPassword = '';
    self.userPasswordConfirmation = '';

    self.submit = function() {
      $http.post('/createuser/'+self.userEmail+'/'+self.userPassword+'/'+self.userPasswordConfirmation)
        .success(function(data, status) {
          console.log(status+': Post successful, yet');
          console.log(data);
        })
        .error(function(data, status) {
          console.log('Error making post: '+status);
          console.log(data);
    });};

    self.checkUniqueEmail = function() {
      $http.post('/checkemail/'+self.userEmail)
        .success(function(email, status) {
          console.log(status+': Post successful.');
          if (!email.exists) {
            console.log('Does not exist!');
          }
        })
        .error(function(data, status) {
          console.log('Error making post: '+status);
          console.log(data);
    });};



  }]);

}());
