(function() {

  deliveryNotesApp.directive('backBtn', function () {
      return {
          restrict: 'E',
          template: '<button class="btn button btn-default"><span class="glyphicon {{icon}}"></span> {{back}}</button>',
          scope: {
              back: '@back',
              icon: '@icon'
          },
          link: function(scope, element, attrs) {
              $(element[0]).on('click', function() {
                  history.back();
                  scope.$apply();
              });
          }
      };
  });

  deliveryNotesApp.filter('parseDate', function() {
    return function(input) {
      return new Date(input);
    };
  });

})();
