<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesList.aspx.cs" Inherits="DataBindingHomeworkTasks.EmployeesFormView.EmployeesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Implement the previous task in a single ASPX page by using a FormView instead of DetailsView.
    -->
    <h3>Employees List</h3>
    <div class="bs-component">

        <asp:FormView 
            ID="FormViewEmployee" 
            runat="server" 
            AllowPaging="True" 
            onpageindexchanging="FormViewEmployees_PageIndexChanging"
            ItemType="NorthwindData.Employee">

            <ItemTemplate>
                <div class="bs-component">
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
                </div>
            </ItemTemplate>

            <PagerTemplate>
                <table>
                <tr>
                    <td><asp:LinkButton class="btn btn-primary" ID="PrevButton"  CommandName="Page" CommandArgument="Prev"  Text="< Prev"  RunAt="server"/></td>
                    <td><asp:LinkButton class="btn btn-primary" ID="NextButton"  CommandName="Page" CommandArgument="Next"  Text="Next >"  RunAt="server"/></td>
                </tr>
                </table>
            </PagerTemplate>

        </asp:FormView>
    </div>
</asp:Content>
