component accessors = true {

	property framework;
	property deliveryNoteService;

	public void function default( struct rc ) {

		location(url:"/index.html",addtoken:false);

	}

	public void function get( struct rc ) {

		var deliveryNoteBean = deliveryNoteService.get(arguments.rc.id, arguments.rc.year);

		framework.renderdata("JSON" , deliveryNoteBean);

	}

	public void function delete( struct rc ) {

		var ret = deliveryNoteService.delete(arguments.rc.id, arguments.rc.year);

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


}
