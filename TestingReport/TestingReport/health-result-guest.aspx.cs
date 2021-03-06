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
    public partial class health_result_guest : System.Web.UI.Page
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
        public bool isShared = false;
        public string openid;
        public string userAgent = "Other";

        public int health_1, health_2, health_3, health_4;
        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string from = Request["from"];
            if (from != null)
            {
                isShared = true;
                Response.Redirect("health-result-shared.aspx?shareduserid=" + Request["userid"]);
            }

            string userid = Request["userid"];
            string token = Request["token"];

            JObject obj = WeixinUtil.getUserInfo(userid, token);
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

            DataSet ds = db.executeSqlQuery("select * from ChooseItem where topicId=11");
            Dictionary<int, int> scores = new Dictionary<int, int>();
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    int position = Convert.ToInt32(ds.Tables[0].Rows[i]["itemPosition"].ToString());
                    int score = Convert.ToInt32(ds.Tables[0].Rows[i]["ItemScore"].ToString());
                    scores.Add(position, score);
                }

                ds = db.executeSqlQuery("select * from Votes where userId='" + userid + "' and TopicId=11");
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

                    ds = db.executeSqlQuery("select * from Dimensions where TopicId=11");
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

                        sql = "select * from TotalAverage where topicId = 11";
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
                            radarDimScores.Add((float)(pair.Value * 2 / 5.0));
                            radarAveScores.Add((float)(dimensionCompare[pair.Key] / 10));

                        }

                        string badges = "";
                        if (totalScore <= 100 && totalScore >= 76)
                        {
                            badges = "非常健康";
                            totalChartValue = 13;
                        }
                        else if (totalScore <= 75 && totalScore >= 66)
                        {
                            badges = "比较健康";
                            totalChartValue = 38;
                        }
                        else if (totalScore <= 65 && totalScore >= 56)
                        {
                            badges = "不太健康";
                            totalChartValue = 63;
                        }
                        else if (totalScore <= 55)
                        {
                            badges = "很不健康";
                            totalChartValue = 88;
                        }

                        sql = "delete from Badges where userId='" + userid + "' and topicId=11";
                        db.executeSqlNonQuery(sql);


                        sql = string.Format("insert into Badges(topicId,badgeName,userId) values({0},'{1}','{2}')", 11, badges, userid);
                        db.executeSqlNonQuery(sql);

                    }
                }
            }
            /*
            ds = db.executeSqlQuery("select count(userId) from badges where topicId=11");
            int totalPerson = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                totalPerson = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=11 and badgeName='非常健康'");
            int person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            health_1 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=11 and badgeName='比较健康'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            health_2 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=11 and badgeName='不太健康'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            health_3 = person * 100 / totalPerson;

            ds = db.executeSqlQuery("select count(userId) from badges where topicId=11 and badgeName='很不健康'");
            person = 0;
            if (ds.Tables[0].Rows.Count > 0)
            {
                person = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            health_4 = person * 100 / totalPerson;*/
        }
    }
}