module servers.ecm.views.index;

@safe:
import servers.ecm;

class DECMIndexView : DMVCView {
  mixin(MVCViewThis!("ECMIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DECMIndexView~":DECMIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("ECMIndexView", "DECMIndexView"));
