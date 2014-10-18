<%@ Page
    Title="Genarate Random Number With HTML Controls"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="RandomNumbersHTML.aspx.cs"
    Inherits="HomeworkTasks.RandomNumbersHTML.RandomNumbersHTML" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Using the HTML server controls create a Web application for generating random numbers. 
        It should have two input fields defining a range (e.g. [10..20]) 
        and a button to generate a random number in the specified range.
    -->
    <h3>Generate Number - HTML</h3>
    <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="minRange" class="col-lg-2 control-label">Minimal</label>
                <div class="col-lg-10">
                    <input type="number" class="form-control" id="minRange" placeholder="Minimal Value" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="maxRange" class="col-lg-2 control-label">Maximal</label>
                <div class="col-lg-10">
                    <input type="number" class="form-control" id="maxRange" placeholder="Maximal Value" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <button runat="server" type="button" class="btn btn-primary" onserverclick="ButtonGetRandom_Click">Get Random Number</button>
                    <p>Default range 0 - 999</p>
                </div>
            </div>
        </fieldset>
    </div>
    <p>Random number generated: </p>
    <h1 id="randomNumberResult" runat="server"></h1>
</asp:Content>
