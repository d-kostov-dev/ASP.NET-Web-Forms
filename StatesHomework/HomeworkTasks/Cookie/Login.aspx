<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HomeworkTasks.Cookie.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Log In</h3>
    <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="Username" class="col-lg-2 control-label">Username</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="Username" class="form-control" placeholder="Username" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="Password" class="col-lg-2 control-label">Password</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="Password" type="password" class="form-control" placeholder="Password" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="LoginButton" runat="server" class="btn btn-primary" Text="Submit" OnClick="Button_LogIn" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
