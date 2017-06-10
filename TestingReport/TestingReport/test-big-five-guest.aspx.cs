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
    public partial class test_big_five_guest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"].ToString();
            string type = Request["type"].ToString();
            string sql = "select * from Options where topicId=" + id + " order by OptionOrder asc";

            DBUtil db = new DBUtil();

            string TopicSql = "select * from Topics where Id=" + id;
            DataSet ds = db.executeSqlQuery(TopicSql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string introductionTitle = ds.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                string title = ds.Tables[0].Rows[0]["title"].ToString();
                Panel titlePanel = new Panel();
                /*Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);*/

                Label titleLabel = new Label();
                titleLabel.Text = title;
                titlePanel.CssClass = "test-option-page-title-text";
                titlePanel.Controls.Add(titleLabel);
                this.form1.Controls.Add(titlePanel);
            }
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    int order = Convert.ToInt32(ds.Tables[0].Rows[i]["OptionOrder"].ToString());
                    string optionText = ds.Tables[0].Rows[i]["OptionText"].ToString();
                    string topEdge = ds.Tables[0].Rows[i]["EdgeTop"].ToString();
                    string bottomEdge = ds.Tables[0].Rows[i]["EdgeBottom"].ToString();


                    Panel panel = new Panel();
                    panel.CssClass = "content";
                    panel.ID = "OptionOrder" + order;

                    Panel titlePanel = new Panel();
                    Label titleLabel = new Label();
                    titleLabel.Text = order + ": " + optionText;
                    titlePanel.CssClass = "test-title-sub";
                    titlePanel.Controls.Add(titleLabel);

                    Panel titleTotalPanel = new Panel();
                    Label titleTotalLabel = new Label();
                    titleTotalLabel.Text = "本测试共 ";
                    Label temp1 = new Label();
                    temp1.Text = ds.Tables[0].Rows.Count.ToString();
                    temp1.CssClass = "test-title-total-span";
                    Label temp2 = new Label();
                    temp2.Text = " 题";
                    titleTotalPanel.CssClass = "test-title-total";
                    titleTotalPanel.Controls.Add(titleTotalLabel);
                    titleTotalPanel.Controls.Add(temp1);
                    titleTotalPanel.Controls.Add(temp2);

                    Panel chooseItemPanel = new Panel();

                    chooseItemPanel.CssClass = "test-choose-item test-choose-item-left";

                    Panel chooseItemPanelRight = new Panel();

                    chooseItemPanelRight.CssClass = "test-choose-item test-choose-item-right";
                    DataSet itemDs = null;
                    if (type.Equals("1"))
                    {
                        itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " order by ItemPosition asc");
                    }
                    else
                    {
                        itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " and OptionId=" + order + " order by ItemPosition asc");
                    }

                    Panel topEdgePanel = new Panel();
                    topEdgePanel.CssClass = "edge";
                    Label topLabel = new Label();
                    topLabel.Text = "▪ " + topEdge;
                    topLabel.CssClass = "edge-left";
                    topEdgePanel.Controls.Add(topLabel);

                    Label middleLabel = new Label();
                    middleLabel.Text = "V.S.";
                    middleLabel.CssClass = "edge-middle";
                    topEdgePanel.Controls.Add(middleLabel);

                    Label rightLabel = new Label();
                    rightLabel.Text = bottomEdge + " ▪";
                    rightLabel.CssClass = "edge-right";
                    topEdgePanel.Controls.Add(rightLabel);

                    for (int j = 0; j < itemDs.Tables[0].Rows.Count; j++)
                    {
                        Panel chooseItemRadioPanel = new Panel();

                        if (j < 3)
                        {
                            chooseItemRadioPanel.CssClass = "test-option-left";
                        }
                        else
                        {
                            chooseItemRadioPanel.CssClass = "test-option-right";
                        }
                        Button bt = new Button();
                        bt.ID = "RadioGroup" + order + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                        bt.Text = itemDs.Tables[0].Rows[j]["ItemText"].ToString();
                        bt.Click += new EventHandler(startTest);
                        bt.CssClass = "test-option-button";
                        bt.OnClientClick = "$('#RadioGroup" + order + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString() + "').addClass('test-option-button-click')";
                        chooseItemRadioPanel.Controls.Add(bt);

                        if (j < 3)
                        {
                            chooseItemPanel.Controls.Add(chooseItemRadioPanel);
                        }
                        else
                        {
                            chooseItemPanelRight.Controls.Add(chooseItemRadioPanel);
                        }


                    }

                    panel.Controls.Add(titleTotalPanel);
                    panel.Controls.Add(titlePanel);



                    Panel rightPanel = new Panel();
                    rightPanel.Controls.Add(topEdgePanel);
                    rightPanel.Controls.Add(chooseItemPanel);
                    rightPanel.Controls.Add(chooseItemPanelRight);

                    panel.Controls.Add(rightPanel);


                    if (i == 0)
                    {
                        Panel tempPanels = new Panel();
                        tempPanels.CssClass = "bottom-choose-item-panel";
                        Label l = new Label();
                        l.Text = "答案中是两个对立的维度，请先选择符合你的维度，再选择符合的程度。举例：如果你是一个特别健谈的人，在“健谈的”维度下，选择“非常符合”这个选项。";
                        tempPanels.Controls.Add(l);
                        panel.Controls.Add(tempPanels); ;

                        panel.Visible = true;
                    }
                    else
                    {
                        Button last = new Button();
                        last.ID = order.ToString();
                        last.CssClass = "last-option-button";
                        last.Click += new EventHandler(lastButtonClick);
                        panel.Controls.Add(last);
                        panel.Visible = false;
                    }
                    this.form1.Controls.Add(panel);
                }
            }
        }

        protected void lastButtonClick(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = Convert.ToInt32(button.ID);
            form1.FindControl("OptionOrder" + id).Visible = false;
            id--;
            form1.FindControl("OptionOrder" + id).Visible = true;
        }

        protected void startTest(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string[] ids = button.ID.Split('_');
            int id = Convert.ToInt32(ids[0].Replace("RadioGroup", ""));
            int checkedindex = Convert.ToInt32(ids[1].Replace("RadioOption", ""));
            int totalChooseItem = Convert.ToInt32(Request["totalChooseItem"].ToString());
            int totalOptions = Convert.ToInt32(Request["totalOptions"].ToString());
            if (ViewState[id.ToString()] == null)
            {
                ViewState.Add(id.ToString(), checkedindex);
            }
            else
            {
                ViewState[id.ToString()] = checkedindex;
            }


            form1.FindControl("OptionOrder" + id).Visible = false;
            if (id < totalOptions)
            {
                form1.FindControl("OptionOrder" + (id + 1)).Visible = true;
            }
            else
            {
                string userid = Request["userId"].ToString();
                DBUtil db = new DBUtil();
                db.executeSqlNonQuery("delete from Votes where userId='" + userid + "' and TopicId=" + Request["id"].ToString());
                DateTime now = DateTime.Now;
                for (int i = 1; i <= totalOptions; i++)
                {
                    int chooseItem = Convert.ToInt32(ViewState[i.ToString()]);

                    db.executeSqlNonQuery("insert into Votes(userId,TopicId,OptionId,ChooseItemPosition) values('" + userid +
                        "'," + Request["id"].ToString() + "," + i + "," + chooseItem + ")");
                    db.executeSqlNonQuery("insert into VotesHistory(userId,TopicId,OptionId,ChooseItemPosition,voteDateTime) values('" + userid +
                     "'," + Request["id"].ToString() + "," + i + "," + chooseItem + ",'" + now.ToString() + "')");
                }

                DataSet ds = db.executeSqlQuery("select * from Users where userName='" + userid + "'");
                int missingType = 0;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    string age = ds.Tables[0].Rows[0]["age"].ToString();
                    string industry = ds.Tables[0].Rows[0]["industry"].ToString();
                    string income = ds.Tables[0].Rows[0]["income"].ToString();
                    string degree = ds.Tables[0].Rows[0]["degree"].ToString();
                    string marriage = ds.Tables[0].Rows[0]["marriage"].ToString();
                    string workString = ds.Tables[0].Rows[0]["work"].ToString();


                    if (age.Equals("") || industry.Equals("") || workString.Equals(""))
                    {
                        missingType = 1;
                    }
                    else if (income.Equals("") || degree.Equals("") || marriage.Equals(""))
                    {
                        missingType = 2;
                    }
                }

                if (missingType == 1)
                {
                    Response.Redirect("person-missing-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString() + "&miss=1");
                }
                else if (missingType == 2)
                {
                    Response.Redirect("person-missing-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString() + "&miss=2");
                }

                Response.Redirect("big-five-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString() + "&token=" + Request["token"]);
            }
        }
    }
}