namespace HomeworkTasks.RandomNumbersHTML
{
    using System;

    public partial class RandomNumbersHTML : System.Web.UI.Page
    {
        private static readonly Random RandomGenerator = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.randomNumberResult.Attributes.Add("class", "hidden");
        }

        protected void ButtonGetRandom_Click(object sender, EventArgs e)
        {
            int minNum = this.minRange.Value != string.Empty ? int.Parse(this.minRange.Value) : 0;
            int maxNum = this.maxRange.Value != string.Empty ? int.Parse(this.maxRange.Value) : 999;

            this.randomNumberResult.Attributes.Add("class", "shown");
            this.randomNumberResult.InnerText = RandomGenerator.Next(minNum, maxNum + 1).ToString();
        }
    }
}