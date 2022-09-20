module servers.ecm.controllers.pages.folders.index;

@safe:
import servers.ecm;

class DECMFoldersIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("ECMFoldersIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(ECMFoldersIndexView(this));
  }
}
mixin(MVCControllerCalls!("ECMFoldersIndexPageController", "DECMFoldersIndexPageController"));
