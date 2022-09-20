module servers.ecm.views.workspaces.index;

@safe:
import servers.ecm;

class DECMWorkspacesIndexView : DMVCView {
  mixin(MVCViewThis!("ECMWorkspacesIndexView"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewCalls!("ECMWorkspacesIndexView", "DECMWorkspacesIndexView"));
