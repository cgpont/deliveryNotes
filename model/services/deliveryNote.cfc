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
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.id);
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.year);
				procresult name="local.deliveryNoteSp";
			}
			return local.deliveryNoteSp;
    }

    /**
    * @hint		Updates a delivery note into the database.
    */
    private any function updateDeliveryNote(required struct deliveryNote){
			storedproc procedure="updateDeliveryNote" {
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.deliveryNote.albaran);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.deliveryNote.anyo);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cliente);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.direccion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cp);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.poblacion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.provincia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.agencia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.departamento);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaAlbaran);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaSalida);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.deliveryNote.bultos);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.deliveryNote.pallets);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.aatencion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.responsable);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.numPedido);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.observaciones);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.mercancia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.estado);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaRecepcion);
			}
			return arguments.deliveryNote;
    }

    /**
    * @hint		Inserts a delivery note into the database.
    */
    private struct function insertDeliveryNote(required struct deliveryNote){
			storedproc procedure="insertDeliveryNote" {
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cliente);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.direccion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.cp);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.poblacion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.provincia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.agencia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.departamento);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaAlbaran);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaSalida);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.deliveryNote.bultos);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.deliveryNote.pallets);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.aatencion);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.responsable);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.numPedido);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.observaciones);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.mercancia);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.deliveryNote.estado);
				procparam cfSqlType="cf_sql_date" type="in" value=trim(arguments.deliveryNote.fechaRecepcion);
				procparam cfSqlType="cf_sql_integer" type="out" variable="newAlbaran";
				procparam cfSqlType="cf_sql_smallint" type="out" variable="currentYear";
			}
			var structNewAlbaran = StructNew();
			structNewAlbaran.albaran = newAlbaran;
			structNewAlbaran.anyo = currentYear;
			return structNewAlbaran;
    }

    /**
    * @hint		Deletes a delivery note from the database.
    */
    private void function deleteDeliveryNoteFromDb(required number albaran, required number anyo){
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
		public any function update(required struct deliveryNote) {
			var ret = updateDeliveryNote(arguments.deliveryNote);
			return ret;
		}

    /**
    * @hint		Inserts a delivery note.
    */
		public any function insert(required struct deliveryNote) {
			var ret = insertDeliveryNote(arguments.deliveryNote);
			return ret;
		}

    /**
    * @hint		Deletes a delivery note.
    */
		public any function deleteDeliveryNote(required number albaran, required number anyo) {
			var ret = deleteDeliveryNoteFromDb(trim(arguments.albaran), trim(arguments.anyo));
		}

	 /**
	 * @hint		Gets all the delivery note's articles from the database.
	 */
		private Query function getArticles(required number id, required number year){
			storedproc procedure="getArticles" {
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.id);
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.year);
				procresult name="local.articlesSp";
			}
			return local.articlesSp;
		}

		/**
		* @hint		Gets all the articles from a  delivery note.
		*/
		public any function getArticlesFromDeliveryNote(required number id, required number year) {
			var arrDnArticles = queryToArray(getArticles(trim(arguments.id), trim(arguments.year)));
			return arrDnArticles;
	  }

		/**
    * @hint		Saves an article in a delivery note into the database.
    */
    private any function saveArticleIntoDb(required struct article){
			storedproc procedure="saveArticle" {
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.article.codarticulo);
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.article.albaran);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.article.anyo);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.article.codigo);
				procparam cfSqlType="cf_sql_varchar" type="in" value=trim(arguments.article.descripcion);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.article.cantidad);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.article.cajas);
			}
			return arguments.article;
    }

		/**
    * @hint		Deletes an article from a delivery note in the database.
    */
    private any function deleteArticleFromDb(required number codarticulo, required number albaran, required number anyo){
			storedproc procedure="deleteArticle" {
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.codarticulo);
				procparam cfSqlType="cf_sql_integer" type="in" value=trim(arguments.albaran);
				procparam cfSqlType="cf_sql_smallint" type="in" value=trim(arguments.anyo);
			}
			var structArticle = StructNew();
			structArticle.codarticulo = trim(arguments.codarticulo);
			structArticle.albaran = trim(arguments.albaran);
			structArticle.anyo = trim(arguments.anyo);
			return structArticle;
    }

		/**
		* @hint		Saves an article in a delivery note.
		*/
		public any function saveArticle(required struct article) {
			var ret = saveArticleIntoDb(arguments.article);
			return ret;
		}

		/**
    * @hint		Deletes an article from a delivery note.
    */
		public any function deleteArticle(required number codarticulo, required number albaran, required number anyo) {
			var ret = deleteArticleFromDb(trim(arguments.codarticulo), trim(arguments.albaran), trim(arguments.anyo));
			return ret;
		}

}
