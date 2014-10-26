using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeworkTasks
{
    [System.ComponentModel.DefaultBindingProperty("DataSource")]

    public partial class SiteLinks : System.Web.UI.UserControl
    {
        public SiteLinks()
        {
            this.FontFamily = "Open Sans";
            this.FontColor = "#008cba";
        }

        public string FontFamily { get; set; }

        public string FontColor { get; set; }

        public IEnumerable<MenuItem> DataSource
        {
            get { return (IEnumerable<MenuItem>)ListLinks.DataSource; }

            set 
            {
                foreach (var item in value)
                {
                    if (string.IsNullOrWhiteSpace(item.FontColor))
                    {
                        item.FontColor = this.FontColor;
                    }
                }
                ListLinks.DataSource = value; 
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            ListLinks.Style.Add("font-family", this.FontFamily);
        }

        public override void DataBind()
        {
            ListLinks.DataBind();

            base.DataBind();
        }
    }
}