<%@ Page
    Title="TicTacToe Game"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="TicTacToe.aspx.cs"
    Inherits="HomeworkTasks.TicTacToe.TicTacToe" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        * Implement the "Tic-tac-toe" game using Web server controls. 
        The user should play against the computer which follows some fixed strategy.
    -->

    <div id="errorBox" runat="server" class="alert alert-danger">
        <strong>Wrong Move</strong>
    </div>

    <div id="successBox" runat="server" class="alert alert-success">
    </div>

    <h3>Tic Tac Toe Game</h3>
    <div class="col-md-3">
        <div class="bs-component text-center">
            <table class="table">
                <tbody>
                    <tr>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                    </tr>
                    <div id="gameField" runat="server"></div>
                </tbody>
            </table>
        </div>
    </div>

    <div class="form-horizontal">
        <fieldset>
            <div class="form-group">
                <label for="rowNum" class="col-lg-2 control-label">Row</label>
                <div class="col-lg-10">
                    <input type="number" class="form-control" id="rowNum" placeholder="Row" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="colNum" class="col-lg-2 control-label">Column</label>
                <div class="col-lg-10">
                    <input type="number" class="form-control" id="colNum" placeholder="Column" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <button runat="server" type="button" class="btn btn-primary" onserverclick="ButtonPlay_Click">Play</button>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
