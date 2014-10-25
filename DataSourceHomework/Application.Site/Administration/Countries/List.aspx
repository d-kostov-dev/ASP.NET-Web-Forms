<%@ Page 
    Title="Countries List" 
    Language="C#" MasterPageFile="~/Administration/Admin.Master" 
    AutoEventWireup="true" 
    CodeBehind="List.aspx.cs" 
    Inherits="Application.Site.Administration.Countries.List" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="AdminContent" runat="server">
    <h3>Countries List</h3>
    <a href="AddEdit.aspx" class="btn btn-primary" role="button">Add New</a>
    <hr />
    <asp:ListView 
        ID="ItemsList"
        ItemPlaceholderID="ItemPlace"
        runat="server"
        SelectMethod="GetItems"
        ItemType="Application.Site.Models.CountryViewModel">

        <LayoutTemplate>
            <table class="table table-striped table-bordered table-hover">
                <tr runat="server">
                    <th runat="server">
                        <asp:LinkButton ID="byId" CommandArgument="id" CommandName="Sort" Text="Id" runat="server" />
                    </th>
                    <th runat="server">
                        <asp:LinkButton ID="byTitle" CommandArgument="name" CommandName="Sort" Text="Name" runat="server" />
                    </th>
                    <th runat="server">
                        <asp:LinkButton ID="byContinent" CommandArgument="continentName" CommandName="Sort" Text="Continent" runat="server" />
                    </th>
                    <th runat="server">
                        <asp:LinkButton ID="byPopulation" CommandArgument="population" CommandName="Sort" Text="Population" runat="server" />
                    </th>
                    <th runat="server">Flag</th>
                    <th runat="server">-</th>
                    <th runat="server">-</th>
                </tr>
                <tr runat="server" id="ItemPlace" />
            </table>

            <div class="row">
                <asp:DataPager 
                    ID="ItemsPager" 
                    runat="server" 
                    PagedControlID="ItemsList"
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

        <ItemTemplate>
            <tr runat="server">
            <td>
                <%#: Item.Id %>
            </td>
            <td>
                <%#: Item.Name %>
            </td>
                <td>
                <%#: Item.ContinentName %>
            </td>
            <td>
                <%#: Item.Population%>
            </td>
            <td>
                <img class="img-responsive" width="50" src="/Uploads/<%#: Item.Flag %>" />
            </td>
            <td>
                <a class="btn btn-primary btn-sm" href="AddEdit.aspx?itemId=<%#: Item.Id %>">Edit</a>
            </td>
            <td>
                <asp:LinkButton 
                    ID="deleteItem" 
                    runat="server" 
                    class="btn btn-danger btn-sm"
                    CommandName="Delete"
                    OnCommand="Delete_Item"
                    CommandArgument="<%# Item.Id %>"
                    OnClientClick = "return confirm('Are you sure you want to delete this item?');"
                    Text="Delete" />
            </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>     
</asp:Content>
