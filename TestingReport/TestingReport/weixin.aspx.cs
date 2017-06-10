using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Xml;
using System.Data;

namespace TestingReport
{
    public partial class weixin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Request["echostr"]);

            
            if(!File.Exists(Server.MapPath("log.txt")))
            {
                File.Create(Server.MapPath("log.txt")).Close();
            }

            

            byte[] inputBytes = new byte[Request.ContentLength];
            Request.InputStream.Read(inputBytes, 0, Request.ContentLength);
            string strBytes = Encoding.UTF8.GetString(inputBytes);
            
            File.WriteAllText(Server.MapPath("log.txt"), strBytes);

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(strBytes);
            string toUser = xml.GetElementsByTagName("ToUserName")[0].FirstChild.InnerText;
            string fromUser = xml.GetElementsByTagName("FromUserName")[0].FirstChild.InnerText;
            string msgType = xml.GetElementsByTagName("MsgType")[0].FirstChild.InnerText;
            string eventName = xml.GetElementsByTagName("Event")[0].FirstChild.InnerText;

            if (eventName.ToLower().Equals("click"))
            {
                string key = xml.GetElementsByTagName("EventKey")[0].FirstChild.InnerText;
                string title = "";
                string desc = "";
                string page = "";

                if (key.Equals("worklife"))
                {
                    title = "幸福ABC - 认识自我";
                    desc = "认识自我";
                    page = "learn-self.aspx";
                }
                else if (key.Equals("waytool"))
                {
                    title = "幸福ABC - 发现生活";
                    desc = "发现生活";
                    page = "find-life.aspx";
                }
                else if (key.Equals("personal"))
                {
                    title = "幸福ABC - 个人中心";
                    desc = "个人中心";
                    page = "person.aspx";
                }

                string reply = "<xml><ToUserName><![CDATA[" + fromUser + "]]></ToUserName>" +
                "<FromUserName><![CDATA[" + toUser + "]]></FromUserName>" +
                "<CreateTime>12345678</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount>" +
                "<Articles><item><Title><![CDATA["+title+"]]></Title><Description><![CDATA["+desc+"]]></Description>" +
                "<PicUrl><![CDATA[http://www.ihappyabc.com/img/weixin-bg.jpg]]></PicUrl>" +
                "<Url><![CDATA[http://www.ihappyabc.com/"+page+"?userid=" + fromUser +"]]></Url></item></Articles></xml>";

                Response.ContentType = "text/xml";
                Response.Write(reply);
            }
            else if(eventName.ToLower().Equals("subscribe"))
            {
                DBUtil db = new DBUtil();
                DataSet ds = db.executeSqlQuery("select * from Users where userName='" + fromUser + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    db.executeSqlNonQuery("update Users set isguest=0 where userName='" + fromUser + "'");
                }
                else
                {
                    db.executeSqlNonQuery("insert into Users(userName,isguest) values('" + fromUser + "',0)");
                }
                
                string reply = "<xml><ToUserName><![CDATA[" + fromUser + "]]></ToUserName>" +
                "<FromUserName><![CDATA[" + toUser + "]]></FromUserName>" +
                "<CreateTime>12345678</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[欢迎关注“生活再发现”！ 我们结合大数据技术和最新心理学理论，聚焦于研究并改善现代人的生活状态和精神健康。让你更好地认识自我、改进生活，是我们整个团队努力的目标。]]></Content></xml>";

                Response.ContentType = "text/xml";
                Response.Write(reply);
            }
            else if (eventName.ToLower().Equals("unsubscribe"))
            {
                DBUtil db = new DBUtil();
                db.executeSqlNonQuery("update Users set isguest=1 where userName='" + fromUser + "'");     
            }
        }
    }
}