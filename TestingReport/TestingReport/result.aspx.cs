using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.DataVisualization;

namespace TestingReport
{
    public partial class result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicId = Request["id"].ToString();
            string userId = Request["userid"].ToString();
            string type = Request["type"].ToString();
            DBUtil db = new DBUtil();
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
                        Panel totalScorePanel = new Panel();
                        Label label = new Label();
                        label.Text = "您的总分是:" + totalScore+"分";
                        totalScorePanel.Controls.Add(label);
                        this.form1.Controls.Add(totalScorePanel);

                        ds = db.executeSqlQuery("select * from UserTopicScore where userId='" + userId + "' and topicId=" + topicId);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            db.executeSqlNonQuery("update UserTopicScore set score=" + totalScore + " where userId='" + userId + "' and topicId=" + topicId);
                        }
                        else
                        {
                            db.executeSqlNonQuery("insert into UserTopicScore(userId,topicId,Score) values('" + userId + "'," + topicId + ","+totalScore+")");
                        }

                        ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicScore where topicId=" + topicId);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            int totalPersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                            ds = db.executeSqlQuery("select count(Id) as totalCount from UserTopicScore where topicId=" + topicId + " and Score<"+totalScore);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                int lessScorePersons = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                                int beat = lessScorePersons * 100 / (totalPersons);

                                if (totalPersons == 1)
                                    beat = 100;
                                Panel totalScoreBeatPanel = new Panel();
                                Label temp = new Label();
                                label.Text = "您的总分打败了全国:" + beat + "%的选手!";
                                totalScorePanel.Controls.Add(label);
                                this.form1.Controls.Add(totalScoreBeatPanel);
                            }
                        }

                        ds = db.executeSqlQuery("select * from TopicScores where TopicId=" + topicId + " and minScore<=" + totalScore + " and maxScore>=" + totalScore);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Panel totalScoreDescPanel = new Panel();
                            Label totalScoreDesc = new Label();
                            totalScoreDesc.Text = ds.Tables[0].Rows[0]["ScoreDesc"].ToString();
                            totalScoreDescPanel.Controls.Add(totalScoreDesc);
                            this.form1.Controls.Add(totalScoreDescPanel);
                        }


                        ds = db.executeSqlQuery("select * from Dimensions where TopicId=" + topicId);
                        if (ds.Tables[0].Rows.Count > 1)
                        {
                            Panel chartPanel = new Panel();
                            Chart chart = new Chart();
                            chart.CssClass = "result-img";
                            chart.Titles.Add(new Title("维度分析图"));
                            Series series = new Series();
                            series.Name = "dimensions";
                            series["PointWidth"] = "0.5";

                            int dimensionCount = ds.Tables[0].Rows.Count;
                            if (dimensionCount >= 5)
                            {
                                series.ChartType = SeriesChartType.Radar;
                            }

                            Dictionary<int, int> dimensionScores = new Dictionary<int, int>();
                            Dictionary<int, string> dimensionNames = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionDescs = new Dictionary<int, string>();
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
                                int dimensionId = Convert.ToInt32(ds.Tables[0].Rows[i]["id"]);
                                string dimensionName = ds.Tables[0].Rows[i]["DimensionName"].ToString();
                                string dimensionDesc = ds.Tables[0].Rows[i]["DimensionDesc"].ToString();
                                string optionIdList = ds.Tables[0].Rows[i]["OptionIdList"].ToString();
                                string[] options = optionIdList.Split(',');
                                int[] optionIDInt = new int[options.Length];
                                int dimensionScore = 0;
                                for (int j = 0; j < options.Length; j++)
                                {
                                    optionIDInt[j] = Convert.ToInt32(options[j]);

                                    dimensionScore += scores[choosePositionMap[optionIDInt[j]]];
                                }

                                DataPoint point = new DataPoint(i, dimensionScore);
                                point.AxisLabel = dimensionName;
                                series.Points.Add(point);
                                dimensionScores.Add(dimensionId, dimensionScore);
                                dimensionNames.Add(dimensionId, dimensionName);
                                dimensionDescs.Add(dimensionId, dimensionDesc);
                            }      
                            chart.Series.Add(series);
                        
                            ChartArea chartArea = new ChartArea("result");
                            chartArea.AxisX = new Axis();
                            chartArea.AxisX.Name = "X";
                            chartArea.AxisY = new Axis();
                            chartArea.AxisY.Name = "Y";
                            chart.ChartAreas.Add(chartArea);
                            chartPanel.Controls.Add(chart);
                            this.form1.Controls.Add(chartPanel);

                            foreach(KeyValuePair<int,int> pair in dimensionScores)
                            {
                                int dimensionId = pair.Key;
                                int dimensionScore = pair.Value;
                                ds = db.executeSqlQuery("select * from TopicDimensionScores where dimensionId=" + dimensionId + " and TopicId=" + topicId + " and minScore<=" + dimensionScore + " and maxScore>=" + dimensionScore);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    string dimensionName = dimensionNames[dimensionId];
                                    string dimensionDesc = dimensionDescs[dimensionId];
                                    string dimensionScoreDesc = ds.Tables[0].Rows[0]["ScoreDesc"].ToString();

                                    Panel dimensionScorePanel = new Panel();
                                    dimensionScorePanel.CssClass = "dimension-score-panel";

                                    Panel dimensionNamePanel = new Panel();
                                    Label temp = new Label();
                                    temp.Text = dimensionName;
                                    dimensionNamePanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionNamePanel);

                                    Panel dimensionDescPanel = new Panel();
                                    temp = new Label();
                                    temp.Text = dimensionDesc;
                                    dimensionDescPanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionDescPanel);

                                    Panel dimensionScoreDescPanel = new Panel();
                                    temp = new Label();
                                    temp.Text = dimensionScoreDesc;
                                    dimensionScoreDescPanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionScoreDescPanel);

                                    this.form1.Controls.Add(dimensionScorePanel);
                                }
                                else
                                {
                                    string dimensionName = dimensionNames[dimensionId];
                                    string dimensionDesc = dimensionDescs[dimensionId];
                                    Panel dimensionScorePanel = new Panel();
                                    dimensionScorePanel.CssClass = "dimension-score-panel";

                                    Panel dimensionNamePanel = new Panel();
                                    Label temp = new Label();
                                    temp.Text = dimensionName + "的得分:" + dimensionScore;
                                    dimensionNamePanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionNamePanel);

                                    Panel dimensionDescPanel = new Panel();
                                    temp = new Label();
                                    temp.Text = dimensionDesc;
                                    dimensionDescPanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionDescPanel);

                                    this.form1.Controls.Add(dimensionScorePanel);
                                }
                            }             
                        }
                    }
                }
            }
        }
    }
}