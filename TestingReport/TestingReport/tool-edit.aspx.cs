using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;

namespace TestingReport
{
    public partial class tool_edit : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";

        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string region = "地区未设置";
        public int selfPercent = 0;
        public int testTimes = 0;
        public int toolTimes = 0;
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
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select * from Users where userName='" + userid + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                age = ds.Tables[0].Rows[0]["age"].ToString();
                industry = ds.Tables[0].Rows[0]["industry"].ToString();
                region = ds.Tables[0].Rows[0]["region"].ToString();
            }

            string sql = "select count(Id) as total from measureScores where userId='" + userid + "' and topicId in (2,5)";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                testTimes = Convert.ToInt32(ds.Tables[0].Rows[0][0]) / 4;
            }

            int personalTimes = 0;
            sql = "select * from Votes where userId='" + userid + "' and topicId=1";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                personalTimes++;
            }

            sql = "select * from Votes where userId='" + userid + "' and topicId=8";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                personalTimes++;
            }

            selfPercent = personalTimes * 100 / 6;

            if (!IsPostBack)
            {
                sql = "select * from MyTool where Id=" + Request["id"];
                ds = db.executeSqlQuery(sql);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.itemName.Text = ds.Tables[0].Rows[0]["toolName"].ToString();
                    this.frequencyField.Value = ds.Tables[0].Rows[0]["frequency"].ToString();
                }
            }
        }

        protected void deleteToolButton_Click(object sender, EventArgs e)
        {
            string sql = "delete from MyTool where Id=" + Request["id"];
            DBUtil db = new DBUtil();
            db.executeSqlQuery(sql);
            Response.Redirect("way-tool.aspx?userid=" + Request["userid"]);
        }

        protected void editToolButton_Click(object sender, EventArgs e)
        {
            string title = this.itemName.Text.Trim();
            string frequency = this.frequencyField.Value;
            string sql = string.Format("update MyTool set toolName='{0}',frequency={1} where Id={2}", title, frequency, Request["id"]);
            DBUtil db = new DBUtil();
            db.executeSqlNonQuery(sql);
            Response.Redirect("way-tool.aspx?userid=" + Request["userid"]);

        }
    }
}