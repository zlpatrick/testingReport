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
    public partial class vote_guest : System.Web.UI.Page
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
        public string topicIdNumber = "";
        public string topicTitle = "";
        public string topicIdString = "";
        public string uuid = "";

        public List<string> radarDimNames = new List<string>();
        public List<float> radarDimScores = new List<float>();
        public List<float> radarAveScores = new List<float>();
        protected void Page_Load(object sender, EventArgs e)
        {

            string topicId = Request["id"];
            string userid = Request["userid"];
            string token = Request["token"];
            this.userId.Text = userid;
            uuid = userid;

            JObject obj = WeixinUtil.getUserInfo(userid, token);
    
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

            topicIdString = Request["id"];


            ds = db.executeSqlQuery("select * from Topics where Id=" + Request["id"]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string id = ds.Tables[0].Rows[0]["Id"].ToString();
                string title = ds.Tables[0].Rows[0]["title"].ToString();
                topicIdNumber = id;
                topicTitle = title;

                string contentText = ds.Tables[0].Rows[0]["introduction"].ToString();
                string introductionImg = ds.Tables[0].Rows[0]["introductionImage"].ToString();
                string topicType = ds.Tables[0].Rows[0]["topictype"].ToString();
                string totalChooseItems = ds.Tables[0].Rows[0]["totalChooseItem"].ToString().Trim();
                string totalOptions = ds.Tables[0].Rows[0]["totalOptions"].ToString();


                 Button button = new Button();

                 button.CssClass = "test-button";
                 button.Click += new EventHandler(startTest);
                 buttonArea.Controls.Add(button);

                this.topicId.Text = id;
                this.topicType.Text = topicType;
                this.totalChooseItems.Text = totalChooseItems;
                this.totalOptions.Text = totalOptions;
                // this.form1.Controls.Add(panel);
            }

        }

        protected void startTest(object sender, EventArgs e)
        {
            string id = this.topicId.Text.ToString();

            if (id.Equals("1"))
            {
                Response.Redirect("test-big-five-guest.aspx?id=" + id + "&type=" + this.topicType.Text.ToString() + "&totalChooseItem=" + this.totalChooseItems.Text + "&totalOptions=" + this.totalOptions.Text + "&userId=" + Request["userid"].ToString() + "&token=" + Request["token"]);
            }
            else
            {
                Response.Redirect("test-guest.aspx?id=" + id + "&type=" + this.topicType.Text.ToString() + "&totalChooseItem=" + this.totalChooseItems.Text + "&totalOptions=" + this.totalOptions.Text + "&userId=" + Request["userid"].ToString()+"&token="+Request["token"]);
            }
        }

      
    }
}