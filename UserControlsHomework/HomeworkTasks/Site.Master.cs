namespace HomeworkTasks
{
    using System;

    public partial class Index : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuItem[] menuItems = { new MenuItem("Home", "Default.aspx"), 
                                       new MenuItem("About", "About.aspx"),
                                       new MenuItem("Contact us", "ContactUs.aspx")};

            this.LinksMenu.FontFamily = "Open Sans";
            this.LinksMenu.FontColor = "#008cba";
            this.LinksMenu.DataSource = menuItems;
            this.LinksMenu.DataBind();
        }
    }
}