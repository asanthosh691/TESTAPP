using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TESTAPP.Startup))]
namespace TESTAPP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
