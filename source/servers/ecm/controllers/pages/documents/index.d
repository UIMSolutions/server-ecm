module servers.ecm.controllers.pages.documents.index;

@safe:
import servers.ecm;

class DECMDocumentsIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("ECMDocumentsIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(ECMDocumentsIndexView(this));
  }
}
mixin(MVCControllerCalls!("ECMDocumentsIndexPageController", "DECMDocumentsIndexPageController"));
