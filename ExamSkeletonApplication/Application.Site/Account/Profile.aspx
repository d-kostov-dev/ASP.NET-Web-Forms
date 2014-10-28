<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Application.Site.Account.Profile" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-offset-3 col-md-6">
        <div class="bs-component">

            <asp:ListView
                runat="server"
                ID="ProfileDetails"
                ItemType="Application.Models.User"
                SelectMethod="Get_Data">

                <ItemTemplate>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">My Profile</h3>
                        </div>
                        <div class="panel-body">
                            <img class="img-responsive center-block" src="/content/userImages/<%#: Item.Photo != null ? Item.Photo : "no-photo.png" %>" />

                            <hr />

                            <ul class="list-group">
                                <li class="list-group-item">
                                    Username: <strong><%#: Item.UserName %></strong>
                                </li>
                                <li class="list-group-item">
                                    Email: <strong><%#: Item.Email %></strong>
                                </li>
                                <li class="list-group-item">
                                    First Name: <strong><%#: Item.FirstName != null ? Item.FirstName : "-" %></strong>
                                </li>
                                <li class="list-group-item">
                                    Last Name: <strong><%#: Item.LastName != null ? Item.LastName : "-" %></strong>
                                </li>
                                <li class="list-group-item">
                                    Country: <strong><%#: Item.Town != null ? Item.Town.Country.Name : "-" %></strong>
                                </li>
                                <li class="list-group-item">
                                    Town: <strong><%#: Item.Town != null ? Item.Town.Name : "-" %></strong>
                                </li>
                                <li class="list-group-item">
                                    Phone Number: <strong><%#: Item.Phone != null ? Item.Phone : "-" %></strong>
                                </li>
                                <li class="list-group-item">
                                    Relationship: <strong><%#: Item.RelationshipStatus != null ? Item.RelationshipStatus.ToString() : "-" %></strong>
                                </li>
                            </ul>
                        </div>
                    </div>

                     <a class="btn btn-primary btn-block" href="/Account/Manage">Edit</a>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
