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
                string introductionTitle = ds.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                string introductionContent =ds.Tables[0].Rows[0]["introductionContentImage"].ToString();
                Panel panel = new Panel();
                panel.CssClass = "content";

                Panel titlePanel = new Panel();
                Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);

                Panel introductionPanel = new Panel();
                Image introduction = new Image();
                introduction.ImageUrl = "assets/" + introductionContent;
                introductionPanel.CssClass = "test-option-page-title-img";
                introductionPanel.Controls.Add(introduction);


                Panel imgPanel = new Panel();
                Image image = new Image();
                image.ImageUrl = "assets/" + introductionImg;
                imgPanel.CssClass = "test-img";
                imgPanel.Controls.Add(image);

                Panel buttonPanel = new Panel();
                buttonPanel.CssClass = "test-button-div";
                Button button = new Button();
               
                button.CssClass = "test-button";
                button.Click += new EventHandler(startTest);
                buttonPanel.Controls.Add(button);

                panel.Controls.Add(titlePanel);
                
                panel.Controls.Add(imgPanel);
                panel.Controls.Add(introductionPanel);
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
            Response.Redirect("test-day.aspx?id="+id+"&type="+this.topicType.Text.ToString()+"&totalChooseItem="+this.totalChooseItems.Text+"&totalOptions="+this.totalOptions.Text+"&userId="+Request["userid"].ToString());
        }

    }
}