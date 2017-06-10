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
        public bool profileComplete = false;
        public bool popBadge = false;

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
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4f44b7d364e15070&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Flearn-self.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
                }
                else
                {

                    userid = WeixinUtil.getUserAuthorizedId(code);
                }
            }
            if(userid == null || userid.Equals(""))
            {
                Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4f44b7d364e15070&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Flearn-self.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
            }

            openid = userid;
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();

            UserSummary summary = SummaryUtil.getUserSummary(userid);
            age = summary.age;
            industry = summary.industry;
            region = summary.region;
            selfPercent = summary.selfPercent;
            testTimes = summary.learnself;
            toolTimes = summary.findlife;

            bigfive = summary.bigfive;
            perfect = summary.perfect;
            world = summary.world;
            profileComplete = summary.profileComplete;

            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=9");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(1);
                badgeClass.Add("出世入世");
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=10");
            if (ds.Tables[0].Rows.Count > 0)
            {
                badgeNames.Add(ds.Tables[0].Rows[0]["badgeName"].ToString());
                badgeCategory.Add(2);
                badgeClass.Add("完美主义");
            }

            ds = db.executeSqlQuery("select * from Badges where userId='" + userid + "' and topicId=1");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (badgeNames.Count < 3)
                    {
                        string badgeName = ds.Tables[0].Rows[i]["badgeName"].ToString();
                        badgeNames.Add(badgeName);
                        
                        if (badgeName.Equals("开放") || badgeName.Equals("保守"))
                        {
                            badgeClass.Add("开放性");
                            badgeCategory.Add(5);
                        }
                        else if (badgeName.Equals("外向") || badgeName.Equals("内向"))
                        {
                            badgeClass.Add("外向性");
                            badgeCategory.Add(4);
                        }
                        else if (badgeName.Equals("神经质低") || badgeName.Equals("神经质高"))
                        {
                            badgeClass.Add("神经质");
                            badgeCategory.Add(3);
                        }
                        else if (badgeName.Equals("宜人性低") || badgeName.Equals("宜人性高"))
                        {
                            badgeClass.Add("宜人性");
                            badgeCategory.Add(6);
                        }
                        if (badgeName.Equals("严谨性低") || badgeName.Equals("严谨性高"))
                        {
                            badgeClass.Add("严谨性");
                            badgeCategory.Add(7);
                        }
                    }
                }
            }

            badgeColor.Add("orangered");
            badgeColor.Add("skyblue");
            badgeColor.Add("orange");


            if (summary.badgeNotify.Equals("") && badgeClass.Count > 0)
            {
                popBadge = true;
                db.executeSqlNonQuery("update Users set badgeNotify='T' where UserName='" + userid + "'");
            }


            ds = db.executeSqlQuery("select count(userId) from badges where topicId=9");
            int totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            if(totalPerson == 0)
            {
                totalPerson = 1;
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

            if (totalPerson == 0)
            {
                totalPerson = 1;
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='顺其自然型'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            perfect_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='神经质型'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            perfect_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=10 and badgeName='积极型'");
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

            if (totalPerson == 0)
            {
                totalPerson = 1;
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