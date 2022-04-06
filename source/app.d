import vibe.vibe;
import servers.ecm;

mixin DefaultConfig!("server-ecm");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
  


	router
		.get("/login", &app.login.request)
		.get("/logout", &app.logout.request);

  mixin(SetHTTP!());
	runApplication();
}