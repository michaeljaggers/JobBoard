﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JobBoard.UI.Startup))]
namespace JobBoard.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
