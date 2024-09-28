using System;
using System.Collections.Generic;
using System.Text;

//khai báo 2 thư viện này để xử lý db
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;

namespace lib_db
{
    public class sqlserver
    {
        public string SP = "SP_API";
        public string cnstr; //cần truyền cho tôi chuỗi kết nối

        //viết 1 hàm dùng chung, vì nó chỉ khác nhau ở cmd
        //cmd có sẵn tham số
        public Object get_value<T>(string action, SqlCommand cmd)
        {
            using (SqlConnection conn = new SqlConnection(cnstr))
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = SP;
                cmd.Parameters.Add("action", SqlDbType.VarChar, 50).Value = action;
                object result = cmd.ExecuteScalar(); //thực thi thôi
                return (T)result; //ép sang string, đây là json
            }
        }
        public string get_json(string action, SqlCommand cmd)
        {
            return (string)get_value<string>(action, cmd);
        }
        public byte[] get_bytes(string action, SqlCommand cmd)
        {
            return (byte[])get_value<byte[]>(action, cmd);
        }
    }
}
