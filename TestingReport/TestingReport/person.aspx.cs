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

namespace TestingReport
{
    public partial class person : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request["userid"];

            userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();
            
        }
    }
}