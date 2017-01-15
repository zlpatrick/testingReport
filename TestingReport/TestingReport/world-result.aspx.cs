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
    public partial class world_result : System.Web.UI.Page
    {
        
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
        public int totalChartValue = 0;
        public int world_1, world_2, world_3, world_4;
        public bool isShared = false;
        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string from = Request["from"];
            if (from != null)
            {
                isShared = true;
                Response.Redirect("world-result-shared.aspx?shareduserid=" + Request["userid"]);
            }

            string userid = Request["userid"];
           
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();
            DBUtil db = new DBUtil();
            UserSummary summary = SummaryUtil.getUserSummary(userid);
            age = summary.age;
            industry = summary.industry;
            region = summary.region;
            selfPercent = summary.selfPercent;
            testTimes = summary.learnself;
            toolTimes = summary.findlife;
            string sql = null;
            DataSet ds = db.executeSqlQuery("select * from ChooseItem where topicId=9");
            Dictionary<int, int> scores = new Dictionary<int, int>();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    int position = Convert.ToInt32(ds.Tables[0].Rows[i]["itemPosition"].ToString());
                    int score = Convert.ToInt32(ds.Tables[0].Rows[i]["ItemScore"].ToString());
                    scores.Add(position, score);
                }

                ds = db.executeSqlQuery("select * from Votes where userId='" + userid + "' and TopicId=9");
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

                    ds = db.executeSqlQuery("select * from Dimensions where TopicId=9");
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

                        sql = "select * from TotalAverage where topicId = 9";
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
                            radarDimScores.Add((float)(pair.Value * 5 / 14.0));
                            radarAveScores.Add((float)(dimensionCompare[pair.Key] / 10.0));

                        }

                        int total = dimensionScores[25] + dimensionScores[26] - dimensionScores[27] - dimensionScores[28];
                        int chartValue = 0;
                        string badge = "";
                        if(total > 10 )
                        {
                            if( total >= 25 )
                            {
                                chartValue = 0;
                            }
                            else
                            {
                                chartValue = 25 - total;
                            }
                            badge = "重度入世";
                        }
                        else if(total>0 && total<=10)
                        {
                            chartValue = 25 + (int)(25 - total * 2.5);
                            badge = "轻度入世";
                        }
                        else if ( total > -10 && total<=0)
                        {
                            chartValue = 50 + (int)(25 + total * 2.5);
                            badge = "轻度出世";
                        }
                        else
                        {
                            if(total<=-25)
                            {
                                chartValue = 100;
                            }
                            else
                            {
                                chartValue = 75 + 25 + total;
                            }
                            badge = "重度出世";
                        }

                        totalChartValue = chartValue;

                        sql = "delete from Badges where userId='" + userid + "' and topicId=9";
                        db.executeSqlNonQuery(sql);

                        sql = string.Format("insert into Badges(topicId,badgeName,userId) values({0},'{1}','{2}')", 9, badge, userid);
                        db.executeSqlNonQuery(sql);
                    }
                }
            }
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
        }
    }
}