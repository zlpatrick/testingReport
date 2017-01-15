using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;
using System.Data;


namespace TestingReport
{
    public class WeixinUtil
    {
        public static DateTime lastUpdate;
        public static string access_token = null;
        public static string authorize_access_token = null;

        private static string GET_USER_INFO = "https://api.weixin.qq.com/cgi-bin/user/info?access_token={0}&openid={1}&lang=zh_CN";
        private static string GET_AUTHORIZE_USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token={0}&openid={1}&lang=zh_CN";
        public static string getAccessToken()
        {
            DateTime newTime = DateTime.Now;
            TimeSpan timespan = newTime - lastUpdate;
            bool updateAccessToken = false;
            if (access_token == null)
            {
                updateAccessToken = true;
            }
            else
            {
                if (timespan.TotalMinutes >= 60)
                {
                    updateAccessToken = true;
                }
            }

            if( updateAccessToken )
            {
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx4f44b7d364e15070&secret=ecfb3882c96e09afba617fc38a53236a");
                System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
                string token = reader.ReadToEnd();

                JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
                access_token =  obj.GetValue("access_token").ToString();
                lastUpdate = newTime;
            }

            return access_token;
        }

        public static JObject getUserAuthorizedObject(string code)
        {
            try
            {
                string api = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx4f44b7d364e15070&secret=ecfb3882c96e09afba617fc38a53236a&code=" + code + "&grant_type=authorization_code";
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(api);
                System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
                string token = reader.ReadToEnd();

                JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
                JToken temp = null;
                obj.TryGetValue("errorcode", out temp);
                if (temp == null)
                {
                    return obj;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

            return null;
        }

        public static string getUserAuthorizedId(string code)
        {
            JObject obj = getUserAuthorizedObject(code);
            if (obj != null)
            {
                string openid = obj.GetValue("openid").ToString();
                return openid;
            }
            else
            {
                return null;
            }
        }

        public static JObject getUserInfo(string openid)
        {
            int isguest = 0;
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select isguest from Users where userName='" + openid + "'");
            if(ds.Tables[0].Rows.Count>0)
            {
                isguest = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            }
            if (isguest == 1)
            {
                string guestToken = "{\"headimgurl\":\"http://www.ihappyabc.com/img/5-left.png\",\"nickname\":\"幸福游客\"}";
                JObject objguest = (JObject)JsonConvert.DeserializeObject<JObject>(guestToken);
                return objguest;
            }
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(string.Format(GET_USER_INFO,getAccessToken(),openid));
            System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
            string token = reader.ReadToEnd();

            JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
            if (obj == null)
            {
                access_token = null;
                return getUserInfo(openid);
            }
            else
            {
                JToken temp = null;
                obj.TryGetValue("errorcode", out temp);
                if (temp != null)
                {
                    access_token = null;
                    return getUserInfo(openid);
                }
            }
            return obj;
        }

        public static JObject getUserInfo(string openid, string accesstoken)
        {
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(string.Format(GET_AUTHORIZE_USER_INFO, accesstoken, openid));
            System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
            string token = reader.ReadToEnd();

            JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
            if (obj == null)
            {
                access_token = null;
                return getUserInfo(openid);
            }
            else
            {
                JToken temp = null;
                obj.TryGetValue("errorcode", out temp);
                if (temp != null)
                {
                    access_token = null;
                    return getUserInfo(openid);
                }
            }
            return obj;
        }
    }
}