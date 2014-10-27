namespace Application.Site.Administration.ChatMessages
{
    using System;
    using System.Web.UI;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;

    using Microsoft.AspNet.Identity;
    
    public partial class AddEdit : Page
    {
        private bool isNewItem = false;
        private int itemId;
        private DataProvider data;

        protected void Page_Init(object sender, EventArgs e)
        {
            data = new DataProvider();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.itemId = Convert.ToInt32(Request.Params["itemId"]);
            isNewItem = (this.itemId == 0);
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ChatMessage item;

                if (isNewItem)
                {
                    item = new ChatMessage();
                    data.ChatMessages.Add(item);
                    item.Author = this.data.Users.Find(User.Identity.GetUserId());
                }
                else
                {
                    item = data.ChatMessages.Find(this.itemId);
                }

                item.Message = this.Message.Text;

                try
                {
                    data.SaveChanges();
                    ErrorSuccessNotifier.AddSuccessMessage("Item Added Successfully");
                    ErrorSuccessNotifier.ShowAfterRedirect = true;
                    Response.Redirect("List.aspx", false);
                }
                catch (Exception ex)
                {
                    ErrorSuccessNotifier.AddErrorMessage(ex);
                }

            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!isNewItem)
            {
                ChatMessage item = data.ChatMessages.Find(itemId);

                this.Message.Text = item.Message;
            }
        }
    }
}