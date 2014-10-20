namespace DataBindingHomeworkTasks.EmployeesDetailsView
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;

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
                this.employeesGridView.DataSource = databaseContext.Employees.ToList();
                this.employeesGridView.DataBind();
            }
        }

        protected void EmployeesGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.employeesGridView.PageIndex = e.NewPageIndex;
            this.employeesGridView.DataSource = databaseContext.Employees.ToList();
            this.employeesGridView.DataBind();
        }
    }
}