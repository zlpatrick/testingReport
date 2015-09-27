using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string username = this.username.Text.Trim();
            string userpass = this.userpass.Text;

            DBUtil db = new DBUtil();
            string sql = "select * from Admins where adminId='" + username + "'";
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string userpassdb = ds.Tables[0].Rows[0]["adminpass"].ToString();

                string md5pass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userpass, "MD5");
                if (userpassdb.Equals(md5pass))
                {
                    Session["admin"] = username;
                    Response.Redirect("admin-index.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('密码错了');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('用户名错了');</script>");
            }
        }
    }
}