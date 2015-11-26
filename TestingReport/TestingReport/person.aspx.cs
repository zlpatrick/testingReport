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
            if (userid == null)
            {
                userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            }
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();

            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);

            if (ds.Tables[0].Rows.Count <= 0)
            {
                string province = obj.GetValue("province").ToString();
                this.gender.Value = province;
            }
        }

        protected void start_Click(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            if (userid == null)
            {
                userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            }
            string age = this.age.Value;
            string region = this.gender.Value;
            string industry = this.industry.Value;
            string income = this.income.Value;
            string degree = this.degree.Value;
            string marriage = this.marriage.Value;

            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                sql = string.Format("update Users set age='{0}',region='{1}',industry='{2}',degree='{3}',income='{4}',marriage='{5}' where userName='{3}'", age, region, industry,degree,income,marriage,userid);
                db.executeSqlNonQuery(sql);
            }
            else
            {
                sql = string.Format("insert into Users(userName,regDateTime,age,gender,industry,income,degree,marriage) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", userid, DateTime.Now.ToString(),
                    age, region, industry,income,degree,marriage);
                db.executeSqlNonQuery(sql);
            }
           
        }
    }
}