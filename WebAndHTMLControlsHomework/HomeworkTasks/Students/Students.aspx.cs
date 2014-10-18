namespace HomeworkTasks.Students
{
    using System;
    using System.Text;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                // This is not the first load of the page,
                // so we should skip the data binding
                return;
            }

            this.registrationResult.Visible = false;

            // Bind the Universities Drop Down
            var universities = new[]
            {
                new { Id = 0, Name = "-- Select University --" },
                new { Id = 1, Name = "Sofia University" },
                new { Id = 2, Name = "Technical University" },
                new { Id = 3, Name = "Business University" },
                new { Id = 4, Name = "Science University" }
            };

            this.universitySelect.DataSource = universities;

            // Bind the Specialities Drop Down
            var specialities = new[]
            {
                new { Id = 0, Name = "-- Select Speciality --" },
                new { Id = 1, Name = "Finances Major" },
                new { Id = 2, Name = "Software Engineer" },
                new { Id = 3, Name = "Chemist" },
                new { Id = 4, Name = "Drop Out" }
            };

            this.specialtySelect.DataSource = specialities;

            // Bind the Courses List
            var coursesList = new[]
            {
                new { Id = 1, Name = "Biology" },
                new { Id = 2, Name = "Math" },
                new { Id = 3, Name = "C# Part 1" },
                new { Id = 4, Name = "JavaScript Advanced" }
            };

            this.coursesSelect.DataSource = coursesList;

            // Bind all Data
            this.DataBind();
        }

        protected void ButtonRegisterStudent_Click(object sender, EventArgs e)
        {
            this.registrationForm.Visible = false;
            this.registrationResult.Visible = true;
            this.registrationResult.Controls.AddAt(0, new LiteralControl("<h1>Registration Data</h1>"));

            this.registrationData.Controls.Add(this.PrepareLiteral("First Name", this.firstName.Text));
            this.registrationData.Controls.Add(this.PrepareLiteral("Last Name", this.lastName.Text));
            this.registrationData.Controls.Add(this.PrepareLiteral("Faculty Number", this.facultyNumber.Text));

            this.registrationData.Controls.Add(
                this.PrepareLiteral("University", this.universitySelect.SelectedItem.Text));

            this.registrationData.Controls.Add(
                this.PrepareLiteral("Speciality", this.specialtySelect.SelectedItem.Text));

            this.registrationData.Controls.Add(this.PrepareLiteral("Courses"));

            for (int i = 0; i < this.coursesSelect.Items.Count; i++)
            {
                var currentItem = coursesSelect.Items[i];

                if (currentItem.Selected)
                {
                    this.registrationData.Controls.Add(this.PrepareLiteral(string.Empty, currentItem.Text));
                }
            }
        }

        private LiteralControl PrepareLiteral(string type, string value = "")
        {
            var literalData = string.Format("<p>{0}: {1}</p>", type, Server.HtmlEncode(value));
            var literalResult = new LiteralControl(literalData);

            return literalResult;
        }
    }
}