module servers.ecm.views.folders.index;

@safe:
import servers.ecm;

class DECMFoldersIndexView : DMVCView {
  mixin(MVCViewThis!("ECMFoldersIndexView"));

  override void initialize() {
    super.initialize;
  }
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!ECMFoldersIndexView~":ECMFoldersIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Folders -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("ECMFoldersIndexView", "DECMFoldersIndexView"));
