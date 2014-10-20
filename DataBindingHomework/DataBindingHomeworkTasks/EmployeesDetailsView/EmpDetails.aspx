<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="DataBindingHomeworkTasks.EmployeesDetailsView.EmpDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Employee Details</h3>
    <asp:DetailsView 
        ID="employeeDetails" 
        runat="server" 
        AutoGenerateRows="true" 
        AllowPaging="True"
        class="table table-striped table-hover">
    </asp:DetailsView>
    <a href="EmployeesList.aspx" class="btn btn-primary">Back</a>
</asp:Content>
