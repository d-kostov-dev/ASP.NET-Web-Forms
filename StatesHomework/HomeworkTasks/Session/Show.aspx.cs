using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.Session
{
    public partial class Show : System.Web.UI.Page
    {
        private static IList<string> inputData;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Text"] != null)
            {
                var sessionData = Session["Text"].ToString();
                inputData = sessionData.Split(',').ToList();
            }
            else
            {
                inputData = new List<string>();
            }
        }

        protected void Button_GetText(object sender, EventArgs e)
        {
            inputData.Add(this.inputText.Text);
            Session["Text"] = string.Join(",", inputData);
            this.inputText.Text = "";

            // Fiexes the resubmission
            Response.Redirect(Request.RawUrl);
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["Text"] != null)
            {
                var sessionData = Session["Text"].ToString();
                var dataText = sessionData.Split(',').ToList();
                this.SessionText.Text = "";

                for (int i = 0; i < dataText.Count; i++)
                {
                    this.SessionText.Text += dataText[i] + "<br />";
                }
            }
        }
    }
}