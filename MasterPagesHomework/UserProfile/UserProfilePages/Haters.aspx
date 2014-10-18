<%@ Page 
    Title="People I Dont Like" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Haters.aspx.cs" 
    Inherits="UserProfile.UserProfilePages.Haters" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>People I Dont Like</h3>
    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Forkata</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/h1.jpg" />
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Genio</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/h2.jpg" />
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="bs-component">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Marko</h3>
                </div>
                <div class="panel-body">
                    <img class="img-responsive" src="../content/img/h3.jpg" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
