namespace DataBindingHomeworkTasks.ListView
{
    using System;
    using System.Linq;
    using System.Web.UI;

    using NorthwindData;

    public partial class EmployeesList : System.Web.UI.Page
    {
        private static NorthwindEntities databaseContext;

        protected void Page_Init(object sender, EventArgs e)
        {
            databaseContext = new NorthwindEntities();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ListViewEmployees.DataSource = databaseContext.Employees.ToList();
                this.ListViewEmployees.DataBind();
            }
        }
    }
}