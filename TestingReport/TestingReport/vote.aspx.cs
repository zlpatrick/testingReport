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
    public partial class vote : System.Web.UI.Page
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

        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            if (userid == null)
            {
                userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            }
            this.userId.Text = userid;

            
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



          
            ds = db.executeSqlQuery("select * from Topics where Id="+Request["id"]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string id = ds.Tables[0].Rows[0]["Id"].ToString();
                string title = ds.Tables[0].Rows[0]["title"].ToString();
                string contentText = ds.Tables[0].Rows[0]["introduction"].ToString();
                string introductionImg = ds.Tables[0].Rows[0]["introductionImage"].ToString();
                string topicType = ds.Tables[0].Rows[0]["topictype"].ToString();
                string totalChooseItems = ds.Tables[0].Rows[0]["totalChooseItem"].ToString().Trim();
                string totalOptions = ds.Tables[0].Rows[0]["totalOptions"].ToString();
                string introductionTitle = ds.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                string introductionContent =ds.Tables[0].Rows[0]["introductionContentImage"].ToString();
                Panel panel = new Panel();
                panel.CssClass = "content";

                
                Panel titlePanel = new Panel();
                /*Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);*/
                
                Label titleLabel = new Label();
                titleLabel.Text = title;
                titlePanel.CssClass = "test-option-page-title-text";
                titlePanel.Controls.Add(titleLabel);

                /*
                Panel introductionPanel = new Panel();
                Image introduction = new Image();
                introduction.ImageUrl = "assets/" + introductionContent;
                introductionPanel.CssClass = "test-option-page-title-img";
                introductionPanel.Controls.Add(introduction);
                

                Panel imgPanel = new Panel();
                Image image = new Image();
                image.ImageUrl = "assets/" + introductionImg;
                imgPanel.CssClass = "test-img";
                imgPanel.Controls.Add(image);*/

                Panel tempPanel = new Panel();
                tempPanel.ID = "custom-panel";

                Panel buttonPanel = new Panel();
                DateTime now = DateTime.Now;

                ds = db.executeSqlQuery("select * from MeasureScores where YEAR(testDateTime)=" + now.Year + " and MONTH(testDateTime)=" + now.Month + " and topicId=" + Request["id"] + " and userId='" + Request["userid"].ToString() + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Panel temp = new Panel();
                    Label tempLabel = new Label();
                    tempLabel.Text = "您本月已经测试过了，每月建议只测试一次，是否还要再测一次？";
                    temp.Controls.Add(tempLabel);
                    buttonPanel.Controls.Add(temp);
                }
                buttonPanel.CssClass = "test-button-div";
                Button button = new Button();
               
                button.CssClass = "test-button";
                button.Click += new EventHandler(startTest);
                buttonPanel.Controls.Add(button);

               


                panel.Controls.Add(titlePanel);
                panel.Controls.Add(tempPanel);
               // panel.Controls.Add(imgPanel);
               // panel.Controls.Add(introductionPanel);
                panel.Controls.Add(buttonPanel);
                
                this.topicId.Text = id;
                this.topicType.Text = topicType;
                this.totalChooseItems.Text = totalChooseItems;
                this.totalOptions.Text = totalOptions;
                this.form1.Controls.Add(panel);
            }
        }

        protected void startTest(object sender, EventArgs e)
        {
            string id = this.topicId.Text.ToString();
            if (id.Equals("8"))
            {
                Response.Redirect("test.aspx?id=" + id + "&type=" + this.topicType.Text.ToString() + "&totalChooseItem=" + this.totalChooseItems.Text + "&totalOptions=" + this.totalOptions.Text + "&userId=" + Request["userid"].ToString());
            }
            else if(id.Equals("1"))
            {
                Response.Redirect("test-big-five.aspx?id=" + id + "&type=" + this.topicType.Text.ToString() + "&totalChooseItem=" + this.totalChooseItems.Text + "&totalOptions=" + this.totalOptions.Text + "&userId=" + Request["userid"].ToString());
            }
            else
            {
                Response.Redirect("test.aspx?id=" + id + "&type=" + this.topicType.Text.ToString() + "&totalChooseItem=" + this.totalChooseItems.Text + "&totalOptions=" + this.totalOptions.Text + "&userId=" + Request["userid"].ToString());
            }
        }
    }
}