<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="DataBindingHomeworkTasks.Repeater.EmployeesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Display the information about all employees a table in an ASPX page using a Repeater.
    -->
    <h3>Employees List</h3>
    <div class="bs-component">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Hire Date</th>
                    <th>Position</th>
                    <th>Home Phone</th>
                    <th>Country</th>
                </tr>
            </thead>
            <tbody>

                <asp:Repeater 
                    ID="EmployeesRepeater" 
                    runat="server" 
                    ItemType="NorthwindData.Employee">

                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.FirstName %></td>
                            <td><%#: Item.LastName %></td>
                            <td><%#: Item.HireDate %></td>
                            <td><%#: Item.Title %></td>
                            <td><%#: Item.HomePhone %></td>
                            <td><%#: Item.Country %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </tbody>
        </table>
    </div>
</asp:Content>
