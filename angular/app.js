var deliveryNotesApp = angular.module('deliveryNotesApp', ['ngRoute','ngMessages','blockUI']);

deliveryNotesApp.config(function ($routeProvider, $httpProvider, blockUIConfig) {
  'use strict';
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

    /******* HTTP CACHING DISABLED BECAUSE IE PROBLEMS **********/
    //initialize get if not there
    if (!$httpProvider.defaults.headers.get) {
        $httpProvider.defaults.headers.get = {};
    }
    //disable IE ajax request caching
    $httpProvider.defaults.headers.get['If-Modified-Since'] = 'Mon, 26 Jul 1997 05:00:00 GMT';
    // extra
    $httpProvider.defaults.headers.get['Cache-Control'] = 'no-cache';
    $httpProvider.defaults.headers.get['Pragma'] = 'no-cache';
    /******* HTTP CACHING DISABLED BECAUSE IE PROBLEMS **********/

    // Change the default overlay message
    blockUIConfig.message = 'Procesando...';

});
