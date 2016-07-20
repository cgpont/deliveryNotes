component  {

	public any function init(  ) {

		variables.deliveryNotes = getDeliveryNotes();

	}

    /**
    * @hint		Converts a query to an array.
    * 			Each record of the query will be encapsulated as an array item
    */
    private function queryToArray(q) {
        var s = [];
        var cols = q.columnList;
        var colsLen = listLen(cols);
        for(var i=1; i<=q.recordCount; i++) {
            var row = {};
            for(var k=1; k<=colsLen; k++) {
                row[lcase(listGetAt(cols, k))] = q[listGetAt(cols, k)][i];
            }
            arrayAppend(s, row);
        }
        return s;
    }

    /**
    * @hint		Gets all the delivery notes.
    */
    private Query function getDeliveryNotes(){
		storedproc procedure="getDeliveryNotes" {
			procresult name="local.deliveryNotesSp";
		}
		return local.deliveryNotesSp;
    }

    /**
    * @hint		Gets a the delivery note from the database.
    */
    private Query function getDeliveryNote(required number id, required number year){
		storedproc procedure="getDeliveryNote" {
			procparam cfSqlType="cf_sql_integer" type="in" value=id;
			procparam cfSqlType="cf_sql_integer" type="in" value=year;
			procresult name="local.deliveryNoteSp";
		}
		return local.deliveryNoteSp;
    }

    /**
    * @hint		Updates a delivery note into the database.
    */
    private number function updateDeliveryNote(required struct deliveryNote){
		storedproc procedure="updateDeliveryNote" {
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.deliveryNote.albaran);
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.deliveryNote.anyo);
			procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cliente);
		}
		return arguments.deliveryNote;
    }

    /**
    * @hint		Inserts a delivery note into the database.
    */
    private number function insertDeliveryNote(required struct deliveryNote){
		storedproc procedure="insertDeliveryNote" {
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.deliveryNote.albaran);
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.deliveryNote.anyo);
			procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cliente);
		}
		return arguments.deliveryNote;
    }

    /**
    * @hint		Deletes a delivery note from the database.
    */
    private void function deleteDeliveryNote(required number albaran, required number anyo){
		storedproc procedure="deleteDeliveryNote" {
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.albaran);
			procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.anyo);
		}
    }

    /**
    * @hint		Gets a list of delivery notes.
    */
	public any function list( ) {
		var arrDeliveryNotes = queryToArray(deliveryNotes);
		return arrDeliveryNotes;
	}

    /**
    * @hint		Gets a delivery note.
    */
	public any function get(number id, number year) {
		var arrDeliveryNote = queryToArray(getDeliveryNote(trim(arguments.id), trim(arguments.year)));
		return arrDeliveryNote;
	}

    /**
    * @hint		Updates a delivery note.
    */
	public any function update( struct deliveryNote  ) {
		var ret = updateDeliveryNote(deliveryNote);
		return ret;
	}

    /**
    * @hint		Inserts a delivery note.
    */
	public any function insert( struct deliveryNote  ) {
		var ret = insertDeliveryNote(deliveryNote);
		return ret;
	}

    /**
    * @hint		Deletes a delivery note.
    */
	public any function delete(number albaran, number anyo) {
		var ret = deleteDeliveryNote(albaran, anyo);
	}

}
