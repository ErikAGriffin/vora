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

    self.submit = function() {
      // $gateKeeper.checkUniqueEmail(self.userEmail);
      $http.post('/test/'+self.userEmail)
        .success(function(data, status) {
          console.log(status+': Success!');
          console.log(data);
        })
        .error(function(data, status) {
          console.log('Error: '+status);
          console.log(data);
        });
    };


  }]);

}());
