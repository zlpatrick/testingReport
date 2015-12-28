using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.DataVisualization;
using System.Text;
using Newtonsoft.Json.Linq;

namespace TestingReport
{
    public partial class resultday : System.Web.UI.Page
    {
        public string chartJsString;
        public string topicTitle;
        public string fromSource;
        public string userImageUrl = "";
        public string userNickName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicId = Request["id"].ToString();
            string userId = Request["userid"].ToString();

            if (userId == null || userId.Equals(""))
            {
                userId = "om8uZt7fajggMH8vqjFb1afiE8y4";
            }
            JObject obj = WeixinUtil.getUserInfo(userId);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();

            string type = Request["type"].ToString();
            fromSource = Request["from"];
            DBUtil db = new DBUtil();
          
            int resultType = 1;
            DataSet dst = db.executeSqlQuery("select * from Topics where Id=" + topicId);
            int maxOptionScore = -1;
            int totalChooseItem = -1;
            string resultChart = "";
            if (dst.Tables[0].Rows.Count > 0)
            {
                resultType = Convert.ToInt32(dst.Tables[0].Rows[0]["resulttype"].ToString());
                string introductionTitle = dst.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                string resultImage = dst.Tables[0].Rows[0]["resultPageImage"].ToString();
                totalChooseItem = Convert.ToInt32(dst.Tables[0].Rows[0]["TotalChooseItem"]);
                resultChart = dst.Tables[0].Rows[0]["resultChartIntroductionImage"].ToString();
                topicTitle = dst.Tables[0].Rows[0]["title"].ToString();

                try
                {
                    maxOptionScore = Convert.ToInt32(dst.Tables[0].Rows[0]["optionMaxScore"]);
                }
                catch (Exception ex)
                {
                    maxOptionScore = totalChooseItem;
                }

                Panel titlePanel = new Panel();
                /*Label titleImage = new Label();
                titleImage.Text = "";
                titlePanel.CssClass = "glyphicon glyphicon-user";
                titlePanel.Controls.Add(titleImage);*/

                Label titleTT = new Label();
                titlePanel.CssClass = "title-TT";
                if (topicId.Equals("2"))
                    titleTT.Text = "生活状态大数据";
                else if (topicId.Equals("5"))
                    titleTT.Text = "工作状态大数据";
                else if (topicId.Equals("1"))
                    titleTT.Text = "性格分析";
                titlePanel.Controls.Add(titleTT);
                this.titleDiv.Controls.Add(titlePanel);


                Panel imgPanel = new Panel();
                Image image = new Image();
                image.ImageUrl = "assets/" + resultImage;
                imgPanel.CssClass = "test-img";
                imgPanel.Controls.Add(image);
                this.titleDiv.Controls.Add(imgPanel);
            }

            if (type.Equals("1"))
            {
                DataSet ds = db.executeSqlQuery("select * from ChooseItem where topicId=" + topicId);
                Dictionary<int, int> scores = new Dictionary<int, int>();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        int position = Convert.ToInt32(ds.Tables[0].Rows[i]["itemPosition"].ToString());
                        int score = Convert.ToInt32(ds.Tables[0].Rows[i]["ItemScore"].ToString());
                        scores.Add(position, score);
                    }

                    ds = db.executeSqlQuery("select * from Votes where userId='" + userId + "' and TopicId=" + topicId);
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

                        ds = db.executeSqlQuery("select * from Dimensions where TopicId=" + topicId);
                        if (ds.Tables[0].Rows.Count > 1)
                        {
                            int dimensionCount = ds.Tables[0].Rows.Count;
                         
                            Dictionary<int, int> dimensionScores = new Dictionary<int, int>();
                            Dictionary<int, string> dimensionNames = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionDescs = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionImages = new Dictionary<int, string>();
                            Dictionary<int, int> dimensionOptionCount = new Dictionary<int, int>();

                            string chartLabelString = "" ;
                            string chartScoreRaderString = "";
                            List<string> chartScoreString = new List<string>();
                            StringBuilder strBuilder = new StringBuilder();
                            StringBuilder strBuilder2 = new StringBuilder();
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

                                int chartScore = (dimensionScore * 100) / (2 * maxOptionScore);

                                if (ds.Tables[0].Rows.Count > 4)
                                {
                                    strBuilder.Append("\"").Append(dimensionName).Append("\",");
                                    strBuilder2.Append(chartScore).Append(",");
                                }
                            }

