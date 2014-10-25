using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.Cookie
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Button_LogIn(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("LoginData", "User: " + this.Username.Text + " - Password: " + this.Password.Text);

            cookie.Expires = DateTime.Now.AddMinutes(1);

            Response.Cookies.Add(cookie);
            Response.Redirect("Show.aspx");
        }
    }
}