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
      if ( data == null ){
        return new Date();
      } else {
        return new Date(data);
      }
    };
  });

  deliveryNotesApp.filter('parseAndFormatDate', function() {
    return function(data) {
      if ( data == null ){
        var parsedDate = new Date();
      } else {
        var parsedDate = new Date(data);
      }
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
          if ( data == null ){
            var parsedDate = new Date();
          } else {
            var parsedDate = new Date(data);
          }
          var formattedDate = ("0"+parsedDate.getDate()).slice(-2) + "/" + ("0"+(parsedDate.getMonth()+1)).slice(-2) + "/" + parsedDate.getFullYear();
          return formattedDate; //converted
        });
      }
    }
  });

  deliveryNotesApp.directive( "mwConfirmClick", [
    function( ) {
      return {
        priority: -1,
        restrict: 'A',
        scope: { confirmFunction: "&mwConfirmClick" },
        link: function( scope, element, attrs ){
          element.bind( 'click', function( e ){
            // message defaults to "Are you sure?"
            var message = attrs.mwConfirmClickMsg ? attrs.mwConfirmClickMsg : "¿Seguro?";
            // confirm() requires jQuery
            if( confirm( message ) ) {
              scope.confirmFunction();
            }
          });
        }
      }
    }
  ]);

})();
