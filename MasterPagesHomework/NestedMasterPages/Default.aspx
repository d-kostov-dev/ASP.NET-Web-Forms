<%@ Page 
    Title="Home Page" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Default.aspx.cs" 
    Inherits="NestedMasterPages.Default" %>

<asp:Content ID="headerContent" ContentPlaceHolderID="headerContent" runat="server">
    <div class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Country Info.Com</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="pageContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h3>Menu</h3>
                <div class="bs-component">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="Countries/Bulgaria/BulgariaHome.aspx">Bulgaria</a>
                        </li>
                        <li class="list-group-item">
                            <a href="Countries/USA/USAHome.aspx">USA</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <h3>Home Page</h3>
                <div class="jumbotron">
                    <p>Nested Master Pages Homework</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
