module servers.ecm.routers;

void ecmIndex(void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
	debugMethodCall(moduleName!ecmIndex~":ecmIndex("~this.name~")::request(req, res, reqParameters)");

}

void ecmDocuments(void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse) {
	debugMethodCall(moduleName!ecmDocuments~":ecmDocuments("~this.name~")::request(req, res, reqParameters)");

}