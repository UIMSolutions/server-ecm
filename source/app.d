import vibe.vibe;
import servers.ecm;

mixin DefaultConfig!("server-ecm");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
	debug writeln("SetRouterDefault!()");
  mixin(SetRouterDefault!());

  thisApplication
		.rootPath("/ecm/")
		.register(router);

  mixin(SetHTTP!());
	runApplication();
}