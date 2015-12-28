using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Data;

namespace TestingReport
{
    public partial class life_work : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";
        public List<string> measureNames = new List<string>();
        public List<string> measureScores = new List<string>();
        public List<string> measureBeats = new List<string>();
        public string toolBar= "";
        public List<string> dimName = new List<string>();
        public Dictionary<string, string> scoreLabels = new Dictionary<string, string>();
        public int totalStars = 0;
        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string region = "地区未设置";
        public int selfPercent = 0;
        public int testTimes = 0;
        public int toolTimes = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                string sql = "select * from measures where TopicId=2";
                
                ds = db.executeSqlQuery(sql);

                Dictionary<int, string> mNames = new Dictionary<int,string>();
                for(int i = 0;i<ds.Tables[0].Rows.Count;i++)
                {
                    string measureName = ds.Tables[0].Rows[i]["measureName"].ToString();
                    string measureId = ds.Tables[0].Rows[i]["Id"].ToString();
                    measureNames.Add(measureName);
                    mNames.Add(Convert.ToInt32(ds.Tables[0].Rows[i]["Id"]),measureName);
                    DataSet ds1 = db.executeSqlQuery("select * from MeasureScores where measureId=" + measureId + " and userId='" + userid + "' order by testDateTime desc");
                    
                    if(ds1.Tables[0].Rows.Count > 0)
                    {
                        string score = ds1.Tables[0].Rows[0]["score"].ToString();
                        string beats = ds1.Tables[0].Rows[0]["beats"].ToString();
                        
                        measureScores.Add(score);
                        measureBeats.Add(beats);
                    }
                }

                if (measureScores.Count == 0)
                {
                    for( int i =0;i<4;i++)
                    {
                        measureScores.Add("--");
                        measureBeats.Add("--");
                    }
                }

                ds = db.executeSqlQuery("select * from MeasureScores where topicId=2 and userId='" + userid + "' order by testDateTime desc");

                Dictionary<string, Dictionary<string, int>> measureAllScores = new Dictionary<string, Dictionary<string, int>>();
                if( ds.Tables[0].Rows.Count > 0 )
                {
                    int stars = 1;
                    string tempDate = "";
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        string dt = ds.Tables[0].Rows[i]["testDateTime"].ToString();
                        if (!dt.Equals(tempDate))
                        {
                            tempDate = dt;
                            stars++;
                        }
                        DateTime datetime = DateTime.Parse(dt);
                        string timeStr = datetime.Year + "." + datetime.Month;
                        if(!measureAllScores.ContainsKey(timeStr))
                        {
                            measureAllScores.Add(timeStr, new Dictionary<string, int>());
                        }
                        int measureId = Convert.ToInt32(ds.Tables[0].Rows[i]["measureId"]);
                        int score = Convert.ToInt32(ds.Tables[0].Rows[i]["score"].ToString());
                        measureAllScores[timeStr].Add(mNames[measureId], score);
                    }

                    if (stars > 5)
                    {
                        totalStars = 5;
                    }
                    else
                    {
                        totalStars = stars;
                    }
                }

                string labelNames = "";

                
                foreach(KeyValuePair<string,Dictionary<string,int>> pair in measureAllScores)
                {
                    labelNames += "\"" + pair.Key + "\",";

                    string temp = "";
                    foreach(KeyValuePair<string,int> pair2 in pair.Value)
                    {
                        string dName = pair2.Key;
                        if(!dimName.Contains(dName))
                        {
                            dimName.Add(dName);
                            scoreLabels.Add(dName,"");
                        }
                        scoreLabels[dName] += pair2.Value + ",";
                    }
                }

                toolBar = labelNames.Substring(0, labelNames.Length - 1);
            }
        }
    }
}