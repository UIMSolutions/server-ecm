module servers.ecm;

@safe:
mixin ImportPhobos;
mixin ImportDubs;
mixin ImportUim;

public import colored;

// Additional imports
public import uim.jsonbase;
public import uim.entities;
public import uim.entitybase;
public import uim.apps;
public import uim.servers;

// server-ecm packages
public import servers.ecm.controllers;
public import servers.ecm.views;
public import servers.ecm.routes;

public import models.systems;
public import models.ecm;

public import layouts.tabler;

// mixin(ImportLocal!("ecm"));

DMVCApplication thisApplication;
string[size_t] errorMessages;
static this() {
  thisApplication = MVCApplication
    .rootPath("/")
    .route("index", ECMIndexPageController)
    .route("documents",  ECMDocumentsPageController)
    .route("folders",    ECMFoldersPageController)
    .route("workspaces", ECMWorkspacesPageController);
}