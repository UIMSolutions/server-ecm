module servers.ecm.pages.login;

@safe:
import servers.ecm;

static this() {
  serverCms.login(new class DAPPLoginPage {
    this() { super(); }
  });
}