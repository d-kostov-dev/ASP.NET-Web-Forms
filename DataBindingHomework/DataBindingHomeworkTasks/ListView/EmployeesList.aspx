<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="DataBindingHomeworkTasks.ListView.EmployeesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Re-implement the previous using ListView.
    -->
    <h3>Employees List</h3>
    <div class="bs-component">
        <asp:DataPager 
            ID="DataPager1" 
            runat="server"
            PagedControlID="ListViewEmployees" 
            PageSize="3"
            QueryStringField="page"
            class="btn-group">

            <Fields>
                <asp:NextPreviousPagerField 
                    ShowFirstPageButton="true"
                    ShowNextPageButton="false" 
                    ShowPreviousPageButton="false" />
                <asp:NumericPagerField />

                <asp:NextPreviousPagerField 
                    ShowLastPageButton="true"
                    ShowNextPageButton="false" 
                    ShowPreviousPageButton="false" />
            </Fields>

        </asp:DataPager>
        <hr />
        <asp:ListView 
            ID="ListViewEmployees" 
            runat="server"
            ItemType="NorthwindData.Employee">

            <ItemTemplate>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Employee Profile</h3>
                    </div>
                    <div class="panel-body">
                        <div class="bs-component">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    Position: <%#: Item.Title %>
                                </li>
                                <li class="list-group-item">
                                    First Name: <%#: Item.FirstName %>
                                </li>
                                <li class="list-group-item">
                                    Last Name: <%#: Item.LastName %>
                                </li>
                                <li class="list-group-item">
                                    Hire Date: <%#: Item.HireDate %>
                                </li>
                                <li class="list-group-item">
                                    Home Phone: <%#: Item.HomePhone %>
                                </li>
                                <li class="list-group-item">
                                    Country: <%#: Item.Country %>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:ListView>

        <hr />

        <asp:DataPager 
            ID="DataPagerCustomers" 
            runat="server"
            PagedControlID="ListViewEmployees" 
            PageSize="3"
            QueryStringField="page"
            class="btn-group">

            <Fields>
                <asp:NextPreviousPagerField 
                    ShowFirstPageButton="true"
                    ShowNextPageButton="false" 
                    ShowPreviousPageButton="false" />
                <asp:NumericPagerField />

                <asp:NextPreviousPagerField 
                    ShowLastPageButton="true"
                    ShowNextPageButton="false" 
                    ShowPreviousPageButton="false" />
            </Fields>

        </asp:DataPager>
    </div>
</asp:Content>
