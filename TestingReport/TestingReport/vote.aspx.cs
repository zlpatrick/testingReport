using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class vote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.userId.Text = Request["userid"].ToString();
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select * from Topics where Id="+Request["id"]);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string id = ds.Tables[0].Rows[0]["Id"].ToString();
                string title = ds.Tables[0].Rows[0]["title"].ToString();
                string contentText = ds.Tables[0].Rows[0]["introduction"].ToString();
                string introductionImg = ds.Tables[0].Rows[0]["introductionImage"].ToString();
                string topicType = ds.Tables[0].Rows[0]["topictype"].ToString();
                string totalChooseItems = ds.Tables[0].Rows[0]["totalChooseItem"].ToString().Trim();
                string totalOptions = ds.Tables[0].Rows[0]["totalOptions"].ToString();
                Panel panel = new Panel();
                panel.CssClass = "content";

                Panel titlePanel = new Panel();
                Label titleLabel = new Label();
                titleLabel.Text = title;
                titlePanel.CssClass = "test-title";
                titlePanel.Controls.Add(titleLabel);

                Panel introductionPanel = new Panel();
                Label introduction = new Label();
                introduction.Text = "测试说明：本测试一共有" + totalOptions+"个测试题目。"+contentText;
                introductionPanel.CssClass = "test-introduction";
                introductionPanel.Controls.Add(introduction);


                Panel imgPanel = new Panel();
                Image image = new Image();
                image.ImageUrl = "img/" + introductionImg;
                imgPanel.CssClass = "test-img";
                imgPanel.Controls.Add(image);

                Panel buttonPanel = new Panel();
                buttonPanel.CssClass = "test-button-div";
                Button button = new Button();
                button.Text = "开始测试";
                button.CssClass = "test-button";
                button.Click += new EventHandler(startTest);
                buttonPanel.Controls.Add(button);

                panel.Controls.Add(titlePanel);
                panel.Controls.Add(introductionPanel);
                panel.Controls.Add(imgPanel);
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
            Response.Redirect("test.aspx?id="+id+"&type="+this.topicType.Text.ToString()+"&totalChooseItem="+this.totalChooseItems.Text+"&totalOptions="+this.totalOptions.Text+"&userId="+Request["userid"].ToString());
        }

    }
}