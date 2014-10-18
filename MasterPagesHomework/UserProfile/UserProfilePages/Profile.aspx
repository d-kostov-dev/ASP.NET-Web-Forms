<%@ Page Title="My Profile"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="UserProfile.UserProfilePages.Profile" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>My Profile</h3>
    <div class="col-md-5">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Pesho</h3>
                </div>
                <div class="panel-body">
                    <img src="../content/img/pesho.jpg" />
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-5">
        <div class="bs-component">
            <ul class="list-group">
                <li class="list-group-item">
                    First Name: <strong>Pesho</strong>
                </li>
                <li class="list-group-item">
                    Last Name: <strong>Goshov</strong>
                </li>
                <li class="list-group-item">
                    Age: <strong>12-ish</strong>
                </li>
                <li class="list-group-item">
                    Motto: <strong>Just do it...tomorrow!</strong>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>