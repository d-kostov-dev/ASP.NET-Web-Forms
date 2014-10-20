<%@ Page Title="Cars Search Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarsSearch.aspx.cs" Inherits="DataBindingHomeworkTasks.CarsSearch.CarsSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Create a Web form for searching for cars by 
            - producer
            - model
            - type of engine
            - set of extras 
        (see www.mobile.bg).
        Use two DropDownLists for the producer (e.g. VW, BMW, …) and for the model (A6, Corsa,…). 
        Create a class Producer hodling Name + collection of models. 
        Bind the list of producers to the first DropDownList. 
        The second should be bound to the models of this producer. 

        You should have a check box for each “extra” 
        (use class Extra and bind the list of extras at the server side). 

        Implement the type of engine as a horizontal radio button selection 
        (options bound to a fixed array). 

        On submit display all collected information in <asp:Literal>.
    -->

    <h3>Cars Search</h3>
    <div class="form-horizontal" id="searchForm" runat="server">
        <fieldset>
            <div class="form-group">
                <label for="make" class="col-lg-2 control-label">Make</label>
                <div class="col-lg-10">
                    <asp:DropDownList DataTextField="Name" AutoPostBack="True" onselectedindexchanged="Make_SelectedIndexChanged" ID="make" class="form-control" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="model" class="col-lg-2 control-label">Model</label>
                <div class="col-lg-10">
                    <asp:DropDownList ID="model" class="form-control" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="engine" class="col-lg-2 control-label">Engine</label>
                <div class="col-lg-10">
                    <asp:RadioButtonList 
                        ID="engine" 
                        runat="server" 
                        DataTextField="Name" 
                        RepeatDirection="Horizontal"
                        DataValueField="Id">
                    </asp:RadioButtonList>
                </div>
            </div>

            <asp:RequiredFieldValidator
                ControlToValidate="engine"
                Text="You have to select Engine"
                runat="server" />

            <div class="form-group">
                <label for="extras" class="col-lg-2 control-label">Engine</label>
                <div class="col-lg-10">
                    <asp:CheckBoxList 
                        ID="extras" 
                        runat="server" 
                        DataTextField="Name"
                        RepeatDirection="Vertical"
                        DataValueField="Id">
 
                    </asp:CheckBoxList>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="ButtonSubmit" runat="server" class="btn btn-primary" Text="Search" OnClick="ButtonSearch_Click" />
                </div>
            </div>
        </fieldset>
    </div>
    <div class="jumbotron" id="selectedSearch" runat="server">
        <asp:Literal ID="searchData" runat="server"></asp:Literal>
    </div>
</asp:Content>
