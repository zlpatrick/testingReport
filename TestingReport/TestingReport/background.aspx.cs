using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class background : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void start_Click(object sender, EventArgs e)
        {
            string userid = "1";
            string age = this.age.SelectedValue;
            string gender = this.gender.SelectedValue;
            string industry = this.industry.SelectedValue;

            string sql = "select * from Users where userName='"+userid+"'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                sql = string.Format("update Users set age='{0}',gender='{1}',industry='{2}'", age, gender, industry);
                db.executeSqlNonQuery(sql);
            }
            else
            {
                sql = string.Format("insert into Users(userName,regDateTime,age,gender,industry) values('{0}','{1}','{2}','{3}','{4}')",userid,DateTime.Now.ToString(),
                    age, gender, industry);
                db.executeSqlNonQuery(sql);
            }
            Response.Redirect("vote.aspx?id="+Request["id"]);
        }
    }
}