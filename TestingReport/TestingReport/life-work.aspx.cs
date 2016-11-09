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

        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();

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

                sql = "select * from measures where TopicId=2";
                
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

                ds = db.executeSqlQuery("select * from MeasureScores where topicId=2 and userId='" + userid + "' order by testDateTime asc");

                Dictionary<string, Dictionary<string, int>> measureAllScores = new Dictionary<string, Dictionary<string, int>>();
                
                int minYear = 0;
                int minMonth = 0;
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
                        string timeStr =  datetime.Month+"月";
                        if (minYear == 0)
                        {
                            minYear = datetime.Year;
                            minMonth = datetime.Month;
                        }
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
                Dictionary<string, Dictionary<string, int>> nullScores = new Dictionary<string, Dictionary<string, int>>();
                if (measureAllScores.Keys.Count < 6)
                {
                    
                    int calTimes = 6 - measureAllScores.Keys.Count;
                    if( minYear == 0 )
                    {
                        minYear = DateTime.Now.Year;
                        minMonth = DateTime.Now.Month;
                    }
                    for (int i = calTimes; i > 0; i--)
                    {
                        DateTime dt = new DateTime(minYear, minMonth, 1);
                        dt = dt.AddMonths(-i);
                        string timeStr = dt.Month + "月";
                        nullScores.Add(timeStr, new Dictionary<string, int>());
                        nullScores[timeStr].Add("幸福指数", 0);
                        nullScores[timeStr].Add("焦虑指数", 0);
                        nullScores[timeStr].Add("情绪指数", 0);
                        nullScores[timeStr].Add("成就与意义", 0);
                    }
                }

                foreach (KeyValuePair<string, Dictionary<string, int>> pair in nullScores)
                {
                    labelNames += "\"" + pair.Key + "\",";

                    string temp = "";
                    foreach (KeyValuePair<string, int> pair2 in pair.Value)
                    {
                        string dName = pair2.Key;
                        if (!dimName.Contains(dName))
                        {
                            dimName.Add(dName);
                            scoreLabels.Add(dName, "");
                        }
                        scoreLabels[dName] += pair2.Value + ",";
                    }
                }

                
                foreach(KeyValuePair<string,Dictionary<string,int>> pair in measureAllScores)
                {
                    labelNames += "'" + pair.Key + "',";

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


                ds = db.executeSqlQuery("select * from ChooseItem where topicId=2");
                Dictionary<int, int> scores = new Dictionary<int, int>();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        int position = Convert.ToInt32(ds.Tables[0].Rows[i]["itemPosition"].ToString());
                        int score = Convert.ToInt32(ds.Tables[0].Rows[i]["ItemScore"].ToString());
                        scores.Add(position, score);
                    }

                    ds = db.executeSqlQuery("select * from Votes where userId='" + userid + "' and TopicId=2");
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        int totalScore = 0;
                        Dictionary<int, int> choosePositionMap = new Dictionary<int, int>();
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            int optionId = Convert.ToInt32(ds.Tables[0].Rows[i]["OptionId"].ToString());
                            int choosePosition = Convert.ToInt32(ds.Tables[0].Rows[i]["ChooseItemPosition"].ToString());
                            totalScore += scores[choosePosition];
                            choosePositionMap.Add(optionId, choosePosition);
                        }

                        /*总分板块*/

                        ds = db.executeSqlQuery("select * from Dimensions where TopicId=2");
                        if (ds.Tables[0].Rows.Count > 1)
                        {
                            int dimensionCount = ds.Tables[0].Rows.Count;

                            Dictionary<int, int> dimensionScores = new Dictionary<int, int>();
                            Dictionary<int, string> dimensionNames = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionDescs = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionImages = new Dictionary<int, string>();
                            Dictionary<int, int> dimensionOptionCount = new Dictionary<int, int>();


                            List<string> chartScoreString = new List<string>();

                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                int dimensionId = Convert.ToInt32(ds.Tables[0].Rows[i]["id"]);
                                string dimensionName = ds.Tables[0].Rows[i]["DimensionName"].ToString();
                                string dimensionDesc = ds.Tables[0].Rows[i]["DimensionDesc"].ToString();
                                string optionIdList = ds.Tables[0].Rows[i]["OptionIdList"].ToString();
                                string dimensionImage = ds.Tables[0].Rows[i]["DimensionImage"].ToString();
                                string[] options = optionIdList.Split(',');
                                int[] optionIDInt = new int[options.Length];
                                int dimensionScore = 0;
                                for (int j = 0; j < options.Length; j++)
                                {
                                    optionIDInt[j] = Convert.ToInt32(options[j]);

                                    if (choosePositionMap.ContainsKey(optionIDInt[j]))
                                    {
                                        dimensionScore += scores[choosePositionMap[optionIDInt[j]]];
                                    }
                                }

                                dimensionScores.Add(dimensionId, dimensionScore);
                                dimensionNames.Add(dimensionId, dimensionName);
                                dimensionDescs.Add(dimensionId, dimensionDesc);
                                dimensionImages.Add(dimensionId, dimensionImage);
                                dimensionOptionCount.Add(dimensionId, options.Length);
                            }

                            sql = "select * from TotalAverage where topicId = 2";
                            ds = db.executeSqlQuery(sql);
                            Dictionary<int, float> dimensionCompare = new Dictionary<int, float>();
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                int dimId = Convert.ToInt32(ds.Tables[0].Rows[i]["dimensionId"]);
                                int totalScoreCompare = Convert.ToInt32(ds.Tables[0].Rows[i]["totalScore"]);
                                int totalPersonCompare = Convert.ToInt32(ds.Tables[0].Rows[i]["totalPerson"]);
                                dimensionCompare.Add(dimId, ((float)totalScoreCompare) / totalPersonCompare);
                            }

                            foreach (KeyValuePair<int, int> pair in dimensionScores)
                            {
                                radarDimNames.Add(dimensionNames[pair.Key]);
                                radarDimScores.Add((float)(pair.Value / 2.0));
                                radarAveScores.Add(dimensionCompare[pair.Key] / 10);

                            }
                        }
                    }
                }
                            
            }
        }
    }
}