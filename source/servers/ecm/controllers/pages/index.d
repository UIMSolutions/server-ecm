module servers.ecm.controllers.pages.index;

@safe:
import servers.ecm;

class DECMIndexPageController : DMVCPageController {
  mixin(MVCControllerThis!("ECMIndexPageController"));

  override void initialize() {
    super.initialize;

    this
      .view(
        ECMIndexView(this));
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DECMIndexPageController~":DECMIndexPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DECMIndexPageController~":DECMIndexPageController::afterResponse");
    if (this.session) this.session.save;
  }
}
mixin(MVCControllerCalls!("ECMIndexPageController", "DECMIndexPageController"));