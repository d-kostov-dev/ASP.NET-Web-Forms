namespace EmployeesAndOrders
{
    using System.Collections.Generic;
    using System.Linq;

    using NorthwindData;

    public class EmployeesData
    {
        NorthwindEntities databaseContext = new NorthwindEntities();

        public List<Employee> SelectEmployees()
        {
            var itemsFound = databaseContext.Employees.ToList();

            return itemsFound;
        }
    }
}