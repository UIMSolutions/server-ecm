module servers.ecm.views.workspaces.index;

@safe:
import servers.ecm;

class DECMWorkspacesIndexView : DMVCView {
  mixin(MVCViewThis!("ECMWorkspacesIndexView"));

  override void initialize() {
    super.initialize;
  }
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!ECMWorkspacesIndexView~":ECMWorkspacesIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Workspaces -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("ECMWorkspacesIndexView", "DECMWorkspacesIndexView"));
