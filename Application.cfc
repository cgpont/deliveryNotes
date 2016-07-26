component extends="framework.one" {

	this.name = "deliveryNotesApp";
	this.datasource = "hasbro_albaranes";
  this.sessionManagement = true;
  this.sessionTimeout = createTimeSpan(0,2,0,0);

	variables.framework = {
    unhandledExtensions = "cfc,map,css,js,html",
    unhandledPaths = "/fonts",
		generateSES = 'true',
		reloadApplicationOnEveryRequest = "true",
		routes = [
		  { "$GET/deliverynote/:id/:year" = "/main/get/id/:id/year/:year" },
		  { "$GET/deliverynotes" = "/main/list/" },
		  { "$DELETE/deliverynote/:id/:year" = "/main/delete/id/:id/year/:year" },
		  { "$POST/deliverynote/insert" = "/main/insert" },
			{ "$POST/deliverynote/update" = "/main/update" },
		  { "$DELETE/article/:id/:year/:cod" = "/main/delete/id/:id/year/:year/cod/:cod" },
		  { "$POST/article/save" = "/main/saveArticle" }
		]
	};

	function setupApplication() {

	}

	function setupRequest() {

	}

}
