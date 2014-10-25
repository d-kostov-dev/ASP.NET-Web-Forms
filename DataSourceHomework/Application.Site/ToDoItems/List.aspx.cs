using Application.Data;
using Application.Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site.ToDoItems
{
    public partial class List : System.Web.UI.Page
    {
        private DataProvider data;

        public IQueryable<ToDoItemViewModel> GetItems()
        {
            return data.ToDoItems
                .All()
                .OrderBy(x => x.Id)
                .Select(ToDoItemViewModel.ViewModel); // This is not required but i want to be able to sort by child property :)
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

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var itemId = int.Parse(e.CommandArgument.ToString());
            var item = data.ToDoItems.Find(itemId);

            data.ToDoItems.Delete(item);
            data.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }

        private void ShowPager()
        {
            DataPager pager = (DataPager)ItemsList.FindControl("ItemsPager");
            pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }
    }
}