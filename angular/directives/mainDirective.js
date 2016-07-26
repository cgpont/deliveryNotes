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
    return function(data) {
      return new Date(data);
    };
  });

  deliveryNotesApp.filter('parseAndFormatDate', function() {
    return function(data) {
      var parsedDate = new Date(data);
      var formattedDate = ("0"+parsedDate.getDate()).slice(-2) + "/" + ("0"+(parsedDate.getMonth()+1)).slice(-2) + "/" + parsedDate.getFullYear();
      return formattedDate;
    };
  });

  deliveryNotesApp.directive('dateformat', function() {
    return {
      require: 'ngModel',
      link: function(scope, element, attrs, ngModelController) {
        ngModelController.$parsers.push(function(data) {
          //convert data from view format to model format
          return data; //converted
        });
        ngModelController.$formatters.push(function(data) {
          //convert data from model format to view format
          var parsedDate = new Date(data);
          var formattedDate = ("0"+parsedDate.getDate()).slice(-2) + "/" + ("0"+(parsedDate.getMonth()+1)).slice(-2) + "/" + parsedDate.getFullYear();
          return formattedDate; //converted
        });
      }
    }
  });

})();
