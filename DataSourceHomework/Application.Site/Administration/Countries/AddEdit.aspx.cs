namespace Application.Site.Administration.Countries
{
    using System;
    using System.Web.UI;
    using System.Linq;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;
    using System.IO;
    
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

            if (!Page.IsPostBack)
            {
                this.Continent.DataSource = data.Continents.All().ToList();
                this.Continent.SelectedIndex = 0;
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Country item;

                if (isNewItem)
                {
                    item = new Country();
                    data.Countries.Add(item);
                }
                else
                {
                    item = data.Countries.Find(this.itemId);
                }

                item.Name = this.Name.Text;
                item.Population = int.Parse(this.Population.Text);
                item.Continent = data.Continents.Find(int.Parse(this.Continent.SelectedValue));

                if (this.Flag.HasFile)
                {
                    string filename = Path.GetFileName(this.Flag.FileName);
                    this.Flag.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    item.Flag = filename;
                }
                else
                {
                    item.Flag = "defflag.png";
                }

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
            this.DataBind();

            if (!isNewItem)
            {
                Country item = data.Countries.Find(itemId);

                this.Name.Text = item.Name;
                this.Population.Text = item.Population.ToString();
                this.Continent.SelectedValue = item.Continent.Id.ToString();
            }
        }
    }
}