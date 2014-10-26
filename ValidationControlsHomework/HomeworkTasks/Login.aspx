<%@ Page Title="Login Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HomeworkTasks.Login" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Login Form Validation</h3>

    <div id="registrationForm" class="well bs-component">
        <div class="form-horizontal">
            <fieldset>
                <legend>Login Info</legend>

                <asp:ValidationSummary class="alert alert-dismissable alert-danger" ID="ValidationSummaryLoginInfo" ValidationGroup="loginInfo" DisplayMode="BulletList" runat="server" />

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Username">Username</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="loginInfo" placeholder="Username" class="form-control" ID="Username" runat="server" />
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="loginInfo"
                        ID="UsernameValidation"
                        runat="server"
                        ErrorMessage="Username is required!"
                        Text="*"
                        ControlToValidate="Username"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Password">Password</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="loginInfo" type="password" class="form-control" ID="Password" runat="server" placeholder="Password" />
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="loginInfo"
                        ID="PasswordValidation"
                        runat="server"
                        ErrorMessage="Password is required!"
                        Text="*"
                        ControlToValidate="Password"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="PasswordConfirm">Confirm Password</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="loginInfo" type="password" class="form-control" ID="PasswordConfirm" runat="server" placeholder="Confirm Password"/>
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="loginInfo"
                        ID="PasswordConfirmValidation"
                        runat="server"
                        ErrorMessage="Password confirmation is required!"
                        Text="*"
                        ControlToValidate="PasswordConfirm"
                        Display="Dynamic" />

                    <asp:CompareValidator
                        ValidationGroup="loginInfo"
                        ID="PasswordConfirmCompareValidation"
                        runat="server"
                        ErrorMessage="Passwords don't match!"
                        ControlToCompare="Password"
                        Text="*"
                        ControlToValidate="PasswordConfirm"
                        Display="Dynamic" />
                </div>

                <%--<asp:Button class="btn btn-default btn-xs btn-block" runat="server" Text="Validate Group" CausesValidation="true" ValidationGroup="loginInfo" />--%>
            </fieldset>
            <br />
            <fieldset>
                <legend>Personal Info</legend>

                <asp:ValidationSummary class="alert alert-dismissable alert-danger" ID="ValidationSummaryPersonalInfo" ValidationGroup="personalInfo" DisplayMode="BulletList" runat="server" />

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="FirstName">First Name</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="personalInfo" class="form-control" ID="FirstName" placeholder="First Name" runat="server" />
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="personalInfo"
                        ID="FirstNameValitadion"
                        runat="server"
                        ErrorMessage="First name is required!"
                        Text="*"
                        ControlToValidate="FirstName"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="LastName">Last Name</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="personalInfo" class="form-control" ID="LastName" placeholder="Last Name" runat="server" />
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="personalInfo"
                        ID="LastNameValidation"
                        runat="server"
                        ErrorMessage="Last name is required!"
                        Text="*"
                        ControlToValidate="LastName"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Age">Age</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="personalInfo" type="number" class="form-control" ID="Age" runat="server" placeholder="Age"/>
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="personalInfo"
                        ID="AgeValidation"
                        runat="server"
                        ErrorMessage="Please enter your age!"
                        Text="*"
                        ControlToValidate="Age"
                        Display="Dynamic" />

                    <asp:RangeValidator
                        ValidationGroup="personalInfo"
                        ID="AgeRangeValidation"
                        runat="server"
                        ErrorMessage="Age must be between 18 and 81"
                        ControlToValidate="Age"
                        MaximumValue="81"
                        MinimumValue="18"
                        Type="Integer"
                        Text="*" />
                </div>

                <%--<asp:Button class="btn btn-default btn-xs btn-block" runat="server" Text="Validate Group" CausesValidation="true" ValidationGroup="personalInfo" />--%>
            </fieldset>
            <br />
            <fieldset>
                <legend>Contact Info</legend>

                <asp:ValidationSummary class="alert alert-dismissable alert-danger" ID="ValidationSummaryContactInfo" ValidationGroup="contactInfo" DisplayMode="BulletList" runat="server" />

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Email">Email</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Email" runat="server" placeholder="Email" />
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="contactInfo"
                        ID="EmailValidation"
                        runat="server"
                        ErrorMessage="Email is required!"
                        Text="*"
                        ControlToValidate="Email"
                        Display="Dynamic" />

                    <asp:RegularExpressionValidator
                        ValidationGroup="contactInfo"
                        ID="ValidEmailValidation"
                        runat="server"
                        ErrorMessage="Invalid email!"
                        Text="*"
                        ValidationExpression="\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b"
                        ControlToValidate="Email" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Address">Address</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Address" runat="server" placeholder="Address"/>
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="contactInfo"
                        ID="AddressValidation"
                        runat="server"
                        ErrorMessage="Address is required!"
                        Text="*"
                        ControlToValidate="Address"
                        Display="Dynamic" />
                </div>

                <div class="form-group">
                    <asp:Label class="col-md-2 control-label" runat="server" AssociatedControlID="Phone">Phone</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ValidationGroup="contactInfo" class="form-control" ID="Phone" runat="server" placeholder="Phone"/>
                    </div>

                    <asp:RequiredFieldValidator
                        ValidationGroup="contactInfo"
                        ID="PhoneValidation"
                        runat="server"
                        ErrorMessage="Phone is required!"
                        Text="*"
                        ControlToValidate="Phone"
                        Display="Dynamic" />

                    <asp:RegularExpressionValidator
                        ValidationGroup="contactInfo"
                        ID="ValidPhoneValidation"
                        runat="server"
                        ErrorMessage="Invalid Phone!"
                        Text="*"
                        ValidationExpression="^\+?\d+(-\d+)*$"
                        ControlToValidate="Phone" />
                </div>

                <%--<asp:Button class="btn btn-default btn-xs btn-block" runat="server" Text="Validate Group" CausesValidation="true" ValidationGroup="contactInfo" />--%>

            </fieldset>
            <br />
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Button class="btn btn-primary btn-block" runat="server" ID="Submit" Text="Submit" CausesValidation="true" OnClick="Submit_Click" />
                    <a href="/Login.aspx" class="btn btn-success btn-xs btn-block">Clear</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
