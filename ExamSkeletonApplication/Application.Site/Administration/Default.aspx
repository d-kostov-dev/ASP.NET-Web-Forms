<%@ Page Title="Admin Home" 
    Language="C#" 
    MasterPageFile="~/Administration/Admin.Master" 
    AutoEventWireup="true" 
    CodeBehind="Default.aspx.cs" 
    Inherits="Application.Site.Administration.Default" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="AdminContent" runat="server">
    <h3>Admin Panel Home</h3>
    <div class="jumbotron">
        <p>Select items to manage from the sidebar menu.</p>
    </div>
</asp:Content>
