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
                string key = xml.GetElementsByTagName("EventKey")[0].FirstChild.InnerText;
                string title = "";
                string desc = "";

                if (key.Equals("knowledge"))
                {
                    title = "幸福ABC - 知识";
                    desc = "这里是知识的海洋";
                }
                else if (key.Equals("way"))
                {
                    title = "幸福ABC - 方法";
                    desc = "这里有获得幸福的方法";
                }
                else if (key.Equals("tool"))
                {
                    title = "幸福ABC - 工具";
                    desc = "来测测你的幸福程度";
                }

                string reply = "<xml><ToUserName><![CDATA[" + fromUser + "]]></ToUserName>" +
                "<FromUserName><![CDATA[" + toUser + "]]></FromUserName>" +
                "<CreateTime>12345678</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount>" +
                "<Articles><item><Title><![CDATA["+title+"]]></Title><Description><![CDATA["+desc+"]]></Description>" +
                "<PicUrl><![CDATA[http://jeffery.w77.goodnic.net/img/weixin-bg.jpg]]></PicUrl>" +
                "<Url><![CDATA[http://jeffery.w77.goodnic.net/index.aspx?userid=" + fromUser + "&key="+key+"]]></Url></item></Articles></xml>";

                Response.ContentType = "text/xml";
                Response.Write(reply);
            }
            else if(eventName.ToLower().Equals("subscribe"))
            {
                string reply = "<xml><ToUserName><![CDATA[" + fromUser + "]]></ToUserName>" +
                "<FromUserName><![CDATA[" + toUser + "]]></FromUserName>" +
                "<CreateTime>12345678</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[感谢关注!“幸福ABC”专注于研究如何更积极地投入生活、更幸福地享受生活，并提供相关的知识、方法和工具。]]></Content></xml>";

                Response.ContentType = "text/xml";
                Response.Write(reply);
            }
        }

    }
}