                            chartLabelString = strBuilder.ToString();
                            chartScoreRaderString = strBuilder2.ToString();
 
                            if (topicId.Equals("2") || topicId.Equals("5") || topicId.Equals("1"))
                            {
                                StringBuilder chartJs = new StringBuilder();

                                chartJs.Append("<script>").Append("\r\n")
                                        .Append("var radarChartData = {").Append("\r\n")
                                        .Append("labels: [").Append(chartLabelString.Substring(0, chartLabelString.Length - 1)).Append("],").Append("\r\n")
                                        .Append("datasets: [").Append("\r\n")
                                        .Append("{").Append("\r\n")
                                        .Append("label: \"My First dataset\",").Append("\r\n")
                                        .Append("fillColor: \"rgba(217,179,242,0.5)\",").Append("\r\n")
                                        .Append("strokeColor: \"rgba(217,179,242,0.8)\",").Append("\r\n")
                                        .Append("pointColor: \"rgba(217,179,242,1)\",").Append("\r\n")
                                        .Append("pointStrokeColor: \"#fff\",").Append("\r\n")
                                        .Append("pointHighlightFill: \"#fff\",").Append("\r\n")
                                        .Append("pointHighlightStroke: \"rgba(220,220,220,1)\",").Append("\r\n")
                                        .Append("data: [").Append(chartScoreRaderString.Substring(0, chartScoreRaderString.Length - 1)).Append("]").Append("\r\n")
                                        .Append("}").Append("\r\n")
                                        .Append("]").Append("\r\n")
                                        .Append("};").Append("\r\n")

                                        .Append("window.onload = function(){")
                                            .Append("window.myRadar = new Chart(document.getElementById(\"canvas\").getContext(\"2d\")).Radar(radarChartData, {").Append("\r\n")
                                                .Append("responsive: true").Append("\r\n")
                                            .Append("});").Append("\r\n")
                                        .Append("}").Append("\r\n")
                                .Append("</script>").Append("\r\n");

                                chartJsString = chartJs.ToString();
                            }

                            Panel dimensionTipImagePanel = new Panel();
                            Image dimensionTipImage = new Image();
                            dimensionTipImage.ImageUrl = "assets/result-tip.jpg";
                            dimensionTipImagePanel.CssClass = "result-tip-Image-panel";
                            dimensionTipImagePanel.Controls.Add(dimensionTipImage);
                            this.form1.Controls.Add(dimensionTipImagePanel);

                            if (topicId.Equals("2") || topicId.Equals("5"))
                            {
                                Panel dimensionScorePanel = new Panel();
                                dimensionScorePanel.CssClass = "dimension-score-panel";

                                /*Panel dimensionImagePanel = new Panel();
                                Image tempImg = new Image();
                                tempImg.ImageUrl = "assets/totalScore.jpg";
                                dimensionImagePanel.CssClass = "dimension-Image-panel";
                                dimensionImagePanel.Controls.Add(tempImg);
                                dimensionScorePanel.Controls.Add(dimensionImagePanel);*/


                                DataSet p = db.executeSqlQuery("select * from Users where userName='"+userId+"'");
                                string industry = "--";
                                string age = "--";
                                string region = "--";

                                bool showCompare = false;
                                if(p.Tables[0].Rows.Count>0)
                                {
                                    region = p.Tables[0].Rows[0]["region"].ToString();
                                    age = p.Tables[0].Rows[0]["age"].ToString();
                                    industry = p.Tables[0].Rows[0]["industry"].ToString();
                                    showCompare = true;
                                }

                                Panel personalInfoPanel = new Panel();
                                personalInfoPanel.CssClass = "dimension-score-panel-score";
                                Label personalInfo = new Label();
                                personalInfo.Text = "您目前的地区为:" + region + ",年龄为:" + age + ",行业为:" + industry + "。如果不准确,请到个人中心设置。";
                                personalInfoPanel.Controls.Add(personalInfo);
                                dimensionScorePanel.Controls.Add(personalInfoPanel);

                                /*Panel totalScorePanel = new Panel();
                                totalScorePanel.CssClass = "dimension-score-panel-score";
                                Label weightTitle = new Label();
                                weightTitle.Text = "得分：";
                                weightTitle.CssClass = "bold-text";
                                Label label = new Label();
                                label.Text = totalScore + "分";
                                totalScorePanel.Controls.Add(weightTitle);
                                totalScorePanel.Controls.Add(label);
                                if (topicId.Equals("2") || topicId.Equals("5")) 
                                {
                                    dimensionScorePanel.Controls.Add(totalScorePanel);
                                }
                                /*总分板块*/

                                ds = db.executeSqlQuery("select * from UserTopicScore where userId='" + userId + "' and topicId=" + topicId);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    db.executeSqlNonQuery("update UserTopicScore set score=" + totalScore + " where userId='" + userId + "' and topicId=" + topicId);
                                }
                                else
                                {
                                    db.executeSqlNonQuery("insert into UserTopicScore(userId,topicId,Score) values('" + userId + "'," + topicId + "," + totalScore + ")");
                                }


                                ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicScore where topicId=" + topicId);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    int totalPersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                                    ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicScore where topicId=" + topicId + " and Score<" + totalScore);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                        int beat = lessScorePersons * 100 / (totalPersons);

