using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Text;

namespace TestingReport
{
    public partial class result : System.Web.UI.Page
    {
        public string chartJsString;
        public string topicTitle;
        public string fromSource;
        public bool added = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicId = Request["id"].ToString();
            string userId = Request["userid"].ToString();
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
                Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);
                this.titleDiv.Controls.Add(titlePanel);

                if (!topicId.Equals("8"))
                {
                    Panel imgPanel = new Panel();
                    Image image = new Image();
                    image.ImageUrl = "assets/" + resultImage;
                    imgPanel.CssClass = "test-img";
                    imgPanel.Controls.Add(image);
                    this.titleDiv.Controls.Add(imgPanel);
                }
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

                                    dimensionScore += scores[choosePositionMap[optionIDInt[j]]];
                                }

                              
                                dimensionScores.Add(dimensionId, dimensionScore);
                                dimensionNames.Add(dimensionId, dimensionName);
                                dimensionDescs.Add(dimensionId, dimensionDesc);
                                dimensionImages.Add(dimensionId, dimensionImage);
                                dimensionOptionCount.Add(dimensionId, options.Length);

                                int chartScore = (dimensionScore * 100) / (options.Length * maxOptionScore);
                                if (ds.Tables[0].Rows.Count == 3)
                                {
                                    if (i % 3 == 0)
                                    {
                                        strBuilder.Append("\"").Append(dimensionName).Append(" ");
                                        chartScoreString.Add(chartScore.ToString());
                                    }
                                    else if ( i % 3 == 1 ) 
                                    {
                                        strBuilder.Append(dimensionName).Append(" ");
                                        chartScoreString.Add(chartScore.ToString());
                                    }
                                    else
                                    {
                                        strBuilder.Append(dimensionName).Append("\"");
                                        chartScoreString.Add(chartScore.ToString());
                                    }
                                }

                                if (ds.Tables[0].Rows.Count > 4)
                                {
                                    strBuilder.Append("\"").Append(dimensionName).Append("\",");
                                    strBuilder2.Append(chartScore).Append(",");
                                }
                            }

                            chartLabelString = strBuilder.ToString();
                            chartScoreRaderString = strBuilder2.ToString();

                            if(resultType == 2)
                            { 
                                StringBuilder chartJs = new StringBuilder();
                                chartJs.Append("<script>").Append("\r\n")
                                       .Append("var barChartData = {").Append("\r\n")
                           
                                       .Append("labels : [").Append("\" \"").Append("],").Append("\r\n")
                                       .Append("datasets : [").Append("\r\n");
                                if (dimensionNames.Keys.Count == 3)
                                {
                                    chartJs.Append("{").Append("\r\n")                                      
                                           .Append("fillColor : \"rgba(217,179,242,0.5)\",").Append("\r\n")
                                           .Append("strokeColor : \"rgba(217,179,242,0.8)\",").Append("\r\n")
                                           .Append("highlightFill: \"rgba(217,179,242,0.75)\",").Append("\r\n")
                                           .Append("highlightStroke: \"rgba(217,179,242,,1)\",").Append("\r\n")
                                           .Append("data : [").Append(chartScoreString[0]).Append("]").Append("\r\n")
                                           .Append("},").Append("\r\n");
                                    chartJs.Append("{").Append("\r\n")                             
                                           .Append("fillColor : \"rgba(108,198,232,0.5)\",").Append("\r\n")
                                           .Append("strokeColor : \"rgba(108,198,232,0.8)\",").Append("\r\n")
                                           .Append("highlightFill: \"rgba(108,198,232,0.75)\",").Append("\r\n")
                                           .Append("highlightStroke: \"rgba(108,198,232,1)\",").Append("\r\n")
                                           .Append("data : [").Append(chartScoreString[1]).Append("]").Append("\r\n")
                                           .Append("},").Append("\r\n");
                                    chartJs.Append("{").Append("\r\n")          
                                           .Append("fillColor : \"rgba(238,159,102,0.5)\",").Append("\r\n")
                                           .Append("strokeColor : \"rgba(238,159,102,0.8)\",").Append("\r\n")
                                           .Append("highlightFill: \"rgba(238,159,102,0.75)\",").Append("\r\n")
                                           .Append("highlightStroke: \"rgba(238,159,102,1)\",").Append("\r\n")
                                           .Append("data : [").Append(chartScoreString[2]).Append("]").Append("\r\n")
                                           .Append("}").Append("\r\n");
                                }
                                chartJs.Append("]").Append("\r\n")
                                       .Append("}").Append("\r\n")
                                       .Append("window.onload = function(){").Append("\r\n")
                                       .Append("var ctx = document.getElementById(\"canvas\").getContext(\"2d\");").Append("\r\n")
                                       .Append("window.myBar = new Chart(ctx).Bar(barChartData, {").Append("\r\n")
                                       .Append("responsive : true,").Append("\r\n")
                                       .Append("scaleGridLineColor : \"lightgrey\",").Append("\r\n")
                                       .Append("scaleGridLineWidth : 1").Append("\r\n")
                                       .Append("});").Append("\r\n")
                                       .Append("}").Append("\r\n")
                                       .Append("</script>").Append("\r\n");


                                chartJsString = chartJs.ToString();
                            }
                            else if(resultType == 3 || resultType==1)
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

                            if (resultType == 2)
                            {
                                Panel resultChartTipImagePanel = new Panel();
                                Image resultChartTipImage = new Image();
                                resultChartTipImage.ImageUrl = "assets/" + resultChart;
                                resultChartTipImagePanel.CssClass = "result-chart-tip-Image-panel";
                                resultChartTipImagePanel.Controls.Add(resultChartTipImage);
                                this.titleDiv.Controls.Add(resultChartTipImagePanel);
                            }

                            Panel dimensionTipImagePanel = new Panel();
                            Image dimensionTipImage = new Image();
                            dimensionTipImage.ImageUrl = "assets/result-tip.jpg";
                            dimensionTipImagePanel.CssClass = "result-tip-Image-panel";
                            dimensionTipImagePanel.Controls.Add(dimensionTipImage);
                            this.form1.Controls.Add(dimensionTipImagePanel);



                            if (resultType == 3)
                            {
                                Panel dimensionScorePanel = new Panel();
                                dimensionScorePanel.CssClass = "dimension-score-panel";

                                Panel dimensionImagePanel = new Panel();
                                Image tempImg = new Image();
                                tempImg.ImageUrl = "assets/totalScore.jpg";
                                dimensionImagePanel.CssClass = "dimension-Image-panel";
                                dimensionImagePanel.Controls.Add(tempImg);
                                dimensionScorePanel.Controls.Add(dimensionImagePanel);
                               

                                Panel totalScorePanel = new Panel();
                                totalScorePanel.CssClass = "dimension-score-panel-score";
                                Label weightTitle = new Label();
                                weightTitle.Text = "得分：";
                                weightTitle.CssClass = "bold-text";
                                Label label = new Label();
                                label.Text = totalScore + "分";
                                totalScorePanel.Controls.Add(weightTitle);
                                totalScorePanel.Controls.Add(label);
                                if (resultType != 2)
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
                                        weightTitle = new Label();
                                        weightTitle.Text = "比较：";
                                        weightTitle.CssClass = "bold-text";
                                        Label temp = new Label();
                                        temp.Text = "击败了全国" + beat + "%的选手!";
                                        totalScoreBeatPanel.Controls.Add(weightTitle);
                                        totalScoreBeatPanel.Controls.Add(temp);
                                        if (resultType != 2)
                                        {
                                            dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                        }
                                    }
                                }

                                this.form1.Controls.Add(dimensionScorePanel);
                            }




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


                                    /*
                                    Panel dimensionImagePanel = new Panel();
                                    Image tempImg = new Image();
                                    tempImg.ImageUrl = "assets/" + dimensionImages[dimensionId];
                                    dimensionImagePanel.CssClass = "dimension-Image-panel";
                                    dimensionImagePanel.Controls.Add(tempImg);

                                   
                                    dimensionScorePanel.Controls.Add(dimensionImagePanel);

                                    */
                                    
                                    if (!topicId.Equals("8"))
                                    {
                                        Panel dimensionNamePanel = new Panel();
                                        dimensionNamePanel.CssClass = "dimension-score-panel-score";
                                        Label weightTitle1 = new Label();
                                        weightTitle1.Text = dimensionName;
                                        weightTitle1.CssClass = "bold-text";
                                        dimensionNamePanel.Controls.Add(weightTitle1);
                                        dimensionScorePanel.Controls.Add(dimensionNamePanel);




                                        Panel dimensionScoreTempPanel = new Panel();
                                        dimensionScoreTempPanel.CssClass = "dimension-score-panel-score";
                                        Label weightTitle = new Label();
                                        weightTitle.Text = "得分：";
                                        weightTitle.CssClass = "bold-text";
                                        Label temp = new Label();
                                        temp.Text = (dimensionScores[dimensionId] * 100) / (dimensionOptionCount[dimensionId] * maxOptionScore) + "分";
                                        dimensionScoreTempPanel.Controls.Add(weightTitle);
                                        dimensionScoreTempPanel.Controls.Add(temp);
                                        dimensionScorePanel.Controls.Add(dimensionScoreTempPanel);
                                    }

                                   

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
                                                Label temp = new Label();
                                                temp.Text = "击败了全国" + beat + "%的选手!";
                                                Label weightTitle = new Label();
                                                weightTitle.Text = "比较：";
                                                weightTitle.CssClass = "bold-text";
                                                totalScoreBeatPanel.Controls.Add(weightTitle);
                                                totalScoreBeatPanel.Controls.Add(temp);
                                                dimensionScorePanel.Controls.Add(totalScoreBeatPanel);
                                            }
                                        }
                                    }
                                    
                                    if(resultType !=3 && !topicId.Equals("8"))
                                    {
                                        Panel dimensionDescPanel = new Panel();
                                        dimensionDescPanel.CssClass = "dimension-score-panel-desc";
                                        Label temp = new Label();
                                        temp.Text = dimensionDesc;
                                        Label weightTitle = new Label();
                                        weightTitle.Text = "解释：";
                                        weightTitle.CssClass = "bold-text";
                                        dimensionDescPanel.Controls.Add(weightTitle);
                                        dimensionDescPanel.Controls.Add(temp);
                                        dimensionScorePanel.Controls.Add(dimensionDescPanel);
                                       
                                    }


                                    if (topicId.Equals("8") && (!added))
                                    {
                                        string resultString = "";
                                        if (dimensionScores[21] > 0)
                                        {
                                            resultString += "E";
                                        }
                                        else
                                        {
                                            resultString += "I";
                                        }

                                        if (dimensionScores[22] > 0)
                                        {
                                            resultString += "S";
                                        }
                                        else
                                        {
                                            resultString += "N";
                                        }

                                        if (dimensionScores[23] > 0)
                                        {
                                            resultString += "T";
                                        }
                                        else
                                        {
                                            resultString += "F";
                                        }

                                        if (dimensionScores[24] > 0)
                                        {
                                            resultString += "J";
                                        }
                                        else
                                        {
                                            resultString += "P";
                                        }

                                        

                                        Panel dimensionScoreTempPanel = new Panel();
                                        dimensionScoreTempPanel.CssClass = "dimension-score-panel-score";
                                        Label weightTitle = new Label();
                                        weightTitle.Text = "人格类型：";
                                        weightTitle.CssClass = "bold-text";
                                        Label temp = new Label();
                                        temp.Text = resultString;
                                        dimensionScoreTempPanel.Controls.Add(weightTitle);
                                        dimensionScoreTempPanel.Controls.Add(temp);
                                        dimensionScorePanel.Controls.Add(dimensionScoreTempPanel);

string descString ="";

if(resultString.Equals("ISTJ"))
{ descString=
"安静、严肃，通过全面性和可靠性获得成功。实际，有责任感。决定有逻辑性，并一步步地朝着目标前进，不易分心。喜欢将工作、家庭和生活都安排得井井有条。重视传统和忠诚。";}
else if(resultString.Equals("ISFJ"))
{descString=
"安静、友好、有责任感和良知。坚定地致力于完成他们的义务。全面、勤勉、精确，忠诚、体贴，留心和记得他们重视的人的小细节，关心他人的感受。努力把工作和家庭环境营造得有序而温馨。";

}
else if(resultString.Equals("INFJ"))
{
    descString=
"寻求思想、关系、物质等之间的意义和联系。希望了解什么能够激励人，对人有很强的洞察力。有责任心，坚持自己的价值观。对于怎样更好的服务大众有清晰的远景。在对于目标的实现过程中有计划而且果断坚定。";
}
else if(resultString.Equals("INTJ"))
{ 
    descString = "在实现自己的想法和达成自己的目标时有创新的想法和非凡的动力。能很快洞察到外界事物间的规律并形成长期的远景计划。一旦决定做一件事就会开始规划并直到完成为止。多疑、独立，对于自己和他人能力和表现的要求都非常高。";
}
else if(resultString.Equals("ISTP"))
{
    descString = "灵活、忍耐力强，是个安静的观察者直到有问题发生，就会马上行动，找到实用的解决方法。分析事物运作的原理，能从大量的信息中很快的找到关键的症结所在。对于原因和结果感兴趣，用逻辑的方式处理问题，重视效率。";
}
else if(resultString.Equals("ISFP"))
{
    descString = "安静、友好、敏感、和善。享受当前。喜欢有自己的空间，喜欢能按照自己的时间表工作。对于自己的价值观和自己觉得重要的人非常忠诚，有责任心。不喜欢争论和冲突。不会将自己的观念和价值观强加到别人身上。";
}
else if(resultString.Equals("INFP"))
{
    descString = "理想主义，对于自己的价值观和自己觉得重要的人非常忠诚。希望外部的生活和自己内心的价值观是统一的。好奇心重，很快能看到事情的可能性，能成为实现想法的催化剂。寻求理解别人和帮助他们实现潜能。适应力强，灵活，善于接受，除非是有悖于自己的价值观的。";
}
else if(resultString.Equals("INTP"))
{
    descString = "对于自己感兴趣的任何事物都寻求找到合理的解释。喜欢理论性的和抽象的事物，热衷于思考而非社交活动。安静、内向、灵活、适应力强。对于自己感兴趣的领域有超凡的集中精力深度解决问题的能力。多疑，有时会有点挑剔，喜欢分析。";
}
else if(resultString.Equals("ESTP"))
{
    descString= "灵活、忍耐力强，实际，注重结果。觉得理论和抽象的解释非常无趣。喜欢积极地采取行动解决问题。注重当前，自然不做作，享受和他人在一起的时刻。喜欢物质享受和时尚。学习新事物最有效的方式是通过亲身感受和练习。";
}
else if(resultString.Equals("ESFP"))
{   
    descString = "外向、友好、接受力强。热爱生活、人类和物质上的享受。喜欢和别人一起将事情做成功。在工作中讲究常识和实用性，并使工作显得有趣。灵活、自然不做作，对于新的任何事物都能很快地适应。学习新事物最有效的方式是和他人一起尝试。";
}
else if(resultString.Equals("ENFP"))
{
    descString= "热情洋溢、富有想象力。认为人生有很多的可能性。能很快地将事情和信息联系起来，然后很自信地根据自己的判断解决问题。总是需要得到别人的认可，也总是准备着给与他人赏识和帮助。灵活、自然不做作，有很强的即兴发挥的能力，言语流畅。";
}
else if(resultString.Equals("ENTP"))
{
    descString = "反应快、睿智，有激励别人的能力，警觉性强、直言不讳。在解决新的、具有挑战性的问题时机智而有策略。善于找出理论上的可能性，然后再用战略的眼光分析。善于理解别人。不喜欢例行公事，很少会用相同的方法做相同的事情，倾向于一个接一个的发展新的爱好。";
}
else if(resultString.Equals("ESTJ"))
{
    descString = "实际、现实主义。果断，一旦下决心就会马上行动。善于将项目和人组织起来将事情完成，并尽可能用最有效率的方法得到结果。注重日常的细节。有一套非常清晰的逻辑标准，有系统性地遵循，并希望他人也同样遵循。在实施计划时强而有力。";
}
else if(resultString.Equals("ESFJ"))
{
    descString = "热心肠、有责任心、合作。希望周边的环境温馨而和谐，并为此果断地执行。喜欢和他人一起精确并及时地完成任务。事无巨细都会保持忠诚。能体察到他人在日常生活中的所需并竭尽全力帮助。希望自己和自己的所为能受到他人的认可和赏识。";
}
else if(resultString.Equals("ENFJ"))
{
    descString="热情、为他人着想、易感应、有责任心。非常注重他人的感情、需求和动机。善于发现他人的潜能，并希望能帮助他们实现。能成为个人或群体成长和进步的催化剂。忠诚，对于赞扬和批评都会积极地回应。友善、好社交。在团体中能很好地帮助他人，并有鼓舞他人的领导能力。";
}
else if (resultString.Equals("ENTJ"))
{
    descString = "坦诚、果断，有天生的领导能力。能很快看到公司/组织程序和政策中的不合理性和低效能性，发展并实施有效和全面的系统来解决问题。善于做长期的计划和目标的设定。通常见多识广，博览群书，喜欢拓广自己的知识面并将此分享给他人。在陈述自己的想法时非常强而有力。";
}






                                        Panel dimensionDescPanel = new Panel();
                                        dimensionDescPanel.CssClass = "dimension-score-panel-desc";
                                        temp = new Label();
                                        temp.Text = descString;
                                        weightTitle = new Label();
                                        weightTitle.Text = "解释：";
                                        weightTitle.CssClass = "bold-text";
                                        dimensionDescPanel.Controls.Add(weightTitle);
                                        dimensionDescPanel.Controls.Add(temp);
                                        dimensionScorePanel.Controls.Add(dimensionDescPanel);

                                        added = true;
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

                        /*if (resultType != 2)
                        {
                            Panel totalHeaderPanel = new Panel();
                            totalHeaderPanel.CssClass = "dimension-head-panel";
                            Label totalHeaderLabel = new Label();
                            totalHeaderLabel.Text = "总体说明";
                            totalHeaderPanel.Controls.Add(totalHeaderLabel);
                            this.form1.Controls.Add(totalHeaderPanel);
                        }*/


                        if (resultType != 3)
                        {/*
                            Panel totalScorePanel = new Panel();
                            totalScorePanel.CssClass = "result-total-score-panel";
                            Label label = new Label();
                            label.Text = "您的总分是：" + totalScore + "分";
                            totalScorePanel.Controls.Add(label);
                            if (resultType != 2)
                            {
                                this.form1.Controls.Add(totalScorePanel);
                            }
                            

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
                                    if (resultType != 2)
                                    {
                                        this.form1.Controls.Add(totalScoreBeatPanel);
                                    }
                                }
                            }*/
                        }

                        if (resultType != 3)
                        {
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
}