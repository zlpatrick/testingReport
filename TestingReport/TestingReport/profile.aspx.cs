using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            string userid = Request["userid"];

            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("vote.aspx?id=" + Request["id"] + "&userid=" + userid);
            }
            else
            {
                Response.Redirect("person.aspx?userid=" + userid + "&backId=" + Request["id"]);
            }
        }
    }
}