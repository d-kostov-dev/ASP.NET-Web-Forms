<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="HomeworkTasks.UserInfo.Show" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>User Info</h3>
     <%--Create anASP.NET Web Form, which prints the type of the browser and the client IP address requested .aspx page.--%>     <div class="well bs-component">
         <asp:Literal ID="LiteralOutput" runat="server" />
     </div>
</asp:Content>
