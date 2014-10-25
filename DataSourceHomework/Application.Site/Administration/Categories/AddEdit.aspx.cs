namespace Application.Site.Administration.Categories
{
    using System;
    using System.Web.UI;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;
    
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
                Category item;

                if (isNewItem)
                {
                    item = new Category();
                    data.Categories.Add(item);
                }
                else
                {
                    item = data.Categories.Find(this.itemId);
                }

                item.Name = this.Name.Text;

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
                Category item = data.Categories.Find(itemId);

                this.Name.Text = item.Name;
            }
        }
    }
}