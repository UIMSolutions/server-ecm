import vibe.vibe;
import servers.ecm;

mixin DefaultConfig!("server-ecm");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
  
	router
		.get("/", &ecmIndex)
		.get("/documents", &ecmDocuments)
		.get("/folders", &ecmFolders)
		.get("/workspaces", &ecmWorkspaces);/* 
		.get("/login", &uimLoginPage)
		.get("/login2", &uimLogin2Page)
		.get("/register", &uimRegister)
		.get("/logout", &uimLogout)
		.get("/server", &uimServer)
		.get("/sites", &uimSites); */

  mixin(SetHTTP!());
	runApplication();
}