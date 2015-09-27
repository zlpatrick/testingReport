using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingReport
{
    public partial class admin_add_choose_item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int topicId = Convert.ToInt32(Request["id"]);
            int totalChooseItem = Convert.ToInt32(Request["totalChooseItem"]);
            int totalOptions = Convert.ToInt32(Request["totalOptions"]);
            for (int i = 1; i <= totalChooseItem; i++)
            {
            }


        }
    }
}