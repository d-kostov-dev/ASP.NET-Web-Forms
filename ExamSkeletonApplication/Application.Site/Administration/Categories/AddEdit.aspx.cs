namespace Application.Site.Administration.Categories
{
    using System;
    using System.Web.UI;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;
    
    public partial class AddEdit : System.Web.UI.Page
    {
        private bool isNewItem = false;
        private int itemId;
        private DataProvider data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new DataProvider();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.itemId = Convert.ToInt32(Request.Params["itemId"]);
            this.isNewItem = this.itemId == 0;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Category item;

                if (this.isNewItem)
                {
                    item = new Category();
                    this.data.Categories.Add(item);
                }
                else
                {
                    item = this.data.Categories.Find(this.itemId);
                }

                item.Name = this.Name.Text;

                try
                {
                    this.data.SaveChanges();

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
            this.DataBind();

            if (!this.isNewItem)
            {
                Category item = this.data.Categories.Find(this.itemId);

                this.Name.Text = item.Name;
            }
        }
    }
}