using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class more_info : System.Web.UI.Page
    {
        public string infoTitleImage;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"].ToString();
            string sql = "select * from Topics where ID=" + id;
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                infoTitleImage = ds.Tables[0].Rows[0]["introductionTitleImage"].ToString();
            }
        }

        protected void start_Click(object sender, EventArgs e)
        {
            string marriage = this.marriage.Value;
            string income = this.income.Value;
            string degree = this.degree.Value;

            string userid = Request["userid"].ToString();
            string type = Request["type"].ToString();
            string id = Request["id"].ToString();

            DBUtil db = new DBUtil();
            string sql = "update Users set marriage='" + marriage + "',income='" + income + "',degree='" + degree + "' where userName='" + userid + "'";
            db.executeSqlNonQuery(sql);

            Response.Redirect("result.aspx?id=" + id + "&userid=" + userid + "&type=" + type);

        }
    }
}