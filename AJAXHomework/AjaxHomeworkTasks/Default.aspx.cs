namespace EmployeesAndOrders
{
    using System;
    using System.Linq;
    using System.Threading;
    using System.Web.UI.WebControls;

    using NorthwindData;

    public partial class Default : System.Web.UI.Page
    {
        protected void EmployeesGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Thread.Sleep(2000);

            GridView employeesGridView = (GridView)sender;
            var value = Convert.ToInt32(employeesGridView.SelectedValue);

            NorthwindEntities databaseContext = new NorthwindEntities();

            this.OrdersGridView.DataSource = databaseContext.Orders
                                        .Where(x => x.EmployeeID == value)
                                        .ToList();

            this.OrdersGridView.DataBind();
        }
    }
}