using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class result_pre : System.Web.UI.Page
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
    }
}