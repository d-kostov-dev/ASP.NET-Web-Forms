namespace DataBindingHomeworkTasks.CarsSearch
{
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Web.UI;

    public partial class CarsSearch : System.Web.UI.Page
    {
        private static IList<Manufacturer> manufacturers;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.selectedSearch.Visible = false;

            if (!Page.IsPostBack)
            {
                manufacturers = this.GetManufacturers();
                this.make.DataSource = manufacturers;
                this.make.SelectedIndex = 0;
                this.model.DataSource = manufacturers[0].Models;

                var engines = new[]
                {
                    new { Id = 1, Name = "Gasoline" },
                    new { Id = 1, Name = "Diesel" },
                    new { Id = 1, Name = "Electric" },
                    new { Id = 1, Name = "Hybrid" },
                };

                this.engine.DataSource = engines;

                var extrasList = new[]
                {
                    new { Id = 1, Name = "Windows" },
                    new { Id = 1, Name = "Tires" },
                    new { Id = 1, Name = "Doors" },
                    new { Id = 1, Name = "Alarm" },
                    new { Id = 1, Name = "Engine" },
                };

                this.extras.DataSource = extrasList;
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            this.searchForm.Visible = false;
            this.selectedSearch.Visible = true;

            StringBuilder resultingSearch = new StringBuilder();
            resultingSearch.Append("<p>" + this.make.SelectedItem.Text + "</p>");
            resultingSearch.Append("<p>" + this.model.SelectedItem.Text + "</p>");
            resultingSearch.Append("<p>" + this.engine.SelectedItem.Text + "</p>");
            resultingSearch.Append("<p>Extras: </p>");

            for (int i = 0; i < this.extras.Items.Count; i++)
            {
                var currentItem = this.extras.Items[i];

                if (currentItem.Selected)
                {
                    resultingSearch.Append("<p> - " + currentItem.Text + "</p>");
                }
            }

            this.searchData.Text = resultingSearch.ToString();
        }

        protected void Make_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.model.DataSource = manufacturers[this.make.SelectedIndex].Models;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.DataBind();
        }

        private IList<Manufacturer> GetManufacturers()
        {
            var listOfManufacturers = new List<Manufacturer>();

            var mercedes = new Manufacturer("Mercedes");
            mercedes.Models.Add("A Class");
            mercedes.Models.Add("C Class");
            mercedes.Models.Add("E Class");
            mercedes.Models.Add("S Class");
            listOfManufacturers.Add(mercedes);

            var opel = new Manufacturer("Opel");
            opel.Models.Add("Corsa");
            opel.Models.Add("Kadet");
            opel.Models.Add("Astra");
            opel.Models.Add("Omega");
            listOfManufacturers.Add(opel);

            var peugeot = new Manufacturer("Peugeot");
            peugeot.Models.Add("206");
            peugeot.Models.Add("306");
            peugeot.Models.Add("406");
            peugeot.Models.Add("607");
            listOfManufacturers.Add(peugeot);

            return listOfManufacturers;
        }
    }
}