module servers.ecm.views.index;

@safe:
import servers.ecm;

class DECMIndexView : DView {
  mixin(ViewThis!("ECMIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DECMIndexView~":DECMIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        H5A(["href":"https://www.sicherheitsschmiede.de"], 
          H5Img(["src":"/img/uim.png", "height":"80", "alt":"Sicherheitsschmiede - Sicher im Internet"])),
        UIMFormCard("loginForm", ["card-md"], ["autocomplete":"off"]).method("post").action("/login_action")( 
          H5Div(["card-body"], 
            H5H2(["card-title", "text-center", "mb-4"], "Hallo"),
            H5Div(["mb-3"], "Sie haben sich erfolgreich abgemeldet"),
            H5Div(["form-footer"]))),
        H5Div(["text-center mb-4"], H5Div(["text-center text-muted mt-3"], 
          H5String("Wieder anmelden? "), H5A(["href":"/login", "tabindex":"-1"], "Anmelden")))
      )
    ].toH5;
  }
}
mixin(ViewCalls!("ECMIndexView"));