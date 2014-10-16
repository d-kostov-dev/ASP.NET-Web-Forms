namespace HelloName
{
    using System;
    using System.Text;

    public partial class HelloName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.resultBox.Enabled = false;
        }

        protected void ConcatText_Click(object sender, EventArgs e)
        {
            var result = new StringBuilder();

            result.AppendLine("Never gonna give " + this.fieldGive.Text);
            result.AppendLine("Never gonna let " + this.fieldLet.Text);
            result.AppendLine("Never gonna run " + this.fieldRun.Text);
            result.AppendLine("Never gonna make " + this.fieldMake.Text);
            result.AppendLine("Never gonna say " + this.fieldSay.Text);
            result.AppendLine("Never gonna tell " + this.fieldTell.Text);

            this.resultBox.Text = result.ToString();
        }
    }
}