<%@ Page Title="Categories List" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Application.Site.Administration.Categories.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <h3>Categories List</h3>
    <a href="AddEdit.aspx" class="btn btn-primary" role="button">Add New</a>
    <hr />

    <label for="ItemsCountSelect" class="control-label">Items per page:</label>
    <asp:DropDownList ID="ItemsCountSelect" runat="server" onselectedindexchanged="ChangeItems_PerPage" AutoPostBack="true">
        <asp:ListItem Value="1">1</asp:ListItem>
        <asp:ListItem Value="2">2</asp:ListItem>
        <asp:ListItem Value="3">3</asp:ListItem>
        <asp:ListItem Value="4">4</asp:ListItem>
    </asp:DropDownList>

    <asp:ListView
        ID="ItemsList"
        ItemPlaceholderID="ItemPlace"
        runat="server"
        SelectMethod="GetItems"
        ItemType="Application.Models.Category">

        <LayoutTemplate>
            <table class="table table-striped table-bordered table-hover">
                <tr runat="server">
                    <th runat="server">
                        <asp:LinkButton ID="byId" CommandArgument="id" CommandName="Sort" Text="Id" runat="server" />
                    </th>
                    <th runat="server">
                        <asp:LinkButton ID="byTitle" CommandArgument="name" CommandName="Sort" Text="Name" runat="server" />
                    </th>
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
                    PageSize='1'
                    class="btn-group">

                    <Fields>
                        <asp:NextPreviousPagerField
                            ShowFirstPageButton="true"
                            ShowNextPageButton="false"
                            ShowPreviousPageButton="false"
                            ButtonCssClass="btn btn-primary" />

                        <asp:NumericPagerField
                            CurrentPageLabelCssClass="btn btn-default"
                            NumericButtonCssClass="btn btn-primary" />

                        <asp:NextPreviousPagerField
                            ShowLastPageButton="true"
                            ShowNextPageButton="false"
                            ShowPreviousPageButton="false"
                            ButtonCssClass="btn btn-primary" />
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
                        OnClientClick="return confirm('Are you sure you want to delete this item?');"
                        Text="Delete" />
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
