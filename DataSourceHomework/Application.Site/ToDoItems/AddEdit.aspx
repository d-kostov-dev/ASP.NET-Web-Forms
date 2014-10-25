<%@ Page Title="Add or Edit To Do Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEdit.aspx.cs" Inherits="Application.Site.ToDoItems.AddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-8">
        <h3>Edit Item</h3>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">
                Manage Item
            </div>
            <div class="panel-body">
                <div class="form-horizontal" id="mangeItemForm" runat="server">
                    <fieldset>
                        <div class="form-group">
                            <label for="ItemTitle" class="col-lg-2 control-label">Title</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="ItemTitle" class="form-control" runat="server" />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    CssClass="text-danger"
                                    ControlToValidate="ItemTitle" 
                                    ErrorMessage="The Field Is Required!" 
                                    Display="Dynamic"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Content" class="col-lg-2 control-label">Content</label>
                            <div class="col-lg-10">
                                <asp:TextBox  TextMode="multiline" ID="Content" Rows="5" class="form-control"  runat="server" />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    CssClass="text-danger"
                                    ControlToValidate="Content" 
                                    ErrorMessage="The Field Is Required!" 
                                    Display="Dynamic"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Category" class="col-lg-2 control-label">Category</label>
                            <div class="col-lg-10">
                                <asp:DropDownList ID="Category" class="form-control" runat="server" DataTextField="Name" DataValueField="Id" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="ButtonSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="ButtonSubmit_Click" />
                                <a href="List.aspx" class="btn btn-default" role="button">Cancel</a>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
