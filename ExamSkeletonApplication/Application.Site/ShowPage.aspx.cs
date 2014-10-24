using Application.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site
{
    public partial class ShowPage : System.Web.UI.Page
    {
        private DataProvider data;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var itemId = Convert.ToInt32(Request.Params["pageId"]);

                if (itemId == 0)
                {
                    Response.Redirect("/");
                }

                this.data = new DataProvider();

                var currentPage = this.data.SitePages.Find(itemId);

                this.Page.Title = currentPage.Title;
                this.pageTitle.InnerText = currentPage.Title;
                this.pageContent.InnerText = currentPage.Content;
            }
        }
    }
}