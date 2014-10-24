namespace Application.Site.Administration.SitePages
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
                SitePage item;

                if (isNewItem)
                {
                    item = new SitePage();
                    data.SitePages.Add(item);
                }
                else
                {
                    item = data.SitePages.Find(this.itemId);
                }

                item.Title = this.PageTitle.Text;
                item.Content = this.Content.Text;
                item.IsVisible = this.isVisibleSelect.SelectedValue == "0" ? false : true;

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
                SitePage item = data.SitePages.Find(itemId);

                this.PageTitle.Text = item.Title;
                this.Content.Text = item.Content;
            }
        }
    }
}