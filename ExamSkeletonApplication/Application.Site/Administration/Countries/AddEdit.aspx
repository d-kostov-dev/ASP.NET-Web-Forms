<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/Admin.Master" AutoEventWireup="true" CodeBehind="AddEdit.aspx.cs" Inherits="Application.Site.Administration.Countries.AddEdit" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="AdminContent" runat="server">
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
                            <label for="Name" class="col-lg-2 control-label">Name</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="Name" class="form-control" runat="server" />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    CssClass="text-danger"
                                    ControlToValidate="Name" 
                                    ErrorMessage="The Field Is Required!" 
                                    Display="Dynamic"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="Flag" class="col-lg-2 control-label">Flag</label>
                            <div class="col-lg-10">
                                <asp:FileUpload ID="Flag" runat="server" />
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
