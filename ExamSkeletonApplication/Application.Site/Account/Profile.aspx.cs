using Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Application.Data;

namespace Application.Site.Account
{
    public partial class Profile : System.Web.UI.Page
    {
        private DataProvider data;

        public Profile()
        {
            this.data = new DataProvider();
        }

        public User Get_Data()
        {
            return this.data.Users.Find(User.Identity.GetUserId());
        }
    }
}