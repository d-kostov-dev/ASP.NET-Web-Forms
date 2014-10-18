namespace HomeworkTasks.Escaping
{
    using System;

    public partial class Escaping : System.Web.UI.Page
    {
        protected void ButtonEscape_Click(object sender, EventArgs e)
        {
            string enteredText = this.inputText.Text;
            this.resultBox.Text = enteredText;
            this.htmlAllowed.Text = enteredText;
            this.htmlEscaped.Text = Server.HtmlEncode(enteredText);
        }
    }
}