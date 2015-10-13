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

namespace TestingReport
{
    public partial class result : System.Web.UI.Page
    {
        public string chartJsString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicId = Request["id"].ToString();
            string userId = Request["userid"].ToString();
            string type = Request["type"].ToString();
            DBUtil db = new DBUtil();
          
            int resultType = 1;
            DataSet dst = db.executeSqlQuery("select * from Topics where Id=" + topicId);
            int maxOptionScore = -1;
            int totalChooseItem = -1;
            if (dst.Tables[0].Rows.Count > 0)
            {
                resultType = Convert.ToInt32(dst.Tables[0].Rows[0]["resulttype"].ToString());
                string introductionTitle = dst.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                string resultImage = dst.Tables[0].Rows[0]["resultPageImage"].ToString();
                totalChooseItem = Convert.ToInt32(dst.Tables[0].Rows[0]["TotalChooseItem"]);


                try
                {
                    maxOptionScore = Convert.ToInt32(dst.Tables[0].Rows[0]["optionMaxScore"]);
                }
                catch (Exception ex)
                {
                    maxOptionScore = totalChooseItem;
                }

                Panel titlePanel = new Panel();
                Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);
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
                            /*Panel chartPanel = new Panel();
                            chartPanel.CssClass = "result-img-panel";
                            Chart chart = new Chart();
                            chart.CssClass = "result-img";
                            chart.Width = 300;
                            Title chartTitle = new Title("维度分析");
                            chartTitle.ForeColor = System.Drawing.Color.Gray;
                            

                            chart.Titles.Add(chartTitle);
                            Series series = new Series();
                            series.Name = "dimensions";
                            series["PointWidth"] = "0.5";
                            series["DrawingStyle"] = "Cylinder";*/

                            int dimensionCount = ds.Tables[0].Rows.Count;
                            /*if (dimensionCount >= 5)
                            {
                                series.ChartType = SeriesChartType.Radar;
                            }*/

                            Dictionary<int, int> dimensionScores = new Dictionary<int, int>();
                            Dictionary<int, string> dimensionNames = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionDescs = new Dictionary<int, string>();
                            Dictionary<int, string> dimensionImages = new Dictionary<int, string>();
                            Dictionary<int, int> dimensionOptionCount = new Dictionary<int, int>();

                            string chartLabelString = "";
                            string chartScoreString = "";
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

                                    dimensionScore += scores[choosePositionMap[optionIDInt[j]]];
                                }

                                //DataPoint point = new DataPoint(i, dimensionScore);
                                //point.AxisLabel = dimensionName;
                                
                                //series.Points.Add(point);
                                dimensionScores.Add(dimensionId, dimensionScore);
                                dimensionNames.Add(dimensionId, dimensionName);
                                dimensionDescs.Add(dimensionId, dimensionDesc);
                                dimensionImages.Add(dimensionId, dimensionImage);
                                dimensionOptionCount.Add(dimensionId, options.Length);

