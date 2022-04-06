module servers.ecm.pages.login2;

@safe:
import servers.ecm;

static this() {
  serverCms.pages("login2", new class DAPPLogin2Page {
    this() { super(); }
  });
}