<%@ Page Title="Handle Escaping" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Escaping.aspx.cs" 
    Inherits="HomeworkTasks.Escaping.Escaping" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Define a Web form with text box and button. 
        On button click show the entered in the first textbox text in other 
        textbox control and label control. 

        Enter some potentially dangerous text. Fix issues related to HTML escaping – 
        the application should accept HTML tags and display them correctly
    -->

    <h3>Escaping</h3>
    <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="inputText" class="col-lg-2 control-label">Enter Any Text</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="inputText" class="form-control" placeholder="Any Text" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="ButtonEscape" runat="server" class="btn btn-primary" Text="Show Escaped Text" OnClick="ButtonEscape_Click" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">Result</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="resultBox" class="form-control" runat="server" disabled="disabled"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">HTML Allowed:</label>
                <div class="col-lg-10">
                    <asp:Label ID="htmlAllowed" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">HTML Escaped:</label>
                <div class="col-lg-10">
                    <asp:Label ID="htmlEscaped" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-2 control-label">HTML Escaped 2:</label>
                <div class="col-lg-10">
                    <%: this.inputText.Text %>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
