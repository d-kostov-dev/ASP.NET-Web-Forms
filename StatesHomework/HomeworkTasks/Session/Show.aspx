<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="HomeworkTasks.Session.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Save text in session</h3>

    <div class="well bs-component">
        <asp:Label ID="SessionText" runat="server" Text=""></asp:Label>
    </div>

     <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="inputText" class="col-lg-2 control-label">Enter Any Text</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="inputText" class="form-control" placeholder="Any Text" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="ButtonGetText" runat="server" class="btn btn-primary" Text="Submit" OnClick="Button_GetText" />
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
