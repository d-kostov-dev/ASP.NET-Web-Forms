<%@ Page 
    Title="Add or Edit Item" 
    Language="C#" 
    MasterPageFile="~/Administration/Admin.Master" 
    AutoEventWireup="true" 
    CodeBehind="AddEdit.aspx.cs" 
    Inherits="Application.Site.Administration.SitePages.AddEdit" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="AdminContent" runat="server">
    <div class="col-md-8">
        <h3>Manage Item</h3>

        <hr />

        <div class="panel panel-default">

            <div class="panel-heading">
                Manage Item
            </div>

            <div class="panel-body">
                <div class="form-horizontal" id="mangeItemForm" runat="server">
                    <fieldset>
                        <div class="form-group">
                            <label for="PageTitle" class="col-lg-2 control-label">Page Title</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="PageTitle" class="form-control" runat="server" />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    CssClass="text-danger"
                                    ControlToValidate="PageTitle" 
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
                            <label for="isVisibleSelect" class="col-lg-2 control-label">Is Visible</label>
                            <div class="col-lg-10">
                                <asp:DropDownList ID="isVisibleSelect" class="form-control" runat="server">
                                    <asp:ListItem Value="0">No</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="ButtonSubmit" runat="server" class="btn btn-primary" Text="Submit" OnClick="ButtonSubmit_Click" />
                                <a href="List.aspx" class="btn btn-default" role="button">Cancel</a>
                            </div>
                        </div>
                    </fieldset>
                </div><%--Form Div End--%>
            </div><%--Panel Body End--%>

        </div>
    </div>
</asp:Content>
