using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingReport
{
    public partial class happiness : System.Web.UI.Page
    {
        public string openid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request["code"];
            string userid = Request["userid"];
            if (userid == null)
            {
                if (code == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe29e41d979d25872&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Fhappiness.aspx&response_type=code&scope=snsapi_base#wechat_redirect");
                }
                else
                {
                    userid = WeixinUtil.getUserAuthorizedId(code);
                }
            }
            openid = userid;
        }
    }
}