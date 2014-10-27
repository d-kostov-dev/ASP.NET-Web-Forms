<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Application.Site._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Identity Homework</h3>
    <p>Learn more - Read <a href="ShowPage.aspx?pageId=2">FAQ</a></p>

    <div class="col-md-offset-3 col-md-6">

        <div class="well bs-component">
            <asp:ScriptManager ID="ScriptManager" runat="server" />

            <asp:ListView
                runat="server"
                ID="ChatMessages"
                ItemType="Application.Models.ChatMessage"
                InsertItemPosition="LastItem"
                DataKeyNames="Id">

                <LayoutTemplate>
                    <ul class="list-group">
                        <asp:UpdatePanel ID="AjaxChatUpdatePanel" runat="server">

                            <Triggers>
                                <asp:AsyncPostBackTrigger EventName="Tick" ControlID="TimerChatRefresh" />
                            </Triggers>

                            <ContentTemplate>
                                <div id="itemPlaceHolder" runat="server"></div>
                            </ContentTemplate>

                        </asp:UpdatePanel>
                    </ul>
                </LayoutTemplate>

                <ItemTemplate>
                    <li class="list-group-item">
                        <span class="badge">from: <strong><%#: Item.Author.FirstName + " " + Item.Author.LastName %></strong></span>
                        Message: <strong><%#: Item.Message %></strong>
                    </li>
                </ItemTemplate>

                <InsertItemTemplate>
                </InsertItemTemplate>

            </asp:ListView>

            <asp:Timer ID="TimerChatRefresh" runat="server" Interval="500" />
        </div>


        <asp:LoginView id="loginView" runat="server" ViewStateMode="Disabled">

            <AnonymousTemplate>
                <p><a href="/Account/Login.aspx">Login</a> to chat!</p>
                
            </AnonymousTemplate>

            <LoggedInTemplate>
                <div class="well bs-component">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Send Message</legend>

                            <div class="form-group">
                                <asp:Label runat="server" ID="Label1" AssociatedControlID="Message" CssClass="col-md-3 control-label">Message</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="Message" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Message"
                                        CssClass="text-danger" ErrorMessage="Message field is required."
                                        ValidationGroup="InfoData" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:Button runat="server" Text="Send" ValidationGroup="InfoData" OnClick="MessageSend_Click" CssClass="btn btn-block btn-primary" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>

</asp:Content>
