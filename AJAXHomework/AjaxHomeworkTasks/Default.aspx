<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeesAndOrders.Default" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Employees and Orders </h3>
    <div class="row">
        <div class="col-md-12">
            <h5>Employees</h5>
            <div class="well bs-component">
                <asp:ScriptManager ID="ScriptManager" runat="server">
                </asp:ScriptManager>

                <asp:UpdatePanel ID="EmployeesUpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:GridView
                            ID="EmployeesGridView"
                            runat="server"
                            AutoGenerateColumns="False"
                            DataSourceID="EmployeesDataSource"
                            OnSelectedIndexChanged="EmployeesGridView_SelectedIndexChanged"
                            DataKeyNames="EmployeeID"
                            class="table table-striped table-hover">

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="EmployeeID" HeaderText="Id" SortExpression="EmployeeID" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="Courtesy Title" SortExpression="TitleOfCourtesy" />
                                <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" SortExpression="BirthDate" />
                                <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
                                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                <asp:BoundField DataField="HomePhone" HeaderText="Home Phone" SortExpression="HomePhone" />
                                <asp:BoundField DataField="Extension" HeaderText="Extension" SortExpression="Extension" />
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <hr />
    <div class="row">
        <div class="col-md-12">
            <h5>Orders</h5>
            <p>Click employee to see his/hers orders.</p>
            <div class="well bs-component">
                <asp:ObjectDataSource
                    ID="EmployeesDataSource"
                    runat="server"
                    SelectMethod="SelectEmployees"
                    TypeName="EmployeesAndOrders.EmployeesData" />

                <asp:UpdatePanel ID="OrdersUpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:GridView
                            ID="OrdersGridView"
                            runat="server"
                            AutoGenerateColumns="False"
                            class="table table-striped table-hover">

                            <Columns>
                                <asp:BoundField DataField="OrderID" HeaderText="Id" SortExpression="OrderID" />
                                <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
                                <asp:BoundField DataField="RequiredDate" HeaderText="Required Date" SortExpression="RequiredDate" />
                                <asp:BoundField DataField="ShippedDate" HeaderText="Shipped Date" SortExpression="ShippedDate" />
                                <asp:BoundField DataField="Freight" HeaderText="Freight" SortExpression="Freight" />
                                <asp:BoundField DataField="ShipName" HeaderText="Ship Name" SortExpression="ShipName" />
                                <asp:BoundField DataField="ShipAddress" HeaderText="Ship Address" SortExpression="ShipAddress" />
                                <asp:BoundField DataField="ShipCity" HeaderText="City" SortExpression="ShipCity" />
                                <asp:BoundField DataField="ShipPostalCode" HeaderText="Postal Code" SortExpression="ShipPostalCode" />
                                <asp:BoundField DataField="ShipCountry" HeaderText="Country" SortExpression="ShipCountry" />
                            </Columns>

                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:UpdateProgress
                    ID="OrdersUpdateProgress"
                    AssociatedUpdatePanelID="EmployeesUpdatePanel"
                    runat="server">

                    <ProgressTemplate>
                        <img width="50" src="/content/img/loading.gif" />
                    </ProgressTemplate>

                </asp:UpdateProgress>
            </div>
        </div>
    </div>
</asp:Content>
