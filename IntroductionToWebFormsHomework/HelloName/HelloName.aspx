<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelloName.aspx.cs" Inherits="HelloName.HelloName" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Introduction To Web Forms Homework - Task 1</title>
    <link href="content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!--
        Create a simple ASPX page that enters a name and prints "Hello" + name in the page. Use a TextBox + Button + Label.
        Well i modified the task a little! :)
    -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Concat Text Homework - Task 1</h1>
                <div class="well bs-component">
                    <form id="concatTextForm" runat="server" class="form-horizontal">
                        <legend>Fill the blanks!</legend>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna give: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldGive" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna let: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldLet" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna run: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldRun" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna make: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldMake" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna say: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldSay" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Never gonna tell: </label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="fieldTell" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button class="btn btn-primary center-block" ID="ConcatText" runat="server" OnClick="ConcatText_Click" Text="Sum Numbers" />

                        <legend>Result</legend>

                        <div class="form-group">
                            <label for="result" class="col-lg-2 control-label">Result</label>
                            <div class="col-lg-10">
                                <asp:TextBox TextMode="multiline" Columns="110" Rows="7" class="form-control" ID="resultBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
