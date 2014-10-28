using Application.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site.Controls.FooterPages
{
    public partial class FooterPages : System.Web.UI.UserControl
    {
        private DataProvider data;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.data = new DataProvider();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.PagesList.DataSource = this.data.SitePages.All().Where(x => x.IsVisible == true).ToList();
            this.PagesList.DataBind();
        }
    }
}