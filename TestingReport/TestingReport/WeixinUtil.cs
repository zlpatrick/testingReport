using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;


namespace TestingReport
{
    public class WeixinUtil
    {
        public static DateTime lastUpdate;
        public static string access_token = null;
        public static string authorize_access_token = null;

        private static string GET_USER_INFO = "https://api.weixin.qq.com/cgi-bin/user/info?access_token={0}&openid={1}&lang=zh_CN";
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
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxe29e41d979d25872&secret=8fbe158f0cf0a33acfe2b57e49e12593");
                System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
                string token = reader.ReadToEnd();

                JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
                access_token =  obj.GetValue("access_token").ToString();
                lastUpdate = newTime;
            }

            return access_token;
        }

        public static string getUserAuthorizedId(string code)
        {
            try
            {
                string api = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxe29e41d979d25872&secret=8fbe158f0cf0a33acfe2b57e49e12593&code=" + code + "&grant_type=authorization_code";
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(api);
                System.IO.StreamReader reader = new System.IO.StreamReader(request.GetResponse().GetResponseStream(), Encoding.UTF8);
                string token = reader.ReadToEnd();

                JObject obj = (JObject)JsonConvert.DeserializeObject<JObject>(token);
                JToken temp = null;
                obj.TryGetValue("errorcode", out temp);
                if (temp == null)
                {
                    return obj.GetValue("openid").ToString();
                }
            }
            catch(Exception ex)
            {
                return null;
            }

            return null;
        }

        public static JObject getUserInfo(string openid)
        {
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
    }
}