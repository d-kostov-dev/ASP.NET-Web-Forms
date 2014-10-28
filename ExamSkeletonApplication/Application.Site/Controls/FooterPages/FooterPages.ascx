<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterPages.ascx.cs" Inherits="Application.Site.Controls.FooterPages.FooterPages" %>

<asp:Repeater
    ID="PagesList"
    runat="server"
    ItemType="Application.Models.SitePage">

    <ItemTemplate>
        <a href="/ShowPage.aspx?pageId=<%#: Item.Id %>"><%#: Item.Title %></a>&nbsp;&nbsp;
    </ItemTemplate>

</asp:Repeater>
