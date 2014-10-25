namespace Application.Site.Administration.SitePages
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    using Application.Data;
    using Application.Models;
    using ErrorHandlerControl;

    public partial class List : Page
    {
        private DataProvider data;

        public IQueryable<SitePage> GetItems()
        {
            return data.SitePages.All().OrderBy(x => x.Id);
        }

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var itemId = int.Parse(e.CommandArgument.ToString());
            var item = data.SitePages.Find(itemId);

            data.SitePages.Delete(item);
            data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage("Item Deleted Successfully");
            ErrorSuccessNotifier.ShowAfterRedirect = true;

            Response.Redirect(Request.RawUrl);
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            data = new DataProvider();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.GetItems().Count() > 0)
            {
                ShowPager();
            }
        }

        private void ShowPager()
        {
            DataPager pager = (DataPager)ItemsList.FindControl("ItemsPager");
            pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }
    }
}