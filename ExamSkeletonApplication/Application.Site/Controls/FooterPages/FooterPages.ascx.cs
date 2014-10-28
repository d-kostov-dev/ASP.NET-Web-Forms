namespace Application.Site.Controls.FooterPages
{
    using System;
    using System.Linq;

    using Application.Data;
    
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