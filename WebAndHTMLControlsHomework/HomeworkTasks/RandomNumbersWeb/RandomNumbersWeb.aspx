<%@ Page 
    Title="Genarate Random Number With WEB Controls" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="RandomNumbersWeb.aspx.cs" 
    Inherits="HomeworkTasks.RandomNumbersWeb.RandomNumbersWeb" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Re-implement the same (random num generator) using Web server controls.
    -->
    <h3>Generate Number - WEB</h3>
    <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="minRange" class="col-lg-2 control-label">Minimal</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="minRange" type="number" class="form-control" placeholder="Minimal Value" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="maxRange" class="col-lg-2 control-label">Maximal</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="maxRange" type="number" class="form-control" placeholder="Maximal Value" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="ButtonSubmit" runat="server" class="btn btn-primary" Text="Get Random Number" OnClick="ButtonGetRandom_Click" />
                    <p>Default range 0 - 999</p>
                </div>
            </div>
        </fieldset>
    </div>
    <p>Random number generated: </p>
    <h1 id="randomNumberResult" runat="server"></h1>
</asp:Content>