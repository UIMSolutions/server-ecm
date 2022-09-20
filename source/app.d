import vibe.vibe;
import servers.ecm;

mixin DefaultConfig!("server-ecm");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
  thisApplication
		.rootPath("/")
		.register(router);

  mixin(SetHTTP!());
	runApplication();
}