<%@ Page 
    Title="Calculator" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Calculator.aspx.cs" 
    Inherits="HomeworkTasks.Calculator.Calculator" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Make a simple Web Calculator. The calculator should support the operations like:
            - addition
            - subtraction
            - multiplication
            - division
            - square root. 

        Validation is essential!
    -->

    <h3>Calculator</h3>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-lg-10">
                <asp:TextBox Width="211px" ID="TextBoxInput" type="number" class="form-control" runat="server" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-10">
                <asp:Button Width="50px" Text="1" class="btn btn-primary" runat="server" ID="Button1" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="2" class="btn btn-primary" runat="server" ID="Button2" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="3" class="btn btn-primary" runat="server" ID="Button3" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="+" class="btn btn-primary" runat="server" ID="ButtonPlus" OnClick="ButtonPlus_Click" />
            </div>
        </div>  

        <div class="form-group">
            <div class="col-lg-10">
                <asp:Button Width="50px" Text="4" class="btn btn-primary" runat="server" ID="Button4" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="5" class="btn btn-primary" runat="server" ID="Button5" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="6" class="btn btn-primary" runat="server" ID="Button6" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="-" class="btn btn-primary" runat="server" ID="ButtonMinus" OnClick="ButtonMinus_Click" />
            </div>
        </div>  

        <div class="form-group">
            <div class="col-lg-10">
                <asp:Button Width="50px" Text="7" class="btn btn-primary" runat="server" ID="Button7" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="8" class="btn btn-primary" runat="server" ID="Button8" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="9" class="btn btn-primary" runat="server" ID="Button9" OnClick="ButtonNumber_Click" />
                <asp:Button Width="50px" Text="*" class="btn btn-primary" runat="server" ID="ButtonMultiple" OnClick="ButtonMultiple_Click" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-10">
                <asp:Button Width="80px" Text="Clear" class="btn btn-primary" runat="server" ID="ButtonClear" OnClick="ButtonClear_Click" />
                <asp:Button Width="50px" Text="0" class="btn btn-primary" runat="server" ID="Button0" OnClick="ButtonNumber_Click" />
                <asp:Button Width="35px" Text="/" class="btn btn-primary" runat="server" ID="ButtonDivide" OnClick="ButtonDivide_Click" />
                <asp:Button Width="35px" Text="" class="btn btn-primary" runat="server" ID="ButtonSqrt" OnClick="ButtonSqrt_Click" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-10">
                <asp:Button Width="211px" class="btn btn-primary" Text="=" runat="server" ID="ButtonResult" OnClick="ButtonResult_Click" />
            </div>
        </div>

		<asp:Label Text="0" runat="server" ID="LabelCurrentNumber" Visible="false"/>
		<asp:Label Text="" runat="server" ID="LabelOperation" Visible="false"/>
		<asp:Label Text="false" runat="server" ID="LabelNewNumber" Visible="false"/>
		<asp:Label Text="false" runat="server" ID="LabelCalculate" Visible="false"/>
    </div>
</asp:Content>
