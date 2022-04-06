module servers.ecm.pages.index;

@safe:
import servers.ecm;

static this() {
    serverCms.index(new class DH5AppPage {
      this() { super(); }

      override string content(STRINGAA reqParameters) {
        debug writeln("serverCms.index -> reqparameters = ", reqParameters);

/*         if ("sessionId" !in reqParameters) { 
          debug writeln("SessionId not found in reqParameters");
          _response.redirect("/login"); return ""; }
        debug writeln("SessionId found");

        auto sessionId = reqParameters["sessionId"];
 */     
        auto sessionId = getSessionId(_request, reqParameters);
        debug writeln("SessionId = ", sessionId);

        auto sessionToken = this.app.repository.findOne("central.sessions", ["id":sessionId]);
        if (sessionToken == Json(null)) {
          debug writeln("SessionId not found in central.sessions -> ");
          _response.redirect("/login"); return ""; }
        debug writeln("Found SessionToken -> ", sessionToken);
        sessionToken["lastAccess"] = toTimestamp(now());
        this.app.repository.update("central.sessions", ["id":sessionId], sessionToken);

        if (("siteId" !in sessionToken) && ("siteId" !in reqParameters)) {
          debug writeln("No SiteId in SessionToken");

          auto sites = this.app.repository.find("central.sites").map!(a => CTLSite(a)).array;
          string result;
          foreach(site; sites) {
            result ~= 
              H5Div(["col-md-6 col-xl-3"],
                H5Div(["ratio ratio-1x1"], 
                  H5A(["card card-link"], ["href":"/index?siteId="~site.id.toString], 
                    H5Div(["card-body text-center"], 
                      H5Div(["card-title mb-1"], site.display),
                      H5Div(["text-muted"], BS5ButtonLink(["btn-info"], ["href":"/index?siteId=%s".format(site.id)], "Wechsel zu Site")))))).toString;
          }
          _content =
            H5Div(["content"],
              H5Div(["container-xl"], 
                BS5Row("messages", [""]),
                BS5Row(["row-deck row-cards"], result))).toString;
        }
        else {
          debug writeln("SiteId in SessionToken");
          string siteId = reqParameters.get("siteId", sessionToken["siteId"].get!string);
          sessionToken["lastAccess"] = toTimestamp(now());
          sessionToken["siteId"] = siteId;
          sessionToken.remove("_id");
          this.app.repository.update("central.sessions", ["id":sessionId], sessionToken);
          
          reqParameters["script"] = reqParameters.get("script", "")
          ~"sessionStorage.setItem('sessionId', '%s'); sessionStorage.setItem('siteId', '%s');".format(sessionId, siteId);

          _content =
              H5Div(["content"],
                H5Div(["container-xl"], 
                  BS5Row("messages", [""]),
                  BS5Row(["row-deck row-cards"], siteId))).toString;
        }

        return _content;
      }
    }
  );
}

