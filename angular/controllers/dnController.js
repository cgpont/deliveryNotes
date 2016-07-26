(function() {

  deliveryNotesApp.controller( 'dnController' , function ( $scope , $http, $location, $filter ) {

  if ($location.path() != '/deliverynote/new'){
  	$http.get( 'index.cfm/' + $location.path() ).success( function( data ) {
  		$scope.deliveryNote = data[0][0];
      $scope.deliveryNoteArticles = data[1];
      $scope.keylist = Object.keys($scope.deliveryNoteArticles).sort(function(a, b){return b-a});
  	} );
  }

  $scope.insertDeliveryNote = function( data ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/insert',
      data: "&albaran=" + data['albaran'] + "&anyo=" + data['anyo'] + "&cliente=" + data['cliente'] +
            "&direccion=" + data['direccion'] + "&cp=" + data['cp'] + "&poblacion=" + data['poblacion'] +
            "&provincia=" + data['provincia'] + "&agencia=" + data['agencia'] + "&departamento=" + data['departamento'] +
            "&fechaAlbaran=" + $filter('parseAndFormatDate')(data['fechaalbaran']) + "&fechaSalida=" + $filter('parseAndFormatDate')(data['fechasalida']) + "&bultos=" + data['bultos'] +
            "&pallets=" + data['pallets'] + "&aatencion=" + data['aatencion'] + "&responsable=" + data['responsable'] +
            "&numPedido=" + data['numPedido'] + "&observaciones=" + data['observaciones'] + "&mercancia=" + data['mercancia'] +
            "&estado=" + data['estado'] + "&fechaRecepcion=" + $filter('parseAndFormatDate')(data['fecharecepcion']),
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( data ){
			// Do something here if you want
		});
	};

  $scope.updateDeliveryNote = function( data ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/update',
			data: "&albaran=" + data['albaran'] + "&anyo=" + data['anyo'] + "&cliente=" + data['cliente'] +
            "&direccion=" + data['direccion'] + "&cp=" + data['cp'] + "&poblacion=" + data['poblacion'] +
            "&provincia=" + data['provincia'] + "&agencia=" + data['agencia'] + "&departamento=" + data['departamento'] +
            "&fechaAlbaran=" + $filter('parseAndFormatDate')(data['fechaalbaran']) + "&fechaSalida=" + $filter('parseAndFormatDate')(data['fechasalida']) + "&bultos=" + data['bultos'] +
            "&pallets=" + data['pallets'] + "&aatencion=" + data['aatencion'] + "&responsable=" + data['responsable'] +
            "&numPedido=" + data['numPedido'] + "&observaciones=" + data['observaciones'] + "&mercancia=" + data['mercancia'] +
            "&estado=" + data['estado'] + "&fechaRecepcion=" + $filter('parseAndFormatDate')(data['fecharecepcion']),
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

  $scope.saveArticle = function( data ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/',
			data: "&albaran=" + data['albaran'] + "&anyo=" + data['anyo'] + "&cliente=" + data['cliente'],
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( data ){
			// Do something here if you want
		});
	};

});

})();
