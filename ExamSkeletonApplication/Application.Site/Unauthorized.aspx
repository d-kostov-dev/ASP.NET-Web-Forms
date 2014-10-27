<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Unauthorized.aspx.cs"
    Inherits="Application.Site.Unauthorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-offset-3 col-md-6 text-center">
        <h1 style="color: red">ACCESS DENIED</h1>
        <img class="img-responsive center-block" src="/Content/img/excuseme.jpg" />
        <br />
        <a href="/" class="btn btn-primary btn-block btn-sm">Back To Home</a>
    </div>
</asp:Content>
