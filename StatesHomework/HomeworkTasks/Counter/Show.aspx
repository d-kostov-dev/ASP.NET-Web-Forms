<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="HomeworkTasks.Counter.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Image Counter</h3>
    <div id="counterDiv" runat="server" class="well bs-component">
        <button class="btn btn-primary">Refresh Page</button>
    </div>
</asp:Content>
