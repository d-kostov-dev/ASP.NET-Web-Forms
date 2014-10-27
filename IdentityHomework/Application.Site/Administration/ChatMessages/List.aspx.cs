using Application.Data;
using Application.Models;
using ErrorHandlerControl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using Owin;
using Microsoft.AspNet.Identity.Owin;

namespace Application.Site.Administration.ChatMessages
{
    public partial class List : System.Web.UI.Page
    {
        private DataProvider data;

        public IQueryable<ChatMessage> GetItems()
        {
            return data.ChatMessages.All().Include(x => x.Author).OrderBy(x => x.Id);
        }

        protected void Delete_Item(object sender, CommandEventArgs e)
        {
            var userId = User.Identity.GetUserId();
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            if (manager.IsInRole(userId, "Administrator"))
            {
                var itemId = int.Parse(e.CommandArgument.ToString());
                var item = data.ChatMessages.Find(itemId);

                data.ChatMessages.Delete(item);
                data.SaveChanges();

                ErrorSuccessNotifier.AddSuccessMessage("Item Deleted Successfully");
                ErrorSuccessNotifier.ShowAfterRedirect = true;
            }
            else
            {
                ErrorSuccessNotifier.AddErrorMessage("Only admins can delete messages!");
                ErrorSuccessNotifier.ShowAfterRedirect = true;
            }
            
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