<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Application.Site._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Data Source Controls Homework</h3>
    <p>You can manage the Continents/Countries/Towns data from the admin panel. Read <a href="ShowPage.aspx?pageId=2">FAQ</a></p>

    <ef:EntityDataSource 
        runat="server" 
        ID="ContinentsData"
        EntitySetName="Continents"
        OnContextCreating="Get_Data"
        EnableFlattening="false">
    </ef:EntityDataSource>

    <h4>Continents</h4>
    <asp:ListBox 
        ID="ListBoxContinents" 
        runat="server" 
        DataSourceID="ContinentsData" 
        DataTextField="Name" 
        DataValueField="Id" 
        AutoPostBack="true">
    </asp:ListBox>

    <hr />

    <ef:EntityDataSource
        runat="server" 
        ID="CountriesData" 
        EntitySetName="Countries" 
        OnContextCreating="Get_Data"
        EnableFlattening="false"
        Where="it.Continent.Id=@continentId">

        <WhereParameters>
            <asp:ControlParameter Name="continentId" Type="Int32"
                ControlID="ListBoxContinents" />
        </WhereParameters>

    </ef:EntityDataSource>

    <h4>Countries</h4>
    <asp:GridView 
        ID="GridViewCountries" 
        runat="server" 
        DataSourceID="CountriesData"
        AutoGenerateColumns="False" 
        DataKeyNames="Id"
        AllowPaging="True" 
        AllowSorting="True"
        class="table table-striped table-hover">

        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="CountryFlag" runat="server" ImageUrl='<%# "/Uploads/"+ Eval("Flag") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <h4>Towns</h4>

    <ef:EntityDataSource
        runat="server"
        ID="TownsData" 
        EntitySetName="Towns" 
        OnContextCreating="Get_Data"
        Where="it.Country.Id=@OcountryId" 
        EnableFlattening="False">

        <WhereParameters>
            <asp:ControlParameter Name="OcountryId" Type="Int32"
                ControlID="GridViewCountries" />
        </WhereParameters>

    </ef:EntityDataSource>

    <asp:ListView 
        id="ListViewTowns" 
        runat="server"
        DataSourceID="TownsData"
        ItemPlaceholderID="ItemPlace">

        <ItemTemplate>
            <tr runat="server">
                <td>
                    <%#: Eval("Id") %>
                </td>
                <td>
                    <%#: Eval("Name") %>
                </td>
                <td>
                    <%#: Eval("Population")%>
                </td>
            </tr>
        </ItemTemplate>

        <LayoutTemplate>

            <table class="table table-striped table-bordered table-hover">
                <tr runat="server">
                    <th runat="server">Id</th>
                    <th runat="server">Name</th>
                    <th runat="server">Population</th>
                </tr>
                <tr runat="server" id="ItemPlace" />
            </table>

            <div class="row">
                <asp:DataPager 
                    ID="ItemsPager" 
                    runat="server" 
                    PagedControlID="ListViewTowns"
                    PageSize="1"
                    class="btn-group">

                    <Fields>
                        <asp:NextPreviousPagerField 
                            ShowFirstPageButton="true"
                            ShowNextPageButton="false" 
                            ShowPreviousPageButton="false" 
                            ButtonCssClass="btn btn-primary"/>

                        <asp:NumericPagerField 
                            CurrentPageLabelCssClass="btn btn-default"
                            NumericButtonCssClass="btn btn-primary"/>

                        <asp:NextPreviousPagerField 
                            ShowLastPageButton="true"
                            ShowNextPageButton="false" 
                            ShowPreviousPageButton="false" 
                            ButtonCssClass="btn btn-primary"/>
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>

      </asp:ListView>
</asp:Content>
