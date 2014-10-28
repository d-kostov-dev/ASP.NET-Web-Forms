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

        public AddEdit()
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
            if (this.Page.IsValid)
            {
                SitePage item;

                if (this.isNewItem)
                {
                    item = new SitePage();
                    this.data.SitePages.Add(item);
                }
                else
                {
                    item = this.data.SitePages.Find(this.itemId);
                }

                item.Title = this.PageTitle.Text;
                item.Content = this.Content.Text;
                item.IsVisible = this.isVisibleSelect.SelectedValue == "0" ? false : true;

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
            if (!this.isNewItem)
            {
                SitePage item = this.data.SitePages.Find(this.itemId);

                this.PageTitle.Text = item.Title;
                this.Content.Text = item.Content;
            }
        }
    }
}