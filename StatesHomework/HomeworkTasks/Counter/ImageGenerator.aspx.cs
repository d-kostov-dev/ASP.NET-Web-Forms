using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks.Counter
{
    public partial class ImageGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["visits"] == null)
            {
                Session.Add("visits", 1);
            }
            else
            {
                var num = (int)Session["visits"];
                Session["visits"] = ++num;
            }

            Bitmap generatedImage = new Bitmap(50, 50);

            using (generatedImage)
            {
                Graphics imageGenerator = Graphics.FromImage(generatedImage);

                using (imageGenerator)
                {
                    imageGenerator.FillRectangle(Brushes.DodgerBlue, 0, 0, 50, 50);

                    var imageText = Session["visits"].ToString();
                    var imageFont = new Font("Segoe UI", 25);
                    var fontColor = new SolidBrush(Color.White);
                    var fontPosition = new PointF(1, 1);

                    // Centering Text
                    if ((int)Session["visits"] < 10)
                    {
                        fontPosition.X = 10;
                        fontPosition.Y = 1;
                    }

                    imageGenerator.DrawString(imageText, imageFont, fontColor, fontPosition);

                    Response.ContentType = "image/jpeg";

                    generatedImage.Save(Response.OutputStream, ImageFormat.Jpeg);
                }
            }

        }
    }
}