<%@ Page 
    Title="Students Registration" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="Students.aspx.cs" 
    Inherits="HomeworkTasks.Students.Students" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContent" runat="server">
    <!--
        Make a simple Web form for registration of students and courses. 
        The form should accept:
            - first name
            - last name
            - faculty number
            - university (drop-down list)
            - specialty (drop-down list) 
            - and a list of courses (multi-select list) 
        display them on submit.

        Use the appropriate Web server controls. 

        After submission you should display summary of the entered information as formatted HTML. 
        Use dynamically generated tags (<h1>, <p>, …).
    -->

    <h3>Student Registration</h3>
    <div class="form-horizontal" id="registrationForm" runat="server">
        <fieldset>
            <div class="form-group">
                <label for="firstName" class="col-lg-2 control-label">First Name</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="firstName" class="form-control" placeholder="First Name" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="lastName" class="col-lg-2 control-label">Last Name</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="lastName" class="form-control" placeholder="Last Name" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="facultyNumber" class="col-lg-2 control-label">Faculty Number</label>
                <div class="col-lg-10">
                    <asp:TextBox ID="facultyNumber" type="number" class="form-control" placeholder="Faculty Number" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="universitySelect" class="col-lg-2 control-label">University</label>
                <div class="col-lg-10">
                    <asp:DropDownList DataTextField="Name" DataValueField="Id" ID="universitySelect" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label for="specialtySelect" class="col-lg-2 control-label">Specialty</label>
                <div class="col-lg-10">
                    <asp:DropDownList DataTextField="Name" DataValueField="Id" ID="specialtySelect" class="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label for="coursesSelect" class="col-lg-2 control-label">Courses</label>
                <div class="col-lg-10">
                    <asp:ListBox DataTextField="Name" SelectionMode="Multiple" DataValueField="Id" ID="coursesSelect" class="form-control" runat="server"></asp:ListBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="ButtonSubmit" runat="server" class="btn btn-primary" Text="Register Student" OnClick="ButtonRegisterStudent_Click" />
                </div>
            </div>
        </fieldset>
    </div>
    <div id="registrationResult" runat="server">
        <div class="jumbotron" id="registrationData" runat="server"></div>
    </div>
</asp:Content>
