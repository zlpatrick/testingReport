using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingReport
{
    public partial class vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox box1 = new TextBox();
            this.form1.Controls.Add(box1);
        }
    }
}