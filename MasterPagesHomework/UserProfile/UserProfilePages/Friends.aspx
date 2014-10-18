<%@ Page 
    Title="My Friends" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Friends.aspx.cs" 
    Inherits="UserProfile.UserProfilePages.Friends" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>My Friends</h3>
    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Stamat</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/stamat.jpg" />
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Minka</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/minka.jpg" />
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Droncho</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/droncho.jpg" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
