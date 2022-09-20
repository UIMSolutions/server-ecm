module servers.ecm.views.folders.index;

@safe:
import servers.ecm;

class DECMFoldersIndexView : DMVCView {
  mixin(MVCViewThis!("ECMFoldersIndexView"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewCalls!("ECMFoldersIndexView", "DECMFoldersIndexView"));
