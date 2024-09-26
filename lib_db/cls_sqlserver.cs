using System;
using System.Collections.Generic;
using System.Text;

//khai báo 2 thư viện này để xử lý db
using System.Data;
using System.Data.SqlClient;

namespace lib_db
{
    public class sqlserver
    {
        private const string SP = "SP_API";
        public string cnstr; //cần truyền cho tôi chuỗi kết nối

        //viết 1 hàm dùng chung, vì nó chỉ khác nhau ở cmd
        //cmd có sẵn tham số
        public string get_json(string action, SqlCommand cmd)
        {
            using (SqlConnection conn = new SqlConnection(cnstr))
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = SP;
                //cmd nào cũng phải có action khác nhau, cmd thì nhập sẵn các params khác rồi
                cmd.Parameters.Add("action", SqlDbType.VarChar, 50).Value = action;
                object result = cmd.ExecuteScalar(); //thực thi thôi
                return (string)result; //ép sang string, đây là json
            }
        }
        public string get_status(int idDay)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                //cmd chỉ khác nhau ở những tham số
                cmd.Parameters.Add("idDay", SqlDbType.Int).Value = idDay;
                string json = get_json("get_status", cmd);
                return json;
            }
        }
        public string get_all_status()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string json = get_json("get_all_status", cmd);
                return json;
            }
        }
        public string get_history(int idPhong)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("idPhong", SqlDbType.Int).Value = idPhong;
                string json = get_json("get_history", cmd);
                return json;
            }
        }

        public string change_status(int idPhong, int status)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("idPhong", SqlDbType.Int).Value = idPhong;
                cmd.Parameters.Add("status", SqlDbType.Int).Value = status;
                string json = get_json("change_status", cmd);
                return json;
            }
        }

        public string login(string uid, string pwd)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("uid", SqlDbType.VarChar, 50).Value = uid;
                cmd.Parameters.Add("pwd", SqlDbType.VarChar, 50).Value = pwd;
                string json = get_json("login", cmd);
                return json;
            }
        }
    }
}
