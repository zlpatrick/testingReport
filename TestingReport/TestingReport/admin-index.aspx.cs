using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TestingReport
{
    public partial class admin_index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("admin-login.aspx");
            }
        }

        protected void addTopic_Click(object sender, EventArgs e)
        {
            string title = this.title.Text.Trim();
            string introduction = this.introduction.Text.Trim();
            DateTime dt = DateTime.Now;
            string img = dt.Year+"_"+dt.Month+"_"+dt.Day+"_"+dt.Hour+"_"+dt.Minute+"_"+dt.Second;
            this.img.SaveAs(Server.MapPath("/img/"+img+this.img.FileName.Substring(this.img.FileName.LastIndexOf('.')+1)));
            string imgPath = Server.MapPath("/img/"+img+this.img.FileName.Substring(this.img.FileName.LastIndexOf('.')+1));
            int totalOptions = Convert.ToInt32(this.totalOptions.Text.Trim());
            int totalChooseItems = Convert.ToInt32(this.totalChooseItems.Text.Trim());

            string sql = string.Format("insert into Topics(title,introduction,introductionImage,Topictype,TotalOptions,TotalChooseItem,CreateDateTime,resulttype) " +
                "values('{0}','{1}','{2}',{3},{4},{5},'{6}',{7})",title,introduction,imgPath,1,totalOptions,totalChooseItems,dt.ToString(),1);

            DBUtil db = new DBUtil();
            db.executeSqlNonQuery(sql);


            sql = "select max(Id) as maxid from Topics";
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int newid = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

                Response.Redirect("admin-add-choose-item.aspx?id="+newid +"&totalChooseItem="+totalChooseItems+"&totalOptions="+totalOptions);
            }
        }
    }
}