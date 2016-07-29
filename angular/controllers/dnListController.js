(function() {

  deliveryNotesApp.controller( 'dnListController' , function ( $scope , $http  ) {

	$http.get( 'index.cfm/deliverynotes/' ).success( function( data ) {
		$scope.deliveryNotes = data;
		$scope.keylist = Object.keys($scope.deliveryNotes).sort(function(a, b){return b-a});
	} );

  $scope.goToDeliveryNote = function() {
    $scope.selected = this.deliveryNotes[this.key];
    window.location.href = '/index.html#/deliverynote/' + $scope.selected.albaran + '/' + $scope.selected.anyo;
	};

	$scope.newDeliveryNote = function( ) {    
    window.location.href = '/index.html#/deliverynote/new/';
	};

});

})();
