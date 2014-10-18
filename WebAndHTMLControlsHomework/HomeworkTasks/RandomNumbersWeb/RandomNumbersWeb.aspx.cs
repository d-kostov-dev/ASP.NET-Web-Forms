namespace HomeworkTasks.RandomNumbersWeb
{
    using System;

    public partial class RandomNumbersWeb : System.Web.UI.Page
    {
        private static readonly Random RandomGenerator = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.randomNumberResult.Attributes.Add("class", "hidden");
        }

        protected void ButtonGetRandom_Click(object sender, EventArgs e)
        {
            int minNum = this.minRange.Text != string.Empty ? int.Parse(this.minRange.Text) : 0;
            int maxNum = this.maxRange.Text != string.Empty ? int.Parse(this.maxRange.Text) : 999;

            this.randomNumberResult.Attributes.Add("class", "shown");
            this.randomNumberResult.InnerText = RandomGenerator.Next(minNum, maxNum + 1).ToString();
        }
    }
}