<%@ Page Title="Ajax Chat" 
    Language="C#" 
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true" 
    CodeBehind="Default.aspx.cs" 
    Inherits="AjaxChat.Default" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <h3>Ajax Chat</h3>
    <div class="row">
        <div class="col-md-6">
            <div class="bs-component">
                <asp:ScriptManager ID="ScriptManager" runat="server" />

                <asp:ListView
                    runat="server"
                    ID="ChatListView"
                    ItemType="AjaxChat.Models.Message"
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
                            <span class="badge">from: <strong><%#: Item.Username %></strong></span>
                            Message: <strong><%#: Item.MessageText %></strong>
                        </li>
                    </ItemTemplate>

                    <InsertItemTemplate>
                    </InsertItemTemplate>

                </asp:ListView>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label for="Username" class="col-lg-2 control-label">Username</label>
                        <div class="col-lg-10">
                            <asp:TextBox runat="server" class="form-control" placeholder="Username" ID="Username" Text='<%# Bind("Username") %>'></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Message" class="col-lg-2 control-label">Message</label>
                        <div class="col-lg-10">
                            <asp:TextBox runat="server" class="form-control" placeholder="Message" ID="Message" Text='<%# Bind("Message") %>'></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:LinkButton
                                ID="InsertButton"
                                runat="server"
                                CommandName="Send"
                                Text="Insert"
                                OnCommand="InsertButton_Command"
                                class="btn btn-primary" />
                        </div>
                    </div>
                </fieldset>
            </div>

            <asp:Timer ID="TimerChatRefresh" runat="server" Interval="500" />
        </div>
    </div>
</asp:Content>
