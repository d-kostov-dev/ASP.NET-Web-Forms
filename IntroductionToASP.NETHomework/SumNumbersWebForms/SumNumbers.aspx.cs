using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SumNumbersWebForms
{
    public partial class SumNumbers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.resultBox.Enabled = false;
        }

        protected void SumNumbers_Click(object sender, EventArgs e)
        {
            var numberOne = int.Parse(this.numberOne.Text);
            var numberTwo = int.Parse(this.numberTwo.Text);
            this.resultBox.Text = (numberOne + numberTwo).ToString();
        }
    }
}