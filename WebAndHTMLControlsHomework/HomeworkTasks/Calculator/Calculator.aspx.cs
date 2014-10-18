namespace HomeworkTasks.Calculator
{
    using System;
    using System.Web.UI.WebControls;

    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ButtonSqrt.Text = Server.HtmlDecode("&#8730;");
        }

        protected void ButtonNumber_Click(object sender, EventArgs e)
        {
            if (this.LabelNewNumber.Text == "false")
            {
                this.TextBoxInput.Text += ((Button)sender).Text;
            }
            else
            {
                if (this.LabelOperation.Text == string.Empty)
                {
                    this.LabelCurrentNumber.Text = "0";
                }
                else
                {
                    this.LabelCurrentNumber.Text = Server.HtmlEncode(TextBoxInput.Text);
                }

                this.TextBoxInput.Text = ((Button)sender).Text;
                this.LabelNewNumber.Text = "false";
            }
        }

        protected void ButtonPlus_Click(object sender, EventArgs e)
        {
            if (this.LabelCalculate.Text == "true")
            {
                this.CalculateResultNumber();
            }

            this.LabelOperation.Text = "plus";
            this.LabelNewNumber.Text = "true";
            this.LabelCalculate.Text = "true";
        }

        protected void ButtonMinus_Click(object sender, EventArgs e)
        {
            if (this.LabelCalculate.Text == "true")
            {
                this.CalculateResultNumber();
            }

            this.LabelOperation.Text = "minus";
            this.LabelNewNumber.Text = "true";
            this.LabelCalculate.Text = "true";
        }

        protected void ButtonMultiple_Click(object sender, EventArgs e)
        {
            if (this.LabelCalculate.Text == "true")
            {
                this.CalculateResultNumber();
            }

            this.LabelOperation.Text = "multiple";
            this.LabelNewNumber.Text = "true";
            this.LabelCalculate.Text = "true";
        }

        protected void ButtonDivide_Click(object sender, EventArgs e)
        {
            if (this.LabelCalculate.Text == "true")
            {
                this.CalculateResultNumber();
            }

            this.LabelOperation.Text = "divide";
            this.LabelNewNumber.Text = "true";
            this.LabelCalculate.Text = "true";
        }

        protected void ButtonSqrt_Click(object sender, EventArgs e)
        {
            this.LabelOperation.Text = "sqrt";
            this.CalculateResultNumber();
            this.LabelOperation.Text = string.Empty;
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            this.TextBoxInput.Text = string.Empty;
        }

        protected void ButtonResult_Click(object sender, EventArgs e)
        {
            this.CalculateResultNumber();
            this.LabelOperation.Text = string.Empty;
            this.LabelNewNumber.Text = "true";
            this.LabelCalculate.Text = "false";
        }

        private void CalculateResultNumber()
        {
            this.LabelCalculate.Text = "false";
            double result;
            double storageResult;
            bool isstorageResult = double.TryParse(this.LabelCurrentNumber.Text, out storageResult);
            bool isResult = double.TryParse(this.TextBoxInput.Text, out result);

            if (isstorageResult && isResult)
            {
                switch (this.LabelOperation.Text)
                {
                    case "plus":
                        this.TextBoxInput.Text = Convert.ToString(storageResult + result);
                        break;
                    case "minus":
                        this.TextBoxInput.Text = Convert.ToString(storageResult - result);
                        break;
                    case "multiple":
                        this.TextBoxInput.Text = Convert.ToString(storageResult * result);
                        break;
                    case "divide":
                        this.TextBoxInput.Text = Convert.ToString(storageResult / result);
                        break;
                    case "sqrt":
                        this.TextBoxInput.Text = Convert.ToString(Math.Round(Math.Sqrt(result), 2));
                        break;
                    default:
                        break;
                }
            }
            else
            {
                this.TextBoxInput.Text = "Error";
            }
        }
    }
}