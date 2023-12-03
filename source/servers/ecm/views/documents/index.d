module servers.ecm.views.documents.index;

@safe:
import servers.ecm;

class DECMDocumentsIndexView : DMVCView {
  mixin(MVCViewThis!("ECMDocumentsIndexView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!ECMDocumentsIndexView~":ECMDocumentsIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Documents -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("ECMDocumentsIndexView", "DECMDocumentsIndexView"));
