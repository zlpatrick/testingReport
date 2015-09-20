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
            DataSet ds = db.executeSqlQuery(sql);
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
                    titleLabel.Text = "第"+order+"题: "+optionText + " ("+order+"/"+ds.Tables[0].Rows.Count+")";
                    titlePanel.CssClass = "test-title";
                    titlePanel.Controls.Add(titleLabel);

                    Panel chooseItemPanel = new Panel();
                    
                    chooseItemPanel.CssClass = "test-choose-item";
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
                        RadioButton bt = new RadioButton();
                        bt.GroupName = "RadioGroup" + order;
                        bt.ID = "RadioGroup" + order+"_RadioOption" + itemDs.Tables[0].Rows[j]["ItemPosition"].ToString();
                        bt.Text = itemDs.Tables[0].Rows[j]["ItemText"].ToString();
                        
                        if (j == 0)
                        {
                            bt.Checked = true;
                        }
                        chooseItemRadioPanel.Controls.Add(bt);
                        chooseItemPanel.Controls.Add(chooseItemRadioPanel);
                    }

                    

                    Panel buttonPanel = new Panel();
                    Button button = new Button();
                    button.ID = "button" + order;
                    if (i < ds.Tables[0].Rows.Count - 1)
                    {
                        button.Text = "下一题";
                    }
                    else
                    {
                        button.Text = "提交查看结果";
                    }

                    button.CssClass = "test-button";
                    button.Click += new EventHandler(startTest);
                    buttonPanel.Controls.Add(button);

                    panel.Controls.Add(titlePanel);
                    panel.Controls.Add(chooseItemPanel);
                    panel.Controls.Add(buttonPanel);

                    if (i == 0)
                    {
                        panel.Visible = true;
                    }
                    else
                    {
                        panel.Visible = false;
                    }
                    this.form1.Controls.Add(panel);
                }
            }
        }

        protected void startTest(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = Convert.ToInt32(button.ID.Replace("button", ""));
            int totalChooseItem = Convert.ToInt32(Request["totalChooseItem"].ToString());
            int totalOptions = Convert.ToInt32(Request["totalOptions"].ToString());

            for (int i = 1; i <= totalChooseItem; i++)
            {
                if (((RadioButton)form1.FindControl("RadioGroup" + id + "_RadioOption" + i)).Checked)
                {
                    ViewState.Add(id.ToString(), i);
                }
            }

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
                Response.Redirect("result.aspx?id=" + Request["id"].ToString() + "&userid=" + userid+"&type="+Request["type"].ToString());
            }            
        }
    }
}