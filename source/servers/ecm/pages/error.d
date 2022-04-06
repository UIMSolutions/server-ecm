module servers.ecm.pages.error;

@safe:
import servers.ecm;

static this() {
    serverCms.error(new class DH5AppPage {
      this() { super(); }
      override string content(STRINGAA reqParameters) { 
        return
          `<div class="content-wrapper" style="min-height: 1592.4px;">
<div class="empty">
  <div class="empty-header">404</div>
  <p class="empty-title">Oops… You just found an error page</p>
  <p class="empty-subtitle text-muted">
    Try adjusting your search or filter to find what you're looking for.
  </p>
  <div class="empty-action">
    <a href="/" class="btn btn-primary">
      Take me home
    </a>
  </div>
</div>  </div>`;    }}
   );
}