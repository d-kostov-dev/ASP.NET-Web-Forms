using Application.Data;
using Application.Models;
using Application.Site.ViewModels;
using ErrorHandlerControl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site.Administration.Categories
{
    public partial class List : System.Web.UI.Page
    {
        private DataProvider data;

        public IQueryable<Category> GetItems()
        {
            return data.Categories
                .All()
                .OrderBy(x => x.Id);
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            data = new DataProvider();
            this.ItemsCountSelect.SelectedValue = "5";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.GetItems().Count() > 0)
            {
                ShowPager();
            }
        }

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var itemId = int.Parse(e.CommandArgument.ToString());
            var item = data.Categories.Find(itemId);

            data.Categories.Delete(item);
            data.SaveChanges();

            ErrorSuccessNotifier.AddSuccessMessage("Item Deleted Successfully");
            ErrorSuccessNotifier.ShowAfterRedirect = true;

            Response.Redirect(Request.RawUrl);
        }

        private void ShowPager()
        {
            DataPager pager = (DataPager)ItemsList.FindControl("ItemsPager");
            pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }

        protected void ChangeItems_PerPage(object sender, EventArgs e)
        {
            DataPager pager = (DataPager)ItemsList.FindControl("ItemsPager");
            pager.PageSize = int.Parse(this.ItemsCountSelect.SelectedValue);
            pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }
    }
}