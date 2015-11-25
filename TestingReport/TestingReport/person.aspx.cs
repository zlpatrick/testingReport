using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Data;

namespace TestingReport
{
    public partial class person : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request["userid"];

            userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();
            
        }

        protected void start_Click(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            string age = this.age.Value;
            string gender = this.gender.Value;
            string industry = this.industry.Value;

            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                sql = string.Format("update Users set age='{0}',region='{1}',industry='{2}' where userName='{3}'", age, gender, industry,userid);
                db.executeSqlNonQuery(sql);
            }
            else
            {
                sql = string.Format("insert into Users(userName,regDateTime,age,gender,industry) values('{0}','{1}','{2}','{3}','{4}')", userid, DateTime.Now.ToString(),
                    age, gender, industry);
                db.executeSqlNonQuery(sql);
            }
           // Response.Redirect("vote.aspx?id=" + Request["id"] + "&userid=" + userid);
        }
    }
}