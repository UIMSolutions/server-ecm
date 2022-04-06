module servers.ecm.pages.login2action;

@safe:
import servers.ecm;

static this() {
  serverCms.pages("login2action", new class DH5AppPage {
    this() { super(); }

    override void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
      _request = req;
      _response = res;
      foreach(k, v; this.parameters) if (k !in reqParameters) reqParameters[k] = v;

      auto session = req.session;
      if (!req.session) {
        app.peers[req.peer]["message"] = "danger/Anmeldung war nicht möglich/Benutzername und-oder Password sind unbekannt";
        res.redirect("/login");
      }
      else if (session.id !in app.sessions) {
        app.peers[req.peer]["message"] = "danger/Anmeldung war nicht möglich/Benutzername und-oder Password sind unbekannt";
        res.terminateSession();
        res.redirect("/login");
      }
      else if (session.id in app.sessions) {
        auto appSession = app.sessions[session.id];

        if ("accountName" in appSession) {
          auto accountName = appSession["accountName"];
          auto accounts = this.app.repository.find("user_accounts", ["name": accountName]);

          writeln("ACCOUNTS -> ", this.app.repository.find("user_accounts", ["name": accountName]));
          writeln("ACCOUNT -> ", this.app.repository.findOne("user_accounts", ["name": accountName]));

          if (accounts.length > 0) {                 
            auto account = accounts[0];
            auto passwords = this.app.repository.find("user_passwords", ["account": account["id"].get!string]);

            if (passwords.length > 0) {
              writeln("password found in repository");
              writeln("user Found");

              res.redirect("/mysite");
              reqParameters["redirect"] = "/mysite";
            }
            else {
              app.peers[req.peer]["message"] = "danger/Anmeldung war nicht möglich/Benutzername und-oder Password sind unbekannt";
              app.sessions.remove(session.id);
              res.terminateSession();
              res.redirect("/login");
            }
          }
          else {
            app.peers[req.peer]["message"] = "danger/Anmeldung war nicht möglich/Benutzername und-oder Password sind unbekannt";
            app.sessions.remove(session.id);
            res.terminateSession();
            res.redirect("/login");
          }
        }
      }
      else {
        app.peers[req.peer]["message"] = "info/Anmeldung erforderlich/Bitte Benutzername eingeben";
        res.redirect("/login");
        reqParameters["redirect"] = "/login";
      }

    }}
  );
}

