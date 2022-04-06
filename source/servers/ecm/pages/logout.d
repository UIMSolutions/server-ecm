module server.cms.pages.logout;

@safe:
import servers.ecm;

static this() {
    serverCms.logout(new class DH5AppPage {
      this() { super(); }

      override string content(STRINGAA reqParameters) { 
  
   if (auto session = _request.session) {
    app.peers[_request.peer] = null;

    if (session.isKeySet("sessionId")) {
      string sessionId = session.get!string("sessionId");
      app.sessions.remove(sessionId);
    }
   }
  _response.redirect("/login");

          return 
H5Div(["container-xl"],
  pageTitle("Logout"),
  BS5Row("messages", [""]),
  BS5Row(["row-cards"])).toString;       

      }
    }
  );
}