<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemsPerPage.ascx.cs" Inherits="Application.Site.Controls.ItemsPerPage.ItemsPerPAge" %>

<label for="ItemsCountSelect" class="control-label">Items per page:</label>
<asp:DropDownList ID="ItemsCountSelect" runat="server" OnSelectedIndexChanged="ChangeItems_PerPage" AutoPostBack="true">
</asp:DropDownList>

<%--<asp:ListItem Value="1">1</asp:ListItem>
<asp:ListItem Value="2">2</asp:ListItem>
<asp:ListItem Value="3">3</asp:ListItem>
<asp:ListItem Value="4">4</asp:ListItem>--%>