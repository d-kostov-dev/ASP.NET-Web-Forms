using Application.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;

using Application.Models;


namespace Application.Site
{
    public partial class _Default : Page
    {
        private DataProvider data;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.data = new DataProvider();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.ChatMessages.DataSource = this.data.ChatMessages.All().ToList();
            this.ChatMessages.DataBind();
        }

        protected void MessageSend_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var userId = User.Identity.GetUserId();

                var newMessage = new ChatMessage()
                {
                    Author = data.Users.Find(userId),
                    Message = ((TextBox)this.loginView.FindControl("Message")).Text
                };

                data.ChatMessages.Add(newMessage);
                data.SaveChanges();

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}