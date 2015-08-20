﻿using System;
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
            string userId = Request["userId"].ToString();
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

                    ds = db.executeSqlQuery("select * from Votes where userId=" + userId + " and TopicId=" + topicId);
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
                        label.Text = "您的总分是" + totalScore;
                        totalScorePanel.Controls.Add(label);
                        this.form1.Controls.Add(totalScorePanel);

                        ds = db.executeSqlQuery("select * from Dimensions where TopicId=" + topicId);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Panel chartPanel = new Panel();
                            Chart chart = new Chart();
                            chart.Titles.Add(new Title("维度分析"));
                            Series series = new Series();
                            series.Name = "dimensions";
                            series["PointWidth"] = "0.5";
                            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                            {
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
                        }
                    }
                }
            }
        }
    }
}