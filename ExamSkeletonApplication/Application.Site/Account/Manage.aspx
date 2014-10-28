<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Application.Site.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3><%: Title %></h3>
            <p>You're logged in as <strong><%: User.Identity.GetUserName() %></strong>.</p>
        </div>

        <div class="col-md-6">
            <div class="well bs-component">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Change Info</legend>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label1" AssociatedControlID="FirstName" CssClass="col-md-3 control-label">First Name</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                                    CssClass="text-danger" ErrorMessage="First name field is required."
                                    ValidationGroup="InfoData" Display="Dynamic" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label2" AssociatedControlID="LastName" CssClass="col-md-3 control-label">Last Name</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                                    CssClass="text-danger" ErrorMessage="Last name field is required."
                                    ValidationGroup="InfoData" Display="Dynamic" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label8" AssociatedControlID="Country" CssClass="col-md-3 control-label">Country</asp:Label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="Country" class="form-control" runat="server" DataTextField="Name" DataValueField="Id" onselectedindexchanged="Country_Change" AutoPostBack="true"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label9" AssociatedControlID="Town" CssClass="col-md-3 control-label">Town</asp:Label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="Town" class="form-control" runat="server" DataTextField="Name" DataValueField="Id" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label7" AssociatedControlID="Address" CssClass="col-md-3 control-label">Address</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label4" AssociatedControlID="Phone" CssClass="col-md-3 control-label">Phone</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="Phone" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label3" AssociatedControlID="Photo" CssClass="col-md-3 control-label">Profile Image</asp:Label>
                            <div class="col-lg-9">
                                <asp:FileUpload ID="Photo" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" ID="Label10" AssociatedControlID="Status" CssClass="col-md-3 control-label">Relationship Status</asp:Label>
                            <div class="col-lg-9">
                                <asp:DropDownList ID="Status" class="form-control" runat="server"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:Button runat="server" Text="Edit" ValidationGroup="InfoData" OnClick="ChangeInfo_Click" CssClass="btn btn-block btn-primary" />
                                <a href="/Account/Profile.aspx" class="btn btn-default btn-xs btn-block">Cancel</a>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
                    <p>
                        You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
                    </p>
                    <div class="form-horizontal">
                        <h4>Set Password Form</h4>
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <hr />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-3 control-label">Password</asp:Label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="The password field is required."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-error" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                    ValidationGroup="SetPassword" />

                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <div class="well bs-component">
                        <div class="form-horizontal">
                            <fieldset>
                                <legend>Change Password</legend>
                                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                                <div class="form-group">
                                    <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-3 control-label">Current password</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                            CssClass="text-danger" ErrorMessage="The current password field is required."
                                            ValidationGroup="ChangePassword" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-3 control-label">New password</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                            CssClass="text-danger" ErrorMessage="The new password is required."
                                            ValidationGroup="ChangePassword" Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-3 control-label">Confirm password</asp:Label>
                                    <div class="col-md-9">
                                        <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                            CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm new password is required."
                                            ValidationGroup="ChangePassword" />
                                        <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                                            ValidationGroup="ChangePassword" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-block btn-primary" />
                                        <a href="/Account/Profile.aspx" class="btn btn-default btn-xs btn-block">Cancel</a>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>

            <%--            <section id="externalLoginsForm">

                <asp:ListView runat="server"
                    ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                    SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                    <LayoutTemplate>
                        <h4>Registered Logins</h4>
                        <table class="table">
                            <tbody>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.LoginProvider %></td>
                            <td>
                                <asp:Button runat="server" Text="Remove" CommandName="Delete" CausesValidation="false"
                                    ToolTip='<%# "Remove this " + Item.LoginProvider + " login from your account" %>'
                                    Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/Manage" />
            </section>--%>
        </div>
    </div>

</asp:Content>
