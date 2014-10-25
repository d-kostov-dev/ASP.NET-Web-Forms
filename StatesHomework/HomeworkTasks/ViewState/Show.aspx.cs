using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.ViewState
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (ViewState["values"] == null)
            {
                ViewState.Add("values", new List<string>());
            }
        }

        protected void Print_Input(object sender, EventArgs e)
        {
            var list = (List<string>)ViewState["values"];
            list.Add(this.TextBox.Text);

            this.Label.Text = "";

            foreach (var item in list)
            {
                Label.Text += "<br/>" + item;
            }

            TextBox.Text = "";
        }
    }
}