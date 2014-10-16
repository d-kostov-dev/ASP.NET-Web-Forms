<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lifecycle.aspx.cs" Inherits="ApplicationExecutionLifecycle.Lifecycle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Introduction To Web Forms Homework - Task 3</title>
    <link href="content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!--
        Dump all the events in the page execution lifecycle using appropriate methods or event handlers.
    -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Execution Lifecycke - Task 2</h1>
                <div class="well bs-component">
                    <form id="lifecycleForm" runat="server" class="form-horizontal">
                        <div class="form-group">
                            <label for="result" class="col-lg-2 control-label">Execution Log</label>
                            <div class="col-lg-10">
                                <asp:TextBox TextMode="multiline" Columns="110" Rows="20" class="form-control" ID="resultBox" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button class="btn btn-primary center-block" ID="ButtonOK" Text="Start" runat="server" 
                            OnInit="ButtonOK_Init" 
                            OnLoad="ButtonOK_Load" 
                            OnClick="ButtonOK_Click"
                            OnPreRender="ButtonOK_PreRender" 
                            OnUnload="ButtonOK_Unload" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
