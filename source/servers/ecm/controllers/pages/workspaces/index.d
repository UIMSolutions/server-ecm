module servers.ecm.controllers.pages.workspaces.index;

@safe:
import servers.ecm;

class DECMWorkspacesIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("ECMWorkspacesIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(ECMWorkspacesIndexView(this));
  }
}
mixin(MVCControllerCalls!("ECMWorkspacesIndexPageController", "DECMWorkspacesIndexPageController"));
