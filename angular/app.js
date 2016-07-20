var deliveryNotesApp = angular.module('deliveryNotesApp', ['ngRoute']);

deliveryNotesApp.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      controller: "dnListController",
      templateUrl: "angular/views/list.html"
    })
    .when('/deliverynote/:id/:id', {
      controller: 'dnController',
      templateUrl: 'angular/views/deliveryNote.html'
    })
    .when('/deliverynote/new', {
      controller: 'dnController',
      templateUrl: 'angular/views/deliveryNote.html'
    })
    .otherwise({
      redirectTo: '/'
    });
});
