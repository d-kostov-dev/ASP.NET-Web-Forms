<%@ Page
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="SumNumbers.aspx.cs"
    Inherits="SumNumbersWebForms.SumNumbers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sum Numbers Homework - Task 2.1</title>
    <link href="content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <h1>Sum Numbers Homework - Task 2.1</h1>
                <div class="well bs-component">
                    <form id="form1" runat="server" class="form-horizontal">
                        <legend>Sum Numbers</legend>

                        <div class="form-group">
                            <label for="numberOne" class="col-lg-2 control-label">First Number</label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="numberOne" runat="server" placeholder="First Number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="numberTwo" class="col-lg-2 control-label">Second Number</label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="numberTwo" runat="server" placeholder="Second Number"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button class="btn btn-primary center-block" ID="ButtonSumNumbers" runat="server" OnClick="SumNumbers_Click" Text="Sum Numbers" />

                        <legend>Result</legend>

                        <div class="form-group">
                            <label for="result" class="col-lg-2 control-label">Result</label>
                            <div class="col-lg-10">
                                <asp:TextBox class="form-control" ID="resultBox" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</body>
</html>
