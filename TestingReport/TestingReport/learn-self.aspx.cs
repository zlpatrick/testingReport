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
    public partial class learn_self : System.Web.UI.Page
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
        public bool bigfive = false;
        public bool perfect = false;
        public bool world = false;

        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();

        public List<string> badgeNames = new List<string>();
        public List<string> badgeClass = new List<string>();
        public List<string> badgeColor = new List<string>();
        public List<int> badgeCategory = new List<int>();

        public int world_1 = 0;
        public int world_2 = 0;
        public int world_3 = 0;
        public int world_4 = 0;

        public int perfect_1 = 0;
        public int perfect_2 = 0;
        public int perfect_3 = 0;

        public int bigfive_1 = 0;
        public int bigfive_2 = 0;
        public int bigfive_3 = 0;
        public int bigfive_4 = 0;
        public int bigfive_5 = 0;
        public int bigfive_6 = 0;
        public int bigfive_7 = 0;
        public int bigfive_8 = 0;
        public int bigfive_9 = 0;
        public int bigfive_10 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            string code = Request["code"];
            string userid = Request["userid"];
            if (userid == null)
            {
                if (code == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe29e41d979d25872&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Flearn-self.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
                }
                else
                {

                    userid = WeixinUtil.getUserAuthorizedId(code);
                }
            }
            if(userid == null || userid.Equals(""))
            {
                Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe29e41d979d25872&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Flearn-self.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
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

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=1");
            if (ds.Tables[0].Rows.Count > 0)
                bigfive = true;

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=9");
            if (ds.Tables[0].Rows.Count > 0)
                world = true;

            ds = db.executeSqlQuery("select * from Votes where userid='" + userid + "' and topicId=10");
            if (ds.Tables[0].Rows.Count > 0)
                perfect = true;
           
           
            
            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=9");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(1);
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=10");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(2);
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (badgeNames.Count < 3)
                    {
                        badgeNames.Add(ds.Tables[0].Rows[i]["badgeName"].ToString());
                        badgeCategory.Add(3);
                    }
                }
            }

            badgeColor.Add("orangered");
            badgeColor.Add("skyblue");
            badgeColor.Add("orange");

            badgeClass.Add("glyphicon-inbox");
            badgeClass.Add("glyphicon-tower");
            badgeClass.Add("glyphicon-globe");

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9");
            int totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9 and badgeName='重度入世'");
            int person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            world_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9 and badgeName='轻度入世'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            world_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9 and badgeName='轻度出世'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            world_3 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9 and badgeName='重度出世'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            world_4 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10");
            totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='顺其自然主义'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            perfect_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='神经质完美主义'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            perfect_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='积极完美主义'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            perfect_3 = person * 100 / totalPerson;


            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1");
            totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='神经质低'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_1 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='神经质高'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_2 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='内向'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_3 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='外向'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_4 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='保守'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_5 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='开放'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_6 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='宜人性低'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_7 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='宜人性高'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_8 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='严谨性低'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_9 = person * 500 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=1 and badgeName='严谨性高'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            bigfive_10 = person * 500 / totalPerson;
        }
    }
}