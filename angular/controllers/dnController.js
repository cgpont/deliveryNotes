(function() {

  deliveryNotesApp.controller( 'dnController' , function ( $scope , $http, $location, $filter, $route ) {

  if ($location.path() == '/deliverynote/new'){
    $scope.newDeliveryNote = 1;
    $scope.deliveryNote = [];
  } else {
    $scope.newDeliveryNote = 0;
    $http.get( 'index.cfm/' + $location.path() ).success( function( data ) {
  		$scope.deliveryNote = data[0][0];
      $scope.deliveryNoteArticles = data[1];
      $scope.keylist = Object.keys($scope.deliveryNoteArticles).sort(function(a, b){return b-a});
  	} );
  }

  $scope.insertDeliveryNote = function( deliveryNote ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/insert',
      data: "&cliente=" + deliveryNote['cliente'] +
            "&direccion=" + deliveryNote['direccion'] + "&cp=" + deliveryNote['cp'] + "&poblacion=" + deliveryNote['poblacion'] +
            "&provincia=" + deliveryNote['provincia'] + "&agencia=" + deliveryNote['agencia'] + "&departamento=" + deliveryNote['departamento'] +
            "&fechaAlbaran=" + $filter('parseAndFormatDate')(deliveryNote['fechaalbaran']) + "&fechaSalida=" +
            $filter('parseAndFormatDate')(deliveryNote['fechasalida']) + "&bultos=" + deliveryNote['bultos'] + "&pallets=" + deliveryNote['pallets'] +
            "&aatencion=" + deliveryNote['aatencion'] + "&responsable=" + deliveryNote['responsable'] + "&numPedido=" + deliveryNote['numpedido'] +
            "&observaciones=" + deliveryNote['observaciones'] + "&mercancia=" + deliveryNote['mercancia'] + "&estado=" + deliveryNote['estado'] +
            "&fechaRecepcion=" + $filter('parseAndFormatDate')(deliveryNote['fecharecepcion']),
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( responseData ){
      window.location.href = '/index.html#/deliverynote/' + responseData['ALBARAN'] + '/' + responseData['ANYO'];
		});
	};

  $scope.updateDeliveryNote = function( deliveryNote ) {
		$http({
			method: 'POST',
			url: 'index.cfm/deliverynote/update',
			data: "&albaran=" + deliveryNote['albaran'] + "&anyo=" + deliveryNote['anyo'] + "&cliente=" + deliveryNote['cliente'] +
            "&direccion=" + deliveryNote['direccion'] + "&cp=" + deliveryNote['cp'] + "&poblacion=" + deliveryNote['poblacion'] +
            "&provincia=" + deliveryNote['provincia'] + "&agencia=" + deliveryNote['agencia'] + "&departamento=" + deliveryNote['departamento'] +
            "&fechaAlbaran=" + $filter('parseAndFormatDate')(deliveryNote['fechaalbaran']) + "&fechaSalida=" +
            $filter('parseAndFormatDate')(deliveryNote['fechasalida']) + "&bultos=" + deliveryNote['bultos'] +
            "&pallets=" + deliveryNote['pallets'] + "&aatencion=" + deliveryNote['aatencion'] + "&responsable=" + deliveryNote['responsable'] +
            "&numPedido=" + deliveryNote['numpedido'] + "&observaciones=" + deliveryNote['observaciones'] + "&mercancia=" + deliveryNote['mercancia'] +
            "&estado=" + deliveryNote['estado'] + "&fechaRecepcion=" + $filter('parseAndFormatDate')(deliveryNote['fecharecepcion']),
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( responseData ){
		});
	};

	$scope.deleteDeliveryNote = function( albaran, anyo ) {
		$http({
			method: 'DELETE',
			url: 'index.cfm/deliverynote/' + albaran + '/' + anyo
		}).success( function( data ){
        window.location.href = '/index.html#/';
		});
	};

  $scope.newArticle = function( ) {
		if ( $scope.keylist.length ) {
			var newid = parseInt( $scope.keylist[0] ) + 1;
		}
		else var newid = parseInt(1);
		$scope.deliveryNoteArticles[newid] = { "codarticulo":"" , "cantidad":"", "codigo":"", "cajas":"", "descripcion":"" };
		$scope.keylist.unshift(newid);
	};

  $scope.saveArticle = function( albaran, anyo, article ) {
    $http({
			method: 'POST',
			url: 'index.cfm/article/save/',
			data: "&codarticulo=" + article['codarticulo'] + "&albaran=" + albaran + "&anyo=" + anyo +
            "&codigo=" + article['codigo'] + "&descripcion=" + article['descripcion'] +
            "&cantidad=" + article['cantidad'] + "&cajas=" + article['cajas'],
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			} // set the headers so angular passing info as form data (not request payload)
		}).success( function( responseData ){
		});
	};

  $scope.deleteArticle = function( codarticulo, albaran, anyo, key ) {
		$http({
			method: 'DELETE',
			url: 'index.cfm/article/' + codarticulo + "/" + albaran + '/' + anyo
		}).success( function( responseData ){
			$scope.keylist.splice( $scope.keylist.indexOf(key) , 1 );
		});
	};

});

})();
