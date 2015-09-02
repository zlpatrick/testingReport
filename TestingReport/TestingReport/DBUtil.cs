using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data.Common;

namespace TestingReport
{
    public class DBUtil
    {
        string type = "oledb";
        
        public OleDbConnection createOleDbConnection()
        {
            OleDbConnection conn = new OleDbConnection();
            return conn;
        }

        public SqlConnection createSqlConnection()
        {
            SqlConnection conn = new SqlConnection("Data Source=114.80.193.50;Database=xinli;User ID=xinli;Password=xinli12345");
            return conn;
        }

        public DataSet executeOleQuery(string sql)
        {
            OleDbConnection conn = createOleDbConnection();

            try
            {
                conn.Open();
                OleDbDataAdapter ada = new OleDbDataAdapter(sql,conn);
                DataSet ds = new DataSet();
                ada.Fill(ds);
                conn.Close();
                return ds;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public void executeOleNonQuery(string sql)
        {
            OleDbConnection conn = createOleDbConnection();
            try
            {
                conn.Open();
                OleDbCommand command = new OleDbCommand(sql, conn);
                command.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }

        public DataSet executeSqlQuery(string sql)
        {
            SqlConnection conn = createSqlConnection();
            try
            {
                conn.Open();
                SqlDataAdapter ads = new SqlDataAdapter(sql, conn);
                DataSet ds = new DataSet();
                ads.Fill(ds);
                conn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public void executeSqlNonQuery(string sql)
        {
            SqlConnection conn = createSqlConnection();
            try
            {
                conn.Open();
                SqlCommand command = new SqlCommand(sql, conn);
                command.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}