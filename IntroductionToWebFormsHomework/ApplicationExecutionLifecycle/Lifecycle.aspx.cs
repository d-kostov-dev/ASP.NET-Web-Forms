using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ApplicationExecutionLifecycle
{
    public partial class Lifecycle : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.resultBox.Enabled = false;
            this.resultBox.Text += "Page_PreInit started!\r\n";
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            this.resultBox.Text += "Page_Init started!\r\n";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.resultBox.Text += "\r\nNew cycle started!\r\n";
            this.resultBox.Text += "Page_Load started!\r\n";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.resultBox.Text += "Page_PreRender started!\r\n";
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // Response is unavailable at page unload
        }

        protected void ButtonOK_Init(object sender, EventArgs e)
        {
            this.resultBox.Text += "ButtonOK_Init started!\r\n";
        }

        protected void ButtonOK_Load(object sender, EventArgs e)
        {
            this.resultBox.Text += "ButtonOK_Load started!\r\n";
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            this.resultBox.Text += "ButtonOK_Click started!\r\n";
        }

        protected void ButtonOK_PreRender(object sender, EventArgs e)
        {
            this.resultBox.Text += "ButtonOK_PreRender started!\r\n";
        }

        protected void ButtonOK_Unload(object sender, EventArgs e)
        {
            // Response is unavailable at control unload
        }
    }
}