module servers.ecm;

@safe:
mixin ImportPhobos;
mixin ImportDubs;
mixin ImportUim;

public import colored;

// Additional imports
public import uim.central;
public import uim.jsonbase;
public import uim.entities;
public import uim.entitybase;

// ecm library
public import uim.ecm;

// server-ecm packages
public import servers.ecm.actions;
public import servers.ecm.apis;
public import servers.ecm.pages;

public import models.system;
public import models.ecm;

public import layouts.tabler;

// mixin(ImportLocal!("ecm"));

DAPPApplication serverecm;
string[size_t] errorMessages;
static this() {
  serverEcm = new class DAPPApplication {
    this() { super(); 
/*       this
      .layout(ecmLayout)
      .scripts.addLinks(
        "/js/apps/ecm/app.js");
 */    
    }
  };
}