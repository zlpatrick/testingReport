using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"].ToString();
            string type = Request["type"].ToString();
            string sql = "select * from Options where topicId=" + id + " order by OptionOrder asc";

            DBUtil db = new DBUtil();

            string TopicSql = "select * from Topics where Id=" + id;
            DataSet ds = db.executeSqlQuery(TopicSql);
            if(ds.Tables[0].Rows.Count>0)
            {
                string introductionTitle = ds.Tables[0].Rows[0]["introductionTitleImage"].ToString();
                Panel titlePanel = new Panel();
                /*Image titleImage = new Image();
                titleImage.ImageUrl = "assets/" + introductionTitle;
                titlePanel.CssClass = "test-option-page-title-img";
                titlePanel.Controls.Add(titleImage);
                this.form1.Controls.Add(titlePanel);*/

                string title = ds.Tables[0].Rows[0]["title"].ToString();

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


                    Panel panel = new Panel();
                    panel.CssClass = "content";
                    panel.ID = "OptionOrder" + order;

                    Panel titlePanel = new Panel();
                    Label titleLabel = new Label();
                    titleLabel.Text = order+": "+optionText ;
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
                    
                    chooseItemPanel.CssClass = "test-choose-item";
                    DataSet itemDs = null;
                    if (type.Equals("1"))
                    {
                        itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " order by ItemPosition desc");
                    }
                    else
                    {
                        itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " and OptionId=" + order + " order by ItemPosition desc");
                    }
                   
                    
                    for (int j = 0; j < itemDs.Tables[0].Rows.Count; j++)
                    {
                        Panel chooseItemRadioPanel = new Panel();
                       /* RadioButton bt = new RadioButton();
                        bt.GroupName = "RadioGroup" + order;
                        bt.ID = "RadioGroup" + order+"_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                        bt.Text = itemDs.Tables[0].Rows[j]["ItemText"].ToString();
                        bt.AutoPostBack = true;
                        bt.CheckedChanged += new EventHandler(startTest);
                        chooseItemRadioPanel.Controls.Add(bt);*/

                        //chooseItemRadioPanel.ID = "RadioGroup" + order + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                        //chooseItemRadioPanel.


                        Button bt = new Button();
                        bt.ID = "RadioGroup" + order + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                        bt.Text = itemDs.Tables[0].Rows[j]["ItemText"].ToString();
                        bt.Click += new EventHandler(startTest);
                        bt.CssClass = "test-option-button";
                        bt.OnClientClick = "$('#RadioGroup" + order + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString() + "').addClass('test-option-button-click')";
                        chooseItemRadioPanel.Controls.Add(bt);
                        
                        chooseItemPanel.Controls.Add(chooseItemRadioPanel);
                    }

                    panel.Controls.Add(titleTotalPanel);
                    panel.Controls.Add(titlePanel);         
                    panel.Controls.Add(chooseItemPanel);
                    

                    if (i == 0)
                    {
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
            form1.FindControl("OptionOrder" + id).Visible = true ;
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
            /*for (int i = 1; i <= totalChooseItem; i++)
            {
                if (((RadioButton)form1.FindControl("RadioGroup" + id + "_RadioOption" + i)).Checked)
                {
                    ViewState.Add(id.ToString(), i);
                }
            }*/

            form1.FindControl("OptionOrder" + id).Visible = false;
            if (id< totalOptions)
            {
                form1.FindControl("OptionOrder" + (id+ 1)).Visible = true;
            }
            else
            {
                string userid=Request["userId"].ToString();
                DBUtil db = new DBUtil();
                db.executeSqlNonQuery("delete from Votes where userId='" + userid + "' and TopicId=" + Request["id"].ToString());
                DateTime now = DateTime.Now;
                for (int i = 1; i <= totalOptions; i++)
                {
                    int chooseItem = Convert.ToInt32(ViewState[i.ToString()]);

                    db.executeSqlNonQuery("insert into Votes(userId,TopicId,OptionId,ChooseItemPosition) values('" + userid +
                        "'," + Request["id"].ToString() + "," + i+","+chooseItem+")");
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

                if(missingType == 1)
                {
                    Response.Redirect("person-missing.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString()+"&miss=1");
                }
                else if (missingType == 2)
                {
                    Response.Redirect("person-missing.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString() + "&miss=2");
                }

                if ("9".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("world-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
                }
                else if("10".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("perfect-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
                }
                else if( "2".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("happy-feeling-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

                }
                else if ("5".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("work-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

                }
                else if ("3".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("life-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

                }
                else if ("11".Equals(Request["id"].ToString()))
                {
                    Response.Redirect("health-result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

                }
               
                else
                {
                    Response.Redirect("result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
                }
            }            
        }
    }
}