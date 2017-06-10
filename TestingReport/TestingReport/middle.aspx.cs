using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Data;

namespace TestingReport
{
    public partial class middle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request["code"];
            string myuserid = Request["userid"];
            string shareid = Request["shareid"];
            if (myuserid == null)
            {
                if (code == null)
                {
                    Response.Redirect("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4f44b7d364e15070&redirect_uri=http%3A%2F%2Fwww.ihappyabc.com%2Fmiddle.aspx?id=" + Request["id"] + "&shareid="+shareid+"&response_type=code&scope=snsapi_userinfo#wechat_redirect");
                }
                else
                {
                    JObject obj = WeixinUtil.getUserAuthorizedObject(code);
                    string openid = obj.GetValue("openid").ToString();
                    string access_token = obj.GetValue("access_token").ToString();

                    
                    bool isGuest = true;
                    DBUtil db = new DBUtil();
                   
                    DataSet ds = db.executeSqlQuery("select * from Users where userName='" + openid + "'");
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string isguest = ds.Tables[0].Rows[0]["isguest"].ToString();
                        if ("0".Equals(isguest))
                        {
                            isGuest = false; 
                        }
                    }

                    ds = db.executeSqlQuery("select * from Users where userName='" + shareid + "'");
                    if( ds.Tables[0].Rows.Count>0 )
                    {
                        string isguest = ds.Tables[0].Rows[0]["isguest"].ToString();
                        if ("0".Equals(isguest))
                        {
                            JObject detailObj = WeixinUtil.getUserInfo(shareid);
                            string userImageUrl = obj.GetValue("headimgurl").ToString();
                            string userNickName = obj.GetValue("nickname").ToString();
                            
                            ds = db.executeSqlQuery("select * from Friends where myid='" + openid + "' and friendId='" + shareid + "'");
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                db.executeSqlNonQuery("update Friends set friendName='" + userNickName + "',friendImg='" + userImageUrl + "' wheremyid='" + openid + "' and friendId='" + shareid + "'");
                            }
                            else
                            {
                                db.executeSqlNonQuery(String.Format("insert into Friends(myid,friendId,friendName,friendImg) values('{0}','{1}','{2}','{3}')",myuserid,shareid,userNickName,userImageUrl));
                            }
                        }
                    }
                    

                    if (!isGuest)
                    {
                        Response.Redirect("vote.aspx?id=" + Request["id"] + "&userid=" + openid);
                    }
                    else
                    {
                        Response.Redirect("vote-guest.aspx?id=" + Request["id"] + "&userid=" + openid + "&token=" + access_token);
                    }
                }
            }
        }
    }
}