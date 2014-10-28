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

        public List()
        {
            this.data = new DataProvider();
        }

        public IQueryable<SitePage> GetItems()
        {
            return this.data.SitePages.All().OrderBy(x => x.Id);
        }

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var itemId = int.Parse(e.CommandArgument.ToString());
            var item = this.data.SitePages.Find(itemId);

            this.data.SitePages.Delete(item);
            this.data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage("Item Deleted Successfully");
            ErrorSuccessNotifier.ShowAfterRedirect = true;

            Response.Redirect(Request.RawUrl);
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.GetItems().Count() > 0)
            {
                this.ShowPager();
            }
        }

        private void ShowPager()
        {
            DataPager pager = (DataPager)this.ItemsList.FindControl("ItemsPager");
            pager.Visible = pager.PageSize < pager.TotalRowCount;
        }
    }
}