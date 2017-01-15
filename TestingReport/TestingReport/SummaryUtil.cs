using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TestingReport
{
    public class UserSummary
    {
        public bool health = false;
        public bool work = false;
        public bool happyfeeling = false;
        public bool bigfive = false;
        public bool perfect = false;
        public bool world = false;
        public bool life = false;
        public string badgeNotify = "";

        public int selfPercent=0;
        public int findlife=0;
        public int learnself=0;
        public bool profileComplete = false;

        public string age = "年龄未设置";
        public string industry = "行业未设置";
        public string income = "";
        public string degree = "";
        public string marriage = "";
        public string region = "地区未设置";
        public string workString = "";
    }
    public class SummaryUtil
    {
        public static UserSummary getUserSummary(string userid)
        {
            UserSummary summary = new UserSummary();
            DBUtil db = new DBUtil();
            DataSet ds = db.executeSqlQuery("select distinct TopicId from [Votes] where UserId='" + userid + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    int topicId = Convert.ToInt32(ds.Tables[0].Rows[i]["topicId"]);
                    if (topicId == 1)
                    {
                        summary.bigfive = true;
                    }
                    else if (topicId == 2)
                    {
                        summary.happyfeeling = true;
                    }
                    else if(topicId == 3)
                    {
                        summary.life = true;
                    }
                    else if (topicId == 5)
                    {
                        summary.work = true;
                    }
                    else if (topicId == 9)
                    {
                        summary.world = true;
                    }
                    else if (topicId == 10)
                    {
                        summary.perfect = true;
                    }
                    else if(topicId == 11)
                    {
                        summary.health = true;
                    }
                }
            }
            int total = 0;
            if (summary.bigfive)
            {
                total++;
            }
            if (summary.world)
            {
                total++;
            }
            if(summary.perfect)
            {
                total++;
            }

            summary.learnself = total * 100 / 3;

            total = 0;
            if(summary.work)
            {
                total++;
            }
            if(summary.life)
            {
                total++;
            }
            if (summary.health)
            {
                total++;
            }
            if (summary.happyfeeling)
            {
                total++;
            }

            summary.findlife = total * 25;

            ds = db.executeSqlQuery("select * from Users where userName='" + userid + "'");
            if (ds.Tables[0].Rows.Count>0)
            {
                string age = ds.Tables[0].Rows[0]["age"].ToString();
                string industry = ds.Tables[0].Rows[0]["industry"].ToString();
                string income = ds.Tables[0].Rows[0]["income"].ToString();
                string degree = ds.Tables[0].Rows[0]["degree"].ToString();
                string marriage = ds.Tables[0].Rows[0]["marriage"].ToString();
                string region = ds.Tables[0].Rows[0]["region"].ToString();
                string workString = ds.Tables[0].Rows[0]["work"].ToString();
                string badgeNotify = ds.Tables[0].Rows[0]["badgeNotify"].ToString();
                summary.badgeNotify = badgeNotify;

                total = 0;
                if (!age.Equals("")){
                    summary.age = age;
                    total++;
                }
                if (!industry.Equals(""))
                {
                    summary.industry = industry;
                    total++;
                }
                if(!income.Equals(""))
                {
                    summary.income = income;
                    total++;
                }
                if(!degree.Equals(""))
                {
                    summary.degree = degree;
                    total++;
                }
                if (!marriage.Equals(""))
                {
                    summary.marriage = marriage;
                    total++;
                }
                if (!region.Equals(""))
                {
                    summary.region = region;
                    total++;
                }
                if (!workString.Equals(""))
                {
                    summary.workString = workString;
                    total++;
                }

                summary.selfPercent = total * 100 / 7;
            }

            if (summary.selfPercent == 100)
                summary.profileComplete = true;

            return summary;
        }
    }
}