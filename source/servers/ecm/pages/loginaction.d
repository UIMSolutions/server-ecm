module servers.ecm.pages.loginaction;

@safe:
import servers.ecm;

static this() {
    serverCms.pages("loginaction", new class DH5AppPage {
      this() { super(); }

      override void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
        _request = req;
        _response = res;
        foreach(k, v; this.parameters) if (k !in reqParameters) reqParameters[k] = v;
      
        if (("accountName" in reqParameters) && (reqParameters["accountName"].length > 0)) {
          auto session = req.session;
          if (!req.session) {
            session = res.startSession();          
            app.sessions[session.id] = ["sessionId": session.id];
          }
          if (session.id !in app.sessions) {
            res.terminateSession();
            session = res.startSession();          
            app.sessions[session.id] = ["sessionId": session.id];
          }
          app.sessions[session.id]["accountName"] = reqParameters["accountName"];

          res.redirect("/login2");
          reqParameters["redirect"] = "/login2";
        }
        else {
          auto peer = req.peer;
          if (peer !in app.peers) app.peers[peer] = ["peer": peer];
          app.peers[peer]["message"] = "warning/Benutzername/Bitte Benutzername im Textfeld eingeben";

          res.redirect("/login");
          reqParameters["redirect"] = "/login";
        }       
      }
    }
  );
}

