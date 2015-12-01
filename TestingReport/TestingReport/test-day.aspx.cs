using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class testday : System.Web.UI.Page
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
                    Panel titlePanel = new Panel();
                    Image titleImage = new Image();
                    titleImage.ImageUrl = "assets/" + introductionTitle;
                    titlePanel.CssClass = "test-option-page-title-img";
                    titlePanel.Controls.Add(titleImage);
                    this.form1.Controls.Add(titlePanel);
                }

                TopicSql = "select * from Dimensions where TopicId=" + id;

                ds = db.executeSqlQuery(TopicSql);

                List<int> randomOptionIds = new List<int>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string optionList = ds.Tables[0].Rows[i]["optionIdList"].ToString();
                    string[] list = optionList.Split(',');
                    List<int> integerValues = new List<int>();
                    for (int j = 0; j < list.Length; j++)
                    {
                        integerValues.Add(Convert.ToInt32(list[j]));
                    }
                    Random ran = new Random();
                    int first = ran.Next(1, integerValues.Count);
                    int second = ran.Next(1, integerValues.Count);
                    if (first == second)
                    {
                        if (first == integerValues.Count)
                            second = 1;
                        else
                            second = first + 1;
                    }
                    randomOptionIds.Add(integerValues[first - 1]);
                    randomOptionIds.Add(integerValues[second - 1]);

                }

                ds = db.executeSqlQuery(sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int currentOrder = 1;
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        int order = Convert.ToInt32(ds.Tables[0].Rows[i]["OptionOrder"].ToString());
                        if (!randomOptionIds.Contains(order))
                        {
                            continue;
                        }
                        string optionText = ds.Tables[0].Rows[i]["OptionText"].ToString();


                        Panel panel = new Panel();
                        panel.CssClass = "content";
                        panel.ID = "OptionOrder" + currentOrder;

                        Panel titlePanel = new Panel();
                        Label titleLabel = new Label();
                        titleLabel.Text = currentOrder + ": " + optionText;
                        titlePanel.CssClass = "test-title-sub";
                        titlePanel.Controls.Add(titleLabel);

                        Panel titleTotalPanel = new Panel();
                        Label titleTotalLabel = new Label();
                        titleTotalLabel.Text = "本测试共 ";
                        Label temp1 = new Label();
                        temp1.Text = "10";// ds.Tables[0].Rows.Count.ToString();
                        temp1.CssClass = "test-title-total-span";
                        Label temp2 = new Label();
                        temp2.Text = " 题";
                        titleTotalPanel.CssClass = "test-title-total";
                        titleTotalPanel.Controls.Add(titleTotalLabel);
                        titleTotalPanel.Controls.Add(temp1);
                        titleTotalPanel.Controls.Add(temp2);

                        Panel chooseItemPanel = new Panel();

                        chooseItemPanel.CssClass = "test-choose-item-day";
                        DataSet itemDs = null;
                        if (type.Equals("1"))
                        {
                            itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " order by ItemPosition asc");
                        }
                        else
                        {
                            itemDs = db.executeSqlQuery("select * from ChooseItem where TopicId=" + id + " and OptionId=" + order + " order by ItemPosition asc");
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
                            bt.ID = "RadioGroup" + currentOrder + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                            bt.Text = itemDs.Tables[0].Rows[j]["ItemText"].ToString();
                            bt.Click += new EventHandler(startTest);
                            bt.CssClass = "test-option-button";
                            bt.OnClientClick = "$('#RadioGroup" + currentOrder + "_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString() + "').addClass('test-option-button-click')";
                            chooseItemRadioPanel.Controls.Add(bt);

                            chooseItemPanel.Controls.Add(chooseItemRadioPanel);
                        }

                        panel.Controls.Add(titleTotalPanel);
                        panel.Controls.Add(titlePanel);
                        panel.Controls.Add(chooseItemPanel);


                        if (currentOrder == 1)
                        {
                            panel.Visible = true;
                        }
                        else
                        {
                            Button last = new Button();
                            last.ID = currentOrder.ToString();
                            last.CssClass = "last-option-button";
                            last.Click += new EventHandler(lastButtonClick);
                            panel.Controls.Add(last);
                            panel.Visible = false;
                        }
                        this.form1.Controls.Add(panel);
                        currentOrder++;
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
            totalOptions = 10;
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
                for (int i = 1; i <= totalOptions; i++)
                {
                    int chooseItem = Convert.ToInt32(ViewState[i.ToString()]);

                    db.executeSqlNonQuery("insert into Votes(userId,TopicId,OptionId,ChooseItemPosition) values('" + userid +
                        "'," + Request["id"].ToString() + "," + i+","+chooseItem+")");
                }
                Response.Redirect("result-day.aspx?id=" + Request["id"].ToString() + "&userid=" + userid+"&type="+Request["type"].ToString());
            }            
        }
    }
}