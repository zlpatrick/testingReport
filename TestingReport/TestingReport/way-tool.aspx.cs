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
    public partial class way_tool : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";

        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string region = "地区未设置";
        public int selfPercent = 0;
        public int testTimes = 0;
        public int toolTimes = 0;
        public List<string> toolNames = new List<string>();
        public List<string> toolIds = new List<string>();
        public List<string> toolSigns = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            if (userid == null)
            {
                userid = "om8uZt7fajggMH8vqjFb1afiE8y4";
            }
            JObject obj = WeixinUtil.getUserInfo(userid);
            userImageUrl = obj.GetValue("headimgurl").ToString();
            userNickName = obj.GetValue("nickname").ToString();
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select * from Users where userName='" + userid + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                age = ds.Tables[0].Rows[0]["age"].ToString();
                industry = ds.Tables[0].Rows[0]["industry"].ToString();
                region = ds.Tables[0].Rows[0]["region"].ToString();
            }

            string sql = "select count(Id) as total from measureScores where userId='" + userid + "' and topicId in (2,5)";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                testTimes = Convert.ToInt32(ds.Tables[0].Rows[0][0]) / 4;
            }

            int personalTimes = 0;
            sql = "select * from Votes where userId='" + userid + "' and topicId=1";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                personalTimes++;
            }

            sql = "select * from Votes where userId='" + userid + "' and topicId=8";
            ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                personalTimes++;
            }

            selfPercent = personalTimes * 100 / 6;

            sql = "select * from MyTool where userId='" + userid + "'";
            ds = db.executeSqlQuery(sql);

            for( int i = 0 ;i<ds.Tables[0].Rows.Count;i++)
            {
                toolNames.Add(ds.Tables[0].Rows[i]["toolName"].ToString());
                toolIds.Add(ds.Tables[0].Rows[i]["Id"].ToString());

                string id = ds.Tables[0].Rows[i]["Id"].ToString();

                List<string> listStatus = new List<string>();
                sql = "select * from MyTool where Id=" + id;
                DataSet ds2 = db.executeSqlQuery(sql);

                if (ds2.Tables[0].Rows.Count > 0)
                {
                    string toolName = ds2.Tables[0].Rows[0]["toolName"].ToString();
                    string frequency = ds2.Tables[0].Rows[0]["frequency"].ToString();
                    if (frequency.Equals("0"))
                        frequency = "每天";
                    else
                        frequency = "每周";

                    DateTime dt = DateTime.Parse(ds2.Tables[0].Rows[0]["postDateTime"].ToString());

                    string createDateTime = dt.Year + "年" + dt.Month + "月" + dt.Day + "日";

                    DateTime now = DateTime.Now;
                    if (frequency.Equals("每天"))
                    {
                        int showTimes = 0;
                        while (!sameDay(dt, now))
                        {
                            showTimes++;
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                            ds2 = db.executeSqlQuery(sql);
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                string status = ds2.Tables[0].Rows[0]["status"].ToString();
                                if (status.Equals("0"))
                                {
                                    status = "未完成";
                                }
                                else
                                {
                                    status = "已完成";
                                }
                                listStatus.Add(status);
                            }
                            else
                            {
                                listStatus.Add("未打卡");
                            }
                            if (showTimes == 7)
                            {
                                break;
                            }
                            now = now.AddDays(-1);
                        }

                        if (sameDay(dt, now))
                        {
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                            ds2 = db.executeSqlQuery(sql);
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                string status = ds2.Tables[0].Rows[0]["status"].ToString();
                                if (status.Equals("0"))
                                {
                                    status = "未完成";
                                }
                                else
                                {
                                    status = "已完成";                               
                                }                           
                                listStatus.Add(status);
                            }
                            else
                            {                       
                                listStatus.Add("未打卡");                            
                            }
                        }

                        if (listStatus.Count < 7)
                        {
                            int leftDays = 7 - listStatus.Count;
                            now = DateTime.Now;

                            for (int j = 0; j < leftDays; j++)
                            {
                                now = now.AddDays(1);
                                string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                               
                                listStatus.Insert(0, "未打卡");
                            
                            }
                        }

                        string signs = "";
                        for( int j = 0;j<listStatus.Count;j++)
                        {
                            string sign = "";
                            if (listStatus[j].Equals("未打卡"))
                                sign = "<span class='glyphicon glyphicon-ban-circle' aria-hidden='true' style='color:white;margin-right:10px'></span>";
                            else if (listStatus[j].Equals("已完成"))
                                sign = "<span class='glyphicon glyphicon-ok-circle' aria-hidden='true' style='color:#5cb85c;margin-right:10px'></span>";
                            else if (listStatus[j].Equals("未完成"))
                                sign = "<span class='glyphicon glyphicon-remove-circle' aria-hidden='true' style='color:#c9302c;margin-right:10px'></span>";

                            signs += sign;
                        }
                        toolSigns.Add(signs);
                    }

                    else if (frequency.Equals("每周"))
                    {
                        int showTimes = 0;
                        while (!sameWeek(dt, now))
                        {
                            showTimes++;
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                            ds2 = db.executeSqlQuery(sql);
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                string status = ds2.Tables[0].Rows[0]["status"].ToString();
                                if (status.Equals("0"))
                                {
                                    status = "未完成";
                                }
                                else
                                {
                                    status = "已完成";
                                }

                                listStatus.Add(status);
                            }
                            else
                            {
                                listStatus.Add("未打卡");
                            }
                            if (showTimes == 7)
                            {
                                break;
                            }
                            now = now.AddDays(-7);
                        }

                        if (sameWeek(dt, now))
                        {
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                            ds2 = db.executeSqlQuery(sql);
                            if (ds2.Tables[0].Rows.Count > 0)
                            {
                                string status = ds2.Tables[0].Rows[0]["status"].ToString();
                                if (status.Equals("0"))
                                {
                                    status = "未完成";
                                }
                                else
                                {
                                    status = "已完成";
                                }

                                listStatus.Add(status);
                            }
                            else
                            {
                                listStatus.Add("未打卡");
                            }
                        }

                        if (listStatus.Count < 7)
                        {
                            int leftDays = 7 - listStatus.Count;
                            now = DateTime.Now;

                            for (int j = 0; j < leftDays; j++)
                            {
                                now = now.AddDays(7);
                                string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                                listStatus.Insert(0, "未打卡");

                            }
                        }

                        string signs = "";
                        for (int j = 0; j < listStatus.Count; j++)
                        {
                            string sign = "";
                            if (listStatus[j].Equals("未打卡"))
                                sign = "<span class='glyphicon glyphicon-ban-circle' aria-hidden='true' style='color:white;margin-right:10px'></span>";
                            else if (listStatus[j].Equals("已完成"))
                                sign = "<span class='glyphicon glyphicon-ok-circle' aria-hidden='true' style='color:#5cb85c;margin-right:10px'></span>";
                            else if (listStatus[j].Equals("未完成"))
                                sign = "<span class='glyphicon glyphicon-remove-circle' aria-hidden='true' style='color:#c9302c;margin-right:10px'></span>";

                            signs += sign;
                        }
                        toolSigns.Add(signs);
                    }
                }
            }
        }

        private bool sameWeek(DateTime start, DateTime current)
        {
            TimeSpan span = current - start;
            if (span.TotalDays <= 7)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool sameDay(DateTime start, DateTime current)
        {
            string startString = start.Year + "-" + start.Month + "-" + start.Day;
            string currentString = current.Year + "-" + current.Month + "-" + current.Day;
            if (startString.Equals(currentString))
                return true;
            else
                return false;

        }
    }


}