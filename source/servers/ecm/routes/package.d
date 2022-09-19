module servers.ecm.routes;

@safe:
import servers.ecm;

void ecmIndex(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!ecmIndex~":ecmIndex");

  ECMIndexPageController(thisServer)
    .view(ECMIndexView)
    .request(req, res);
}