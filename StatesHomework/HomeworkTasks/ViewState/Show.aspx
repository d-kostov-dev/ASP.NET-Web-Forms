<%@ Page Title="Delete Viewstate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="HomeworkTasks.ViewState.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Delete Viewstate</h3>
    <p><strong>*NOTE: </strong> The error is expected!</p>

    <div id="deleteState" class="well bs-component">
        <asp:TextBox ID="TextBox" runat="server"></asp:TextBox>

        <hr />

        <asp:Button class="btn btn-primary" OnClick="Print_Input" runat="server" Text="Submit" />
        <button class="btn btn-danger" id="delete-viewstate" >Delete ViewState</button>

        <asp:Label ID="Label" runat="server"></asp:Label>
    </div>

    <script>
        $(document).ready(
            $("#deleteState").on("click", "#delete-viewstate", function () {
                $("#__VIEWSTATE").val("");
            })
        );
    </script>
</asp:Content>
