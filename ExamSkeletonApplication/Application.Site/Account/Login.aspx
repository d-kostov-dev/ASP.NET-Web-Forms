<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Application.Site.Account.Login" Async="true" %>

<%--<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>--%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
    <section id="loginForm">
        <div class="well bs-component">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Log in</legend>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." Display="Dynamic"/>

                            <div class="checkbox">
                                <asp:Label runat="server" AssociatedControlID="RememberMe">
                                    <asp:CheckBox runat="server" ID="RememberMe" /> Remember me?
                                </asp:Label>
                            </div>
                        </div>
                    </div>

                    <%--<div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            
                        </div>
                    </div>--%>

                    <div class="form-group">
                        <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-block btn-primary" />
                        <asp:HyperLink runat="server" CssClass="btn btn-xs btn-block btn-default" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
                    </div>

                </fieldset>
            </div>
        </div>
        <p>
            <%-- Enable this once you have account confirmation enabled for password reset functionality
            <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
            --%>
        </p>
    </section>
    <div class="col-md-3"></div>
</div>

<%--        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>--%>
    </div>
</asp:Content>
