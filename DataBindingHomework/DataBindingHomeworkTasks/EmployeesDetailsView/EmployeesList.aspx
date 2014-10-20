<%@ Page Title="Empoloyees List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="DataBindingHomeworkTasks.EmployeesDetailsView.EmployeesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Create a page Employees.aspx to display the names of all employees from Northwind database 
        in a GridView as hyperlinks. 
        
        All links should redirect to another page (e.g. EmpDetails.aspx?id=3) 
        where details about the employee are displayed in a DetailsView. 
        
        Add a back button to return back to the previous page.
    -->

    <h3>Employees List</h3>
    <div class="bs-component">
        <asp:GridView
            ID="employeesGridView"
            runat="server"
            AutoGenerateColumns="False"
            AllowPaging="True"
            DataKeyNames="EmployeeID"
            OnPageIndexChanging="EmployeesGridView_PageIndexChanging"
            class="table table-striped table-hover">

            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:HyperLinkField HeaderText="-" Text="Details" DataNavigateUrlFields="EmployeeID" DataNavigateUrlFormatString="EmpDetails.aspx?id={0}" />
            </Columns>

        </asp:GridView>
    </div>
</asp:Content>
