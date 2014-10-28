namespace Application.Site.Administration.Towns
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    using Application.Data;
    using Application.Site.ViewModels;

    using ErrorHandlerControl;
    
    public partial class List : System.Web.UI.Page
    {
        private DataProvider data;

        public IQueryable<TownViewModel> GetItems()
        {
            return this.data.Towns
                .All()
                .OrderBy(x => x.Id)
                .Select(TownViewModel.ViewModel); // This is not required but i want to be able to sort by child property
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
            var item = this.data.Towns.Find(itemId);

            this.data.Towns.Delete(item);
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