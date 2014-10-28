namespace Application.Site.Administration.Categories
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;

    public partial class List : System.Web.UI.Page
    {
        private DataProvider data;

        public IQueryable<Category> GetItems()
        {
            return this.data.Categories
                .All()
                .OrderBy(x => x.Id);
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new DataProvider();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.GetItems().Count() > 0)
            {
                this.ShowPager();
            }
        }

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var itemId = int.Parse(e.CommandArgument.ToString());
            var item = this.data.Categories.Find(itemId);

            this.data.Categories.Delete(item);
            this.data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage("Item Deleted Successfully");
            ErrorSuccessNotifier.ShowAfterRedirect = true;

            Response.Redirect(Request.RawUrl);
        }

        private void ShowPager()
        {
            DataPager pager = (DataPager)this.ItemsList.FindControl("ItemsPager");
            pager.Visible = pager.PageSize < pager.TotalRowCount;
        }
    }
}