                                        if (totalPersons == 1)
                                            beat = 100;
                                        Panel totalScoreBeatPanel = new Panel();
                                        totalScoreBeatPanel.CssClass = "result-dimension-score-beat-panel";
                                       // weightTitle = new Label();
                                        //weightTitle.Text = "结果：";
                                        //weightTitle.CssClass = "bold-text";
                                        Label temp = new Label();
                                        string resultWord = "";
                                        if( topicId.Equals("2") )
                                        {
                                            resultWord = "整体幸福指数";
                                        }
                                        else if (topicId.Equals("5"))
                                        {
                                            resultWord = "工作满意度";
                                        }

                                        temp.Text = "您的" + resultWord + "为:"+totalScore+"分,击败了全国"+beat+"%的网友!";
                                        //totalScoreBeatPanel.Controls.Add(weightTitle);
                                        totalScoreBeatPanel.Controls.Add(temp);
                                        if (resultType != 2)
                                        {
                                            dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                        }
                                    }

                                    if(showCompare)
                                    {
                                        // 同地区
                                        ds = db.executeSqlQuery("select count(UserTopicScore.Id) as totalCount from UserTopicScore, Users where Users.userName = UserTopicScore.userId and topicId=" + topicId + " and Score<" + totalScore +" and Users.region='"+region +"'");
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                            int beat = lessScorePersons * 100 / (totalPersons);

                                            if (totalPersons == 1)
                                                beat = 100;
                                            Panel totalScoreBeatPanel = new Panel();
                                            totalScoreBeatPanel.CssClass = "result-category-score-beat-panel";
                                            Label temp = new Label();

                                            temp.Text = "按照地区:击败了" + beat + "%的老乡!";
                                            totalScoreBeatPanel.Controls.Add(temp);
                                            if (resultType != 2)
                                            {
                                                dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                            }
                                        }

                                        // 同年龄
                                        ds = db.executeSqlQuery("select count(UserTopicScore.Id) as totalCount from UserTopicScore, Users where Users.userName = UserTopicScore.userId and topicId=" + topicId + " and Score<" + totalScore + " and Users.age='" + age + "'");
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                            int beat = lessScorePersons * 100 / (totalPersons);

                                            if (totalPersons == 1)
                                                beat = 100;
                                            Panel totalScoreBeatPanel = new Panel();
                                            totalScoreBeatPanel.CssClass = "result-category-score-beat-panel";
                                            Label temp = new Label();

                                            temp.Text = "按照年龄:击败了" + beat + "%的同龄人!";
                                            totalScoreBeatPanel.Controls.Add(temp);
                                            if (resultType != 2)
                                            {
                                                dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                            }
                                        }

                                        // 同行业
                                        ds = db.executeSqlQuery("select count(UserTopicScore.Id) as totalCount from UserTopicScore, Users where Users.userName = UserTopicScore.userId and topicId=" + topicId + " and Score<" + totalScore + " and Users.industry='" + industry + "'");
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                            int beat = lessScorePersons * 100 / (totalPersons);

                                            if (totalPersons == 1)
                                                beat = 100;
                                            Panel totalScoreBeatPanel = new Panel();
                                            totalScoreBeatPanel.CssClass = "result-category-score-beat-panel";
                                            Label temp = new Label();

                                            temp.Text = "按照行业:击败了" + beat + "%的同行!";
                                            totalScoreBeatPanel.Controls.Add(temp);
                                            if (resultType != 2)
                                            {
                                                dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                            }
                                        }
                                    }
                                }

                                this.form1.Controls.Add(dimensionScorePanel);
                            }

                            Dictionary<int, string> measureMap = new Dictionary<int, string>();
                            ds = db.executeSqlQuery("select * from Measures where TopicId=" + topicId);
                            
                            for( int i = 0;i<ds.Tables[0].Rows.Count;i++)
                            {
                                int id = Convert.ToInt32(ds.Tables[0].Rows[i]["Id"]);
                                string measureName = ds.Tables[0].Rows[i]["measureName"].ToString();

                                measureMap.Add(id, measureName);
                            }

                            Dictionary<int, int> measureScores = new Dictionary<int, int>();
                            if (topicId.Equals("2"))
                            {
                                measureScores.Add(1, totalScore);
                                measureScores.Add(2, 100 - totalScore);
                                measureScores.Add(3, dimensionScores[4]);
                                measureScores.Add(4, (dimensionScores[7] + dimensionScores[15]) / 2);
                            }
                            else if (topicId.Equals("5"))
                            {
                                measureScores.Add(5,totalScore);
                                measureScores.Add(6,100-totalScore);
                                measureScores.Add(7,(dimensionScores[17] + dimensionScores[18]) / 2);
                                measureScores.Add(8, dimensionScores[20]);
                            }

                            int year = DateTime.Now.Year;
                            int month = DateTime.Now.Month;

                            Dictionary<int, int> measureBeats = new Dictionary<int, int>();
                            if(topicId.Equals("2"))
                            {
                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 1 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                int totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 1 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[1]);

                                int lessPersons = ds.Tables[0].Rows.Count;

                                if(totalPersons == 0)
                                {
                                    measureBeats.Add(1, 100);
                                }
                                else
                                {
                                    measureBeats.Add(1, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 2 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 2 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[2]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(2, 100);
                                }
                                else
                                {
                                    measureBeats.Add(2, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 3 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 3 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[3]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(3, 100);
                                }
                                else
                                {
                                    measureBeats.Add(3, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 4 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 4 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[4]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(4, 100);
                                }
                                else
                                {
                                    measureBeats.Add(4, lessPersons * 100 / totalPersons);
                                }
                            }
                            else if (topicId.Equals("5"))
                            {
                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 5 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                int totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 5 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[5]);

                                int lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(5, 100);
                                }
                                else
                                {
                                    measureBeats.Add(5, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 6 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 6 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[6]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(6, 100);
                                }
                                else
                                {
                                    measureBeats.Add(6, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 7 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 7 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[7]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(7, 100);
                                }
                                else
                                {
                                    measureBeats.Add(7, lessPersons * 100 / totalPersons);
                                }


                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 8 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId);
                                totalPersons = ds.Tables[0].Rows.Count;

                                ds = db.executeSqlQuery("select * from MeasureScores where measureId = 8 and YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and topicId=" + topicId + " and score<" + measureScores[8]);

                                lessPersons = ds.Tables[0].Rows.Count;

                                if (totalPersons == 0)
                                {
                                    measureBeats.Add(8, 100);
                                }
                                else
                                {
                                    measureBeats.Add(8, lessPersons * 100 / totalPersons);
                                }
                            }
                            
                            
                            ds = db.executeSqlQuery("select * from MeasureScores where YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and userId='" + userId + "' and topicId=" + topicId);
                            if ( ds.Tables[0].Rows.Count > 0)
                            {
                                string deleteSql = "delete from MeasureScores where YEAR(testDateTime)=" + year + " and MONTH(testDateTime)=" + month + " and userId='" + userId + "' and topicId=" + topicId;
                                db.executeSqlNonQuery(deleteSql);
                            }

                            foreach (KeyValuePair<int, int> pair in measureScores)
                            {
                                string insertSql = string.Format("insert into MeasureScores(topicId,measureId,userId,score,beats,testDateTime) values({0},{1},'{2}',{3},{4},'{5}')",
                                    topicId, pair.Key, userId, pair.Value,measureBeats[pair.Key],DateTime.Now.ToString());
                                db.executeSqlNonQuery(insertSql);
                            }

                            /*
                            //List<string> maxScoresDimensions = new List<string>();
                            //int maxScore = -9999;
                            foreach (KeyValuePair<int, int> pair in dimensionScores)
                            {
                                int dimensionId = pair.Key;
                                int dimensionScore = pair.Value;
                                string dimensionName = dimensionNames[dimensionId];

                               
                                /*
                                if (dimensionScore > maxScore)
                                {
                                    maxScore = dimensionScore;
                                }
                                ds = db.executeSqlQuery("select * from TopicDimensionScores where dimensionId=" + dimensionId + " and TopicId=" + topicId + " and minScore<=" + dimensionScore + " and maxScore>=" + dimensionScore);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    
                                }
                                else
                                {
                                    string dimensionName = dimensionNames[dimensionId];
                                    string dimensionDesc = dimensionDescs[dimensionId];

                                    Panel dimensionScorePanel = new Panel();
                                    dimensionScorePanel.CssClass = "dimension-score-panel";

                                    /*Panel dimensionImagePanel = new Panel();
                                    Image tempImg = new Image();
                                    tempImg.ImageUrl = "assets/" + dimensionImages[dimensionId];
                                    dimensionImagePanel.CssClass = "dimension-Image-panel";
                                    dimensionImagePanel.Controls.Add(tempImg);
                                    dimensionScorePanel.Controls.Add(dimensionImagePanel);

                                    Panel dimensionScoreTempPanel = new Panel();
                                    dimensionScoreTempPanel.CssClass = "dimension-score-panel-score";
                                    Label weightTitle = new Label();
                                    weightTitle.Text = "得分：";
                                    weightTitle.CssClass = "bold-text";
                                    Label temp = new Label();
                                    int dimensionTotalScore = (dimensionScores[dimensionId] * 100) / (2 * maxOptionScore);
                                    temp.Text = dimensionTotalScore + "分";
                                    
                                    dimensionScoreTempPanel.Controls.Add(weightTitle);
                                    dimensionScoreTempPanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionScoreTempPanel);*/


                                /*if (topicId.Equals("2") || topicId.Equals("5"))
                                {
                                    ds = db.executeSqlQuery("select * from UserTopicDimensionScore where userId='" + userId + "' and topicId=" + topicId + " and dimensionId=" + dimensionId);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        db.executeSqlNonQuery("update UserTopicDimensionScore set score=" + totalScore + " where userId='" + userId + "' and topicId=" + topicId + " and dimensionId=" + dimensionId);
                                    }
                                    else
                                    {
                                        db.executeSqlNonQuery("insert into UserTopicDimensionScore(userId,topicId,dimensionId,Score) values('" + userId + "'," + topicId + "," + dimensionId + "," + totalScore + ")");
                                    }


                                    ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicDimensionScore where topicId=" + topicId + " and dimensionId=" + dimensionId);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        int totalPersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                                        ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicDimensionScore where topicId=" + topicId + " and Score<" + totalScore + " and dimensionId=" + dimensionId);
                                        if (ds.Tables[0].Rows.Count > 0)
                                        {
                                            int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                            int beat = lessScorePersons * 100 / (totalPersons);

                                            if (totalPersons == 1)
                                                beat = 100;
                                            Panel totalScoreBeatPanel = new Panel();
                                            totalScoreBeatPanel.CssClass = "result-dimension-score-beat-panel";
                                            temp = new Label();
                                            temp.Text = "击败了全国" + beat + "%的选手!";
                                            weightTitle = new Label();
                                            weightTitle.Text = "比较：";
                                            weightTitle.CssClass = "bold-text";
                                            totalScoreBeatPanel.Controls.Add(weightTitle);
                                            totalScoreBeatPanel.Controls.Add(temp);
                                            dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                        }
                                    }
                                }*/

                                //this.form1.Controls.Add(dimensionScorePanel);

                            //}
                        }

                    }
                }
            }
        }
    }
}