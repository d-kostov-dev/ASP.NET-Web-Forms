using Application.Data;
using Application.Site.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site
{
    public partial class _Default : Page
    {
        protected void Get_Data(object sender,
            Microsoft.AspNet.EntityDataSource.EntityDataSourceContextCreatingEventArgs e)
        {
            var db = new ApplicationDbContext();
            var context = (db as IObjectContextAdapter).ObjectContext;
            e.Context = context;
        }
    }
}