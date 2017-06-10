using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class person_missing_guest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            this.miss.Value = Request["miss"];

            if (!IsPostBack) { 
                string sql = "select * from Users where userName='" + userid + "'";
                DBUtil db = new DBUtil();
                DataSet ds = db.executeSqlQuery(sql);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    string dbregion = ds.Tables[0].Rows[0]["region"].ToString();
                    this.gender.Value = dbregion;
                    string dbdegree = ds.Tables[0].Rows[0]["degree"].ToString();
                    this.degree.Value = dbdegree;
                    string dbmarriage = ds.Tables[0].Rows[0]["marriage"].ToString();
                    this.marriage.Value = dbmarriage;
                    string dbincome = ds.Tables[0].Rows[0]["income"].ToString();
                    this.income.Value = dbincome;
                    string dbage = ds.Tables[0].Rows[0]["age"].ToString();
                    this.age.Value = dbage;
                    string dbindustry = ds.Tables[0].Rows[0]["industry"].ToString();
                    this.industry.Value = dbindustry;
                    string dbwork = ds.Tables[0].Rows[0]["work"].ToString();
                    this.work.Value = dbwork;
                }
            }
        }

        protected void start_Click(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            string age = this.age.Value;
            string region = this.gender.Value;
            string industry = this.industry.Value;
            string income = this.income.Value;
            string degree = this.degree.Value;
            string marriage = this.marriage.Value;
            string work = this.work.Value;
            string miss = Request["miss"];
            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if ("1".Equals(miss))
                {
                    sql = string.Format("update Users set age='{0}',industry='{1}',work='{2}' where userName='{3}'", age, industry, work, userid);
                    db.executeSqlNonQuery(sql);
                }
                else if ("2".Equals(miss))
                {
                    sql = string.Format("update Users set degree='{0}',income='{1}',marriage='{2}' where userName='{3}'", degree, income, marriage, userid);
                    db.executeSqlNonQuery(sql);
                }
            }
            else
            {
                if ("1".Equals(miss))
                {
                    sql = string.Format("insert into Users(userName,regDateTime,age,industry,work) values('{0}','{1}','{2}','{3}','{4}')", userid, DateTime.Now.ToString(),
                        age, industry, work);
                    db.executeSqlNonQuery(sql);
                }

                else if ("2".Equals(miss))
                {
                    sql = string.Format("insert into Users(userName,regDateTime,income,degree,marriage) values('{0}','{1}','{2}','{3}','{4}')", userid, DateTime.Now.ToString(),
                        income, degree, marriage);
                    db.executeSqlNonQuery(sql);
                }
            }

            if ("9".Equals(Request["id"].ToString()))
            {
                Response.Redirect("world-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
            }
            else if ("10".Equals(Request["id"].ToString()))
            {
                Response.Redirect("perfect-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
            }
            else if ("2".Equals(Request["id"].ToString()))
            {
                Response.Redirect("happy-feeling-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

            }
            else if ("5".Equals(Request["id"].ToString()))
            {
                Response.Redirect("work-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

            }
            else if ("3".Equals(Request["id"].ToString()))
            {
                Response.Redirect("life-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

            }
            else if ("11".Equals(Request["id"].ToString()))
            {
                Response.Redirect("health-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());

            }
            else if ("1".Equals(Request["id"].ToString()))
            {
                Response.Redirect("big-five-result-guest.aspx?id=" + Request["id"].ToString() + "&userid=" + userid + "&type=" + Request["type"].ToString());
            }
            
        }
    }
}