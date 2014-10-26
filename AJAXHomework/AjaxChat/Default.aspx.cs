namespace AjaxChat
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    using AjaxChat.Models;

    public partial class Default : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ChatDbContext db = new ChatDbContext();

            ChatListView.DataSource = db.Messages.ToList();
            ChatListView.DataBind();

            if (ViewState["username"] != null)
            {
                this.Username.Text = ViewState["username"].ToString();
            }

            this.Message.Text = "";
        }

        protected void InsertButton_Command(object sender, CommandEventArgs e)
        {
            var username = this.Username.Text;
            var message = this.Message.Text;

            if (string.IsNullOrWhiteSpace(username))
            {
                return;
            }

            ViewState["username"] = username;

            ChatDbContext db = new ChatDbContext();

            db.Messages.Add(new Message()
            {
                Username = username,
                MessageText = message
            });

            db.SaveChanges();
        }
    }
}