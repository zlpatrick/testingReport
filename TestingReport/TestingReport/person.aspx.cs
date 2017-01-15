using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Data;

namespace TestingReport
{
    public partial class person : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";
        public string openid = "";
        public bool profileComplete = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string code = Request["code"];
                string userid = Request["userid"];
                if (userid == null)
                {
                    if (code == null)
                    {
                        Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4f44b7d364e15070&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Fperson.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
                    }
                    else
                    {

                        userid = WeixinUtil.getUserAuthorizedId(code);
                    }
                }
                openid = userid;
                JObject obj = WeixinUtil.getUserInfo(userid);
                userImageUrl = obj.GetValue("headimgurl").ToString();
                userNickName = obj.GetValue("nickname").ToString();
              

                string sql = "select * from Users where userName='" + userid + "'";
                DBUtil db = new DBUtil();
                DataSet ds = db.executeSqlQuery(sql);

                if (ds.Tables[0].Rows.Count <= 0)
                {
                    string province = obj.GetValue("province").ToString();
                    this.gender.Value = province;
                }
                else
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


                    int total = 0;
                    if (!dbage.Equals(""))
                    {
                        total++;
                    }
                    if (!dbindustry.Equals(""))
                    {
                        total++;
                    }
                    if (!dbincome.Equals(""))
                    {
                        total++;
                    }
                    if (!dbdegree.Equals(""))
                    {            
                        total++;
                    }
                    if (!dbmarriage.Equals(""))
                    {       
                        total++;
                    }
                    if (!dbregion.Equals(""))
                    {
                        total++;
                    }
                    if (!dbwork.Equals(""))
                    {
                        total++;
                    }

                    if (total == 7)
                    {
                        profileComplete = true;
                    }
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

            string sql = "select * from Users where userName='" + userid + "'";
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                sql = string.Format("update Users set age='{0}',region='{1}',industry='{2}',degree='{3}',income='{4}',marriage='{5}',work='{6}' where userName='{7}'", age, region, industry,degree,income,marriage,work,userid);
                db.executeSqlNonQuery(sql);
            }
            else
            {
                sql = string.Format("insert into Users(userName,regDateTime,age,gender,industry,income,degree,marriage,work) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", userid, DateTime.Now.ToString(),
                    age, region, industry,income,degree,marriage,work);
                db.executeSqlNonQuery(sql);
            }
            Response.Redirect("person.aspx?userid=" + userid);
        }
    }
}