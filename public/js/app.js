(function() {
  var app = angular.module('vora', ['ui.router','ngAnimate']);

  app.config(function($stateProvider,$urlRouterProvider,$locationProvider) {


    $locationProvider.html5Mode(true);
  });

  app.controller('ApplicationController', function() {
    var self = this;
  });

  app.controller('GateKeeperController', ['$http', function($http) {
    var self = this;

    self.submit = function() {
      var data = {
        email: self.userEmail,
        password: self.userPassword
      };
      console.log(data);
      $http.post('/test', data)
        .success(function(data, status) {
          console.log('Success! '+status+'\n--- '+data);
          console.log(data);
        })
        .error(function(data, status) {
          console.log(status+': Error posting to /test.\n'+data);
        });

    };


  }]);

}());
