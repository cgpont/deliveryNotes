component accessors = true {

	property framework;
	property deliveryNoteService;

	public void function default( struct rc ) {

		location(url:"/index.html",addtoken:false);

	}

	public void function get( struct rc ) {

		var deliveryNoteBean = deliveryNoteService.get(arguments.rc.id, arguments.rc.year);
		var deliveryNoteArticles = deliveryNoteService.getArticlesFromDeliveryNote(arguments.rc.id, arguments.rc.year);
		var arrDeliveryNote = ArrayNew(1);
		arrDeliveryNote[1] = deliveryNoteBean;
		arrDeliveryNote[2] = deliveryNoteArticles;

		framework.renderdata("JSON" , arrDeliveryNote);

	}

	public void function deleteDeliveryNote( struct rc ) {

		var ret = deliveryNoteService.deleteDeliveryNote(arguments.rc.id, arguments.rc.year);

		framework.renderdata("JSON" , ret);

	}

	public void function list( struct rc ) {

		var deliveryNotes = deliveryNoteService.list();

		framework.renderdata("JSON" , deliveryNotes);

	}

	public void function update( struct rc ) {

		var ret = deliveryNoteService.update( arguments.rc );

		framework.renderdata("JSON" , ret);

	}

	public void function insert( struct rc ) {

		var ret = deliveryNoteService.insert( arguments.rc );

		framework.renderdata("JSON" , ret);

	}

	public void function saveArticle( struct rc ) {

		var ret = deliveryNoteService.saveArticle( arguments.rc );

		framework.renderdata("JSON" , ret);

	}

	public void function deleteArticle( struct rc ) {

		var ret = deliveryNoteService.deleteArticle(arguments.rc.cod, arguments.rc.id, arguments.rc.year);

		framework.renderdata("JSON" , ret);

	}

}