                                int chartScore = (dimensionScore * 100) / (options.Length * maxOptionScore);
                                chartLabelString += "\" \",\""+dimensionName+"\",";
                                chartScoreString += "0,"+chartScore.ToString()+",";
                            }      
                            chartLabelString = chartLabelString.Substring(0,chartLabelString.Length-1);
                            chartScoreString = chartScoreString.Substring(0,chartScoreString.Length-1);
                            /*chart.Series.Add(series);
                        
                            ChartArea chartArea = new ChartArea("result");
                            chartArea.BackColor = System.Drawing.Color.WhiteSmoke;
                            chartArea.BackSecondaryColor = System.Drawing.Color.White;
                            chartArea.ShadowColor = System.Drawing.Color.Transparent;
                            
                            chartArea.Area3DStyle = new ChartArea3DStyle();
                            chartArea.Area3DStyle.Enable3D = true;
                            chartArea.Area3DStyle.IsRightAngleAxes = false;
                            chartArea.Area3DStyle.Rotation = 10;
                            chartArea.Area3DStyle.Inclination = 15;
                            chartArea.AxisX = new Axis();
                            chartArea.AxisX.Name = "X";
                            chartArea.AxisY = new Axis();
                            chartArea.AxisY.Name = "Y";
                            chart.ChartAreas.Add(chartArea);
                            chartPanel.Controls.Add(chart);
                            this.form1.Controls.Add(chartPanel);

                            */


                            StringBuilder chartJs = new StringBuilder();
                            chartJs.Append("<script>").Append("\r\n")
                                   .Append("var barChartData = {").Append("\r\n")
                                   .Append("labels : [").Append(chartLabelString).Append("],").Append("\r\n")
                                   .Append("datasets : [").Append("\r\n")
                                   .Append("{").Append("\r\n")
                                   .Append("barStrokeWidth : \"2\",").Append("\r\n")
                                   .Append("fillColor : \"rgba(151,187,205,0.5)\",").Append("\r\n")
                                   .Append("strokeColor : \"rgba(151,187,205,0.8)\",").Append("\r\n")
                                   .Append("highlightFill: \"rgba(151,187,205,0.75)\",").Append("\r\n")
                                   .Append("highlightStroke: \"rgba(151,187,205,1)\",").Append("\r\n")
                                   .Append("data : [").Append(chartScoreString).Append("]").Append("\r\n")
                                   .Append("}").Append("\r\n")
                                   .Append("]").Append("\r\n")
                                   .Append("}").Append("\r\n")
                                   .Append("window.onload = function(){").Append("\r\n")
                                   .Append("var ctx = document.getElementById(\"canvas\").getContext(\"2d\");").Append("\r\n")
                                   .Append("window.myBar = new Chart(ctx).Bar(barChartData, {").Append("\r\n")
                                   .Append("responsive : true").Append("\r\n")
                                   .Append("});").Append("\r\n")
                                   .Append("}").Append("\r\n")
                                   .Append("</script>").Append("\r\n");


                            chartJsString = chartJs.ToString();

                            /*Panel dimentionHeadPanel = new Panel();
                            dimentionHeadPanel.CssClass = "dimension-head-panel";
                            Label dimentionHeadLabel = new Label();
                            dimentionHeadLabel.Text = "维度说明";
                            
                            dimentionHeadPanel.Controls.Add(dimentionHeadLabel);
                            this.form1.Controls.Add(dimentionHeadPanel);*/

                            Panel dimensionTipImagePanel = new Panel();
                            Image dimensionTipImage = new Image();
                            dimensionTipImage.ImageUrl = "assets/result-tip.jpg";
                            dimensionTipImagePanel.CssClass = "result-tip-Image-panel";
                            dimensionTipImagePanel.Controls.Add(dimensionTipImage);
                            this.form1.Controls.Add(dimensionTipImagePanel);

                            List<string> maxScoresDimensions = new List<string>();
                            int maxScore = -9999;
                            foreach(KeyValuePair<int,int> pair in dimensionScores)
                            {
                                int dimensionId = pair.Key;
                                int dimensionScore = pair.Value;
                                if (dimensionScore > maxScore)
                                {
                                    maxScore = dimensionScore;
                                }
                                ds = db.executeSqlQuery("select * from TopicDimensionScores where dimensionId=" + dimensionId + " and TopicId=" + topicId + " and minScore<=" + dimensionScore + " and maxScore>=" + dimensionScore);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    string dimensionName = dimensionNames[dimensionId];
                                    string dimensionDesc = dimensionDescs[dimensionId];
                                    string dimensionScoreDesc = ds.Tables[0].Rows[0]["ScoreDesc"].ToString();

                                    Panel dimensionScorePanel = new Panel();
                                    dimensionScorePanel.CssClass = "dimension-score-panel";

                                    Panel dimensionImagePanel = new Panel();
                                    Image tempImg = new Image();
                                    tempImg.ImageUrl = "assets/"+dimensionImages[dimensionId];
                                    dimensionImagePanel.CssClass = "dimension-Image-panel";
                                    dimensionImagePanel.Controls.Add(tempImg);
                                    dimensionScorePanel.Controls.Add(dimensionImagePanel);

                                    Panel dimensionDescPanel = new Panel();
                                    Label temp = new Label();
                                    temp.Text = dimensionDesc;
                                    dimensionDescPanel.CssClass = "dimension-score-panel-desc";
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

                                    Panel dimensionImagePanel = new Panel();
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
                                    temp.Text = (dimensionScores[dimensionId]*100) / (dimensionOptionCount[dimensionId]*maxOptionScore) +"分";
                                    dimensionScoreTempPanel.Controls.Add(weightTitle);
                                    dimensionScoreTempPanel.Controls.Add(temp);
                                    dimensionScorePanel.Controls.Add(dimensionScoreTempPanel);


                                    if (resultType == 3 || resultType == 2)
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
                                                temp.Text = "本维度得分打败了全国" + beat + "%的选手!";
                                                weightTitle = new Label();
                                                weightTitle.Text = "比较：";
                                                weightTitle.CssClass = "bold-text";
                                                totalScoreBeatPanel.Controls.Add(weightTitle);
                                                totalScoreBeatPanel.Controls.Add(temp);
                                                dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                            }
                                        }
                                    }
                                    
                                    if(resultType !=3)
                                    {
                                        Panel dimensionDescPanel = new Panel();
                                        dimensionDescPanel.CssClass = "dimension-score-panel-desc";
                                        temp = new Label();
                                        temp.Text = dimensionDesc;
                                        weightTitle = new Label();
                                        weightTitle.Text = "解释：";
                                        weightTitle.CssClass = "bold-text";
                                        dimensionDescPanel.Controls.Add(weightTitle);
                                        dimensionDescPanel.Controls.Add(temp);
                                        dimensionScorePanel.Controls.Add(dimensionDescPanel);
                                       
                                    }

                                    this.form1.Controls.Add(dimensionScorePanel);
                                }
                            }

                            

                            /*if (resultType == 2)
                            {
                                string maxScoreDimensions = "";
                                foreach (KeyValuePair<int, int> pair in dimensionScores)
                                {
                                    int dimensionId = pair.Key;
                                    int dimensionScore = pair.Value;
                                    if (dimensionScore == maxScore)
                                    {
                                        maxScoreDimensions += dimensionNames[dimensionId] + "&nbsp";
                                    }
                                }

                                
                                Panel dimensionTotalPanel = new Panel();
                                dimensionTotalPanel.CssClass = "dimension-head-panel";
                                Label dimensionTotalLabel = new Label();
                                dimensionTotalLabel.Text = "总体说明";
                                dimensionTotalPanel.Controls.Add(dimensionTotalLabel);
                                this.form1.Controls.Add(dimensionTotalPanel);

                                Panel tempPanel = new Panel();
                                Label totalScoreDesc = new Label();
                                tempPanel.CssClass = "dimension-total-desc";
                                totalScoreDesc.Text = "总体上你状态处于：" + maxScoreDimensions;
                                tempPanel.Controls.Add(totalScoreDesc);
                                this.form1.Controls.Add(tempPanel);
                                
                            }*/
                        }

                        if (resultType != 2)
                        {
                            Panel totalHeaderPanel = new Panel();
                            totalHeaderPanel.CssClass = "dimension-head-panel";
                            Label totalHeaderLabel = new Label();
                            totalHeaderLabel.Text = "总体说明";
                            totalHeaderPanel.Controls.Add(totalHeaderLabel);
                            this.form1.Controls.Add(totalHeaderPanel);
                        }

                        Panel totalScorePanel = new Panel();
                        totalScorePanel.CssClass = "result-total-score-panel";
                        Label label = new Label();
                        label.Text = "您的总分是：" + totalScore + "分";
                        totalScorePanel.Controls.Add(label);
                        if (resultType != 2 )
                        {
                            this.form1.Controls.Add(totalScorePanel);
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
                                totalScoreBeatPanel.CssClass = "result-total-score-beat-panel";
                                Label temp = new Label();
                                temp.Text = "您的总分打败了全国" + beat + "%的选手!";
                                totalScoreBeatPanel.Controls.Add(temp);
                                if (resultType != 2 )
                                {
                                    this.form1.Controls.Add(totalScoreBeatPanel);
                                }
                            }
                        }

                        ds = db.executeSqlQuery("select * from TopicScores where TopicId=" + topicId + " and minScore<=" + totalScore + " and maxScore>=" + totalScore);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Panel totalScoreDescPanel = new Panel();
                            totalScoreDescPanel.CssClass = "result-total-score-desc-panel";
                            Label totalScoreDesc = new Label();
                            if (resultType == 3)
                            {
                                totalScoreDesc.Text = "您的生活满意度为：" + ds.Tables[0].Rows[0]["ScoreDesc"].ToString();
                            }
                            else
                            {
                                totalScoreDesc.Text = ds.Tables[0].Rows[0]["ScoreDesc"].ToString();
                            }
                            totalScoreDescPanel.Controls.Add(totalScoreDesc);
                            this.form1.Controls.Add(totalScoreDescPanel);
                        }
                    }
                }
            }
        }
    }
}