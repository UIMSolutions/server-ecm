module servers.ecm.views.documents.index;

@safe:
import servers.ecm;

class DECMDocumentsIndexView : DMVCView {
  mixin(MVCViewThis!("ECMDocumentsIndexView"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewCalls!("ECMDocumentsIndexView", "DECMDocumentsIndexView"));
