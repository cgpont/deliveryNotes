(function() {

  deliveryNotesApp.controller( 'dnController' , function ( $scope , $http, $location ) {

  if ($location.path() != '/deliverynote/new'){
  	$http.get( 'index.cfm/' + $location.path() ).success( function( data ) {
  		$scope.deliveryNote = data[0];
  	} );
  }

  $scope.updateDeliveryNote = function( data ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/update',
			data: "&albaran=" + data['albaran'] + "&anyo=" + data['anyo'] + "&cliente=" + data['cliente'],
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( data ){
			// Do something here if you want
		});
	};

	$scope.deleteDeliveryNote = function( id, albaran, anyo ) {
		$http({
			method: 'DELETE',
			url: 'index.cfm/deliverynote/' + albaran + '/' + anyo
		}).success( function( data ){
			delete $scope.deliveryNotes[ id ];
			$scope.keylist.splice( $scope.keylist.indexOf(id) , 1 );
		});
	};

});

})();
