namespace DataBindingHomeworkTasks.EmployeesFormView
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
                this.FormViewEmployee.DataSource = databaseContext.Employees.ToList();
                this.FormViewEmployee.DataBind();
            }
        }

        protected void FormViewEmployees_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            this.FormViewEmployee.PageIndex = e.NewPageIndex;
            this.FormViewEmployee.DataSource = databaseContext.Employees.ToList();
            this.FormViewEmployee.DataBind();
        }
    }
}