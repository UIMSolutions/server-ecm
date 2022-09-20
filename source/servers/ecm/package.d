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
public import uim.mvc;

// server-ecm packages
public import servers.ecm.controllers;
public import servers.ecm.views;

public import models.systems;
public import models.ecm;

public import layouts.tabler;

// mixin(ImportLocal!("ecm"));

DMVCApplication thisApplication;
string[size_t] errorMessages;
static this() {
  thisApplication = MVCApplication
    .rootPath("/")
    .addRoute(MVCRoute("index",      HTTPMethod.GET, ECMIndexPageController))
    .addRoute(MVCRoute("documents",  HTTPMethod.GET, ECMDocumentsIndexPageController))
    .addRoute(MVCRoute("folders",    HTTPMethod.GET, ECMFoldersIndexPageController))
    .addRoute(MVCRoute("workspaces", HTTPMethod.GET, ECMWorkspacesIndexPageController));
}