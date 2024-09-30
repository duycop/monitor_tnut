using Newtonsoft.Json;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.SessionState;

namespace lib_phong
{
    public class Phong
    {
        public string cnstr;
        private const string SP = "SP_Phong";
        private HttpRequest Request;
        private HttpSessionState Session;
        private HttpResponse Response;
        private lib_user.User user;
        private lib_db.sqlserver db;
        public Phong(System.Web.UI.Page papa, lib_user.User user, string cnstr)
        {
            this.Request = papa.Request;
            this.Session = papa.Session;
            this.Response = papa.Response;
            this.user = user;
            this.cnstr = cnstr;
            db = get_db();
        }

        // 1. Khai báo delegate với hai tham số kiểu string
        public delegate void AddLogHandler(string key, string msg);

        // 2. Khai báo event dựa trên delegate
        public event AddLogHandler add_log;

        // 3. Phương thức dùng để kích hoạt (raise) event
        protected virtual void OnAddLog(string key, string msg)
        {
            // Kiểm tra nếu có hàm nào đã đăng ký với event
            add_log?.Invoke(key, msg);  // Thực hiện callback cho các hàm đã đăng ký
        }

        // Một phương thức có thể gọi khi cần log
        public void Log(string key, string message)
        {
            // Kích hoạt event add_log
            OnAddLog(key, message);
        }
        class PhanHoi
        {
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public bool ok;
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public string msg;
        }
        string get_json_bao_loi(string msg, bool ok = false)
        {
            PhanHoi p = new PhanHoi();
            p.ok = ok;
            p.msg = msg;
            string json = JsonConvert.SerializeObject(p);
            return json;
        }
        void bao_loi(string msg)
        {
            string json = get_json_bao_loi(msg);
            this.Response.Write(json);
        }
        lib_db.sqlserver get_db()
        {
            lib_db.sqlserver db = new lib_db.sqlserver();
            db.cnstr = cnstr;
            db.SP = SP;
            return db;
        }
        //===============
        private string db_get_status(int idDay)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                //cmd chỉ khác nhau ở những tham số
                cmd.Parameters.Add("idDay", SqlDbType.Int).Value = idDay;
                string json = db.get_json("get_status", cmd);
                return json;
            }
        }
        private string db_get_all_status()
        {
            string json = db.get_json("get_all_status");
            return json;
        }
        private string db_get_history(int idPhong)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("idPhong", SqlDbType.Int).Value = idPhong;
                string json = db.get_json("get_history", cmd);
                return json;
            }
        }

        private string db_change_status(int idPhong, int status, string uid)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("idPhong", SqlDbType.Int).Value = idPhong;
                cmd.Parameters.Add("status", SqlDbType.Int).Value = status;
                cmd.Parameters.Add("uid", SqlDbType.VarChar,50).Value = uid;
                string json = db.get_json("change_status", cmd);
                return json;
            }
        }
        //===============
        void get_status()
        {
            string json = "";
            try
            {
                int idDay = int.Parse(this.Request.Form["idDay"]);
                json = db_get_status(idDay);
            }
            catch (Exception ex)
            {
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                this.Response.Write(json);
            }
        }
        void get_all_status()
        {
            string json = "";
            try
            {
                json = db_get_all_status();
            }
            catch (Exception ex)
            {
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                this.Response.Write(json);
            }
        }
        void get_history()
        {
            string json = "";
            try
            {
                int idPhong = int.Parse(this.Request.Form["idPhong"]);
                json = db_get_history(idPhong);
            }
            catch (Exception ex)
            {
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                this.Response.Write(json);
            }
        }
        void change_status()
        {
            string json = "";
            try
            {
                if (user.have_role(2))
                {
                    int idPhong = int.Parse(this.Request.Form["idPhong"]);
                    int status = int.Parse(this.Request.Form["status"]);
                    json = db_change_status(idPhong, status, user.uid);
                }
                else
                {
                    json = get_json_bao_loi($"Không đủ quyền!");
                }
            }
            catch (Exception ex)
            {
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                this.Response.Write(json);
            }
        }
        public void Run(string action)
        {
            switch (action)
            {
                case "get_status":
                    get_status();
                    break;
                case "get_all_status":
                    get_all_status();
                    break;
                case "get_history":
                    if (user.is_logined())
                    {
                        get_history();
                    }
                    else
                    {
                        bao_loi("Chưa login thì ko xem được lịch sử thay đổi em ơi!");
                    }
                    break;
                case "change_status":
                    if (user.is_logined())
                    {
                        change_status();
                    }
                    else
                    {
                        bao_loi("Chưa login em ơi!");
                    }
                    break;
            }
        }
    }
}
