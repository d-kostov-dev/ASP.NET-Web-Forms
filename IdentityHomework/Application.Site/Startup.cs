using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Application.Site.Startup))]
namespace Application.Site
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
