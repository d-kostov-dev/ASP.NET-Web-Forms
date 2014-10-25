using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.UserInfo
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LiteralOutput.Text += "Browser Type: " + Request.Browser.Type + "<hr />";

            this.LiteralOutput.Text += "<strong>REMOTE_ADDR	- Returns the IP address of the remote host making the request. <br /> Source - w3schools</strong><br />";
            
            this.LiteralOutput.Text += "Client IP Address: " + Request.ServerVariables["REMOTE_ADDR"];
            
        }
    }
}