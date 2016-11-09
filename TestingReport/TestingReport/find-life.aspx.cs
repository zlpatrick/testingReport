﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;

namespace TestingReport
{
    public partial class find_life : System.Web.UI.Page
    {
        public string openid = "";
        public string userImageUrl = "";
        public string userNickName = "";
        public List<string> measureNames = new List<string>();
        public List<string> measureScores = new List<string>();
        public List<string> measureBeats = new List<string>();
        public string toolBar = "";
        public List<string> dimName = new List<string>();
        public Dictionary<string, string> scoreLabels = new Dictionary<string, string>();
        public int totalStars = 0;
        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string region = "地区未设置";
        public int selfPercent = 0;
        public int testTimes = 0;
        public int toolTimes = 0;
        public bool life = false;
        public bool work = false;
        public bool happyfeeling = false;

        public List<string> badgeNames = new List<string>();
        public List<string> badgeClass = new List<string>();
        public List<string> badgeColor = new List<string>();
        public List<int> badgeCategory = new List<int>();

        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();


        public int happy_1 = 0;
        public int happy_2 = 0;
        public int happy_3 = 0;
        public int happy_4 = 0;

        public int work_1 = 0;
        public int work_2 = 0;
        public int work_3 = 0;
        public int work_4 = 0;

        public int life_1 = 0;
        public int life_2 = 0;
        public int life_3 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request["code"];
            string userid = Request["userid"];
            if (userid == null)
            {
                if (code == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe29e41d979d25872&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Ffind-life.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
                }
                else
                {
                    userid = WeixinUtil.getUserAuthorizedId(code);
                }
            }
            openid = userid;
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

           

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=2");
            if (ds.Tables[0].Rows.Count > 0)
                happyfeeling = true;

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=5");
            if (ds.Tables[0].Rows.Count > 0)
                work = true;

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=3");
            if (ds.Tables[0].Rows.Count > 0)
                life = true;



            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=2");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(1);
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=5");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(2);
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=3");
            if (ds.Tables[0].Rows.Count > 0)
            {
              
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(3);
            }

            badgeColor.Add("orangered");
            badgeColor.Add("skyblue");
            badgeColor.Add("orange");

            badgeClass.Add("glyphicon-inbox");
            badgeClass.Add("glyphicon-tower");
            badgeClass.Add("glyphicon-globe");


            ds = db.executeSqlQuery("select count(userId) from badges where topicId=2");
            int totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=2 and badgeName='非常幸福'");
            int person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            happy_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=2 and badgeName='比较幸福'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            happy_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=2 and badgeName='不太幸福'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            happy_3 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=2 and badgeName='很不幸福'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            happy_4 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=5");
            totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=5 and badgeName='对工作非常满意'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            work_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=5 and badgeName='对工作比较满意'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            work_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=5 and badgeName='对工作不太满意'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            work_3 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=5 and badgeName='对工作很不满意'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            work_4 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=3");
            totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=3 and badgeName='舒适区'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            life_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=3 and badgeName='学习区'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            life_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=3 and badgeName='恐慌区'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            life_3 = person * 100 / totalPerson;
        }
    }
}