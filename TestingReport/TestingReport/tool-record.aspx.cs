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
    public partial class tool_record : System.Web.UI.Page
    {
        public string userImageUrl = "";
        public string userNickName = "";

        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string region = "地区未设置";
        public int selfPercent = 0;
        public int testTimes = 0;
        public int toolTimes = 0;

        public string toolName;
        public string frequency;
        public string createDateTime;

        public List<string> listDays = new List<string>();
        public List<string> listStatus = new List<string>();
        public List<string> listColors = new List<string>();
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


            string id = Request["id"];
            sql = "select * from MyTool where Id=" + id;
            ds = db.executeSqlQuery(sql);

            if (ds.Tables[0].Rows.Count > 0)
            {
                toolName = ds.Tables[0].Rows[0]["toolName"].ToString();
                frequency = ds.Tables[0].Rows[0]["frequency"].ToString();
                if (frequency.Equals("0"))
                    frequency = "每天";
                else
                    frequency = "每周";

                DateTime dt = DateTime.Parse(ds.Tables[0].Rows[0]["postDateTime"].ToString());

                createDateTime = dt.Year + "年" + dt.Month + "月" + dt.Day + "日";

                DateTime now = DateTime.Now;
                if( frequency.Equals("每天"))
                {
                    int showTimes = 0;
                    while(!sameDay(dt,now))
                    {
                        showTimes++;
                        string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                        sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                        ds = db.executeSqlQuery(sql);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string status = ds.Tables[0].Rows[0]["status"].ToString();
                            if(status.Equals("0"))
                            {
                                status = "未完成";
                                listColors.Add("#c9302c");
                            }
                            else
                            {
                                status = "已完成";
                                listColors.Add("#5cb85c");
                            }

                            listDays.Add(currentString);
                            listStatus.Add(status);
                        }
                        else
                        {
                            listDays.Add(currentString);
                            listStatus.Add("未打卡");
                            listColors.Add("rgba(117,197,240,1)");
                        }
                        if (showTimes == 7)
                        {
                            break;
                        }
                        now = now.AddDays(-1);
                    }

                    if(sameDay(dt,now))
                    {
                        string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                        sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                        ds = db.executeSqlQuery(sql);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string status = ds.Tables[0].Rows[0]["status"].ToString();
                            if (status.Equals("0"))
                            {
                                status = "未完成";
                                listColors.Add("#c9302c");
                            }
                            else
                            {
                                status = "已完成";
                                listColors.Add("#5cb85c");
                            }

                            listDays.Add(currentString);
                            listStatus.Add(status);
                        }
                        else
                        {
                            listDays.Add(currentString);
                            listStatus.Add("未打卡");
                            listColors.Add("rgba(117,197,240,1)");
                        }
                    }

                    if(listDays.Count<7)
                    {
                        int leftDays = 7 - listDays.Count;
                        now = DateTime.Now;
                        
                        for( int i=0;i<leftDays;i++)
                        {
                            now = now.AddDays(1);
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            listDays.Insert(0,currentString);
                            listStatus.Insert(0, "未打卡");
                            listColors.Insert(0, "rgba(117,197,240,1)");
                        }
                    }
                }

                else if (frequency.Equals("每周"))
                {
                    int showTimes = 0;
                    while (!sameWeek(dt, now))
                    {
                        showTimes++;
                        string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                        sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, id, currentString);
                        ds = db.executeSqlQuery(sql);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string status = ds.Tables[0].Rows[0]["status"].ToString();
                            if (status.Equals("0"))
                            {
                                status = "未完成";
                                listColors.Add("#c9302c");
                            }
                            else
                            {
                                status = "已完成";
                                listColors.Add("#5cb85c");
                            }

                            listDays.Add(currentString);
                            listStatus.Add(status);
                        }
                        else
                        {
                            listDays.Add(currentString);
                            listStatus.Add("未打卡");
                            listColors.Add("rgba(117,197,240,1)");
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
                        ds = db.executeSqlQuery(sql);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string status = ds.Tables[0].Rows[0]["status"].ToString();
                            if (status.Equals("0"))
                            {
                                status = "未完成";
                                listColors.Add("#c9302c");
                            }
                            else
                            {
                                status = "已完成";
                                listColors.Add("#5cb85c");
                            }

                            listDays.Add(currentString);
                            listStatus.Add(status);
                        }
                        else
                        {
                            listDays.Add(currentString);
                            listStatus.Add("未打卡");
                            listColors.Add("rgba(117,197,240,1)");
                        }
                    }

                    if (listDays.Count < 7)
                    {
                        int leftDays = 7 - listDays.Count;
                        now = DateTime.Now;

                        for (int i = 0; i < leftDays; i++)
                        {
                            now = now.AddDays(7);
                            string currentString = now.Year + "-" + now.Month + "-" + now.Day;
                            listDays.Insert(0, currentString);
                            listStatus.Insert(0, "未打卡");
                            listColors.Insert(0, "rgba(117,197,240,1)");
                        }
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

        protected void finishButton_Click(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            string toolId = Request["id"];
            string dateTime = this.checkRecordIndex.Value;

            string sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, toolId, dateTime);
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if(ds.Tables[0].Rows.Count == 0)
            {
                sql = string.Format("insert into MyToolRecord(userId,toolId,recordDateTime,status) values('{0}',{1},'{2}',{3})",userid,toolId,dateTime,1);
            }
            else
            {
                sql = string.Format("update MyToolRecord set status=1 where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, toolId, dateTime);
            }
            db.executeSqlNonQuery(sql);
            Response.Redirect("tool-record.aspx?userid=" + Request["userid"] + "&id=" + Request["id"]);
        }

        protected void noneFinishButton_Click(object sender, EventArgs e)
        {
            string userid = Request["userid"];
            string toolId = Request["id"];
            string dateTime = this.checkRecordIndex.Value;

            string sql = string.Format("select * from MyToolRecord where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, toolId, dateTime);
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery(sql);
            if (ds.Tables[0].Rows.Count == 0)
            {
                sql = string.Format("insert into MyToolRecord(userId,toolId,recordDateTime,status) values('{0}',{1},'{2}',{3})", userid, toolId, dateTime, 0);
            }
            else
            {
                sql = string.Format("update MyToolRecord set status=0 where userId='{0}' and toolId={1} and recordDateTime='{2}'", userid, toolId, dateTime);
            }
            db.executeSqlNonQuery(sql);
            Response.Redirect("tool-record.aspx?userid=" + Request["userid"] + "&id=" + Request["id"]);
        }
    }
}