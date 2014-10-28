using Application.Data;
using Application.Models;
using ErrorHandlerControl;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Application.Site.Administration.Countries
{
    public partial class AddEdit : System.Web.UI.Page
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

                if (this.Flag.HasFile)
                {
                    string filename = Path.GetFileName(this.Flag.FileName);
                    this.Flag.SaveAs(Server.MapPath("~/Content/flags/") + filename);
                    item.Flag = filename;
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
            }
        }
    }
}