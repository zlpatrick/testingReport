using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.

namespace TestingReport
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string adminId = this.adminName.Text.Trim();
            string adminpass = this.adminPass.Text;

            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select * from Admins where adminId='" + adminId + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string adminpassDb = ds.Tables[0].Rows[0]["adminpass"].ToString();
                if(adminpassDb.Equals(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(adminpass, "MD5"))
                {
                    Session["adminid"] = adminId;
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('密码错误!')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>alert('无此用户!')</script>");
            }
        }
    }
}