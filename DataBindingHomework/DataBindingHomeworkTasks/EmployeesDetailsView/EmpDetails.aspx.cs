namespace DataBindingHomeworkTasks.EmployeesDetailsView
{
    using System;
    using System.Linq;

    using NorthwindData;

    public partial class EmpDetails : System.Web.UI.Page
    {
        private static NorthwindEntities databaseContext;

        protected void Page_Init(object sender, EventArgs e)
        {
            databaseContext = new NorthwindEntities();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] == null)
            {
                Response.Redirect("EmployeesList.aspx");
            }

            var itemId = int.Parse(Request.Params["id"]);

            this.employeeDetails.DataSource = databaseContext.Employees
                .Where(x => x.EmployeeID == itemId)
                .ToList();

            this.employeeDetails.DataBind();
        }
    }
}