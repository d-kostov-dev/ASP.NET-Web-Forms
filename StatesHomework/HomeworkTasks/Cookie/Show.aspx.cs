using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.Cookie
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["LoginData"];
            if (cookie != null)
            {
                this.CookieInfo.Text = cookie.Value;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}