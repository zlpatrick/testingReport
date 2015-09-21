using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Xml;

namespace TestingReport
{
    public partial class weixin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                string reply = "<xml><ToUserName><![CDATA[" + fromUser + "]]></ToUserName>" +
                "<FromUserName><![CDATA[" + toUser + "]]></FromUserName>" +
                "<CreateTime>12345678</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount>" +
                "<Articles><item><Title><![CDATA[幸福ABC热门测试]]></Title><Description><![CDATA[幸福ABC热门测试]]></Description>" +
                "<PicUrl><![CDATA[http://jeffery.w77.goodnic.net/img/weixin.png]]></PicUrl>" +
                "<Url><![CDATA[http://jeffery.w77.goodnic.net/index.aspx?userid=" + fromUser + "]]></Url></item></Articles></xml>";

                Response.ContentType = "text/xml";
                Response.Write(reply);
            }
        }

    }
}