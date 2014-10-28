namespace Application.Site.Administration.Towns
{
    using System;
    using System.Linq;

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

            if (!this.Page.IsPostBack)
            {
                this.Country.DataSource = this.data.Countries.All().ToList();
                this.Country.SelectedIndex = 0;
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                Town item;

                if (this.isNewItem)
                {
                    item = new Town();
                    this.data.Towns.Add(item);
                }
                else
                {
                    item = this.data.Towns.Find(this.itemId);
                }

                item.Name = this.Name.Text;
                item.Country = this.data.Countries.Find(int.Parse(this.Country.SelectedValue));

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
                Town item = this.data.Towns.Find(this.itemId);

                this.Name.Text = item.Name;
                this.Country.SelectedValue = item.Country.Id.ToString();
            }
        }
    }
}