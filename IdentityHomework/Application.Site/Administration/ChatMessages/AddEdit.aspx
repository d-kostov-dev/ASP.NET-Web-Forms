<%@ Page 
    Title="" 
    Language="C#" 
    MasterPageFile="~/Administration/Admin.Master" 
    AutoEventWireup="true" 
    CodeBehind="AddEdit.aspx.cs" 
    Inherits="Application.Site.Administration.ChatMessages.AddEdit" %>

<asp:Content ID="AdminContent" ContentPlaceHolderID="AdminContent" runat="server">
    <div class="col-md-8">
        <h3>Manage Message</h3>
        <hr />
        <div class="panel panel-default">
            <div class="panel-heading">
                Manage Message
            </div>
            <div class="panel-body">
                <div class="form-horizontal" id="mangeItemForm" runat="server">
                    <fieldset>
                        <div class="form-group">
                            <label for="Message" class="col-lg-2 control-label">Message</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="Message" class="form-control" runat="server" />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    CssClass="text-danger"
                                    ControlToValidate="Message" 
                                    ErrorMessage="The Field Is Required!" 
                                    Display="Dynamic"/>
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
