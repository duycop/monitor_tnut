using Newtonsoft.Json;
using System;
using System.Web;
using System.Web.SessionState;

namespace lib_manager_phong
{
    public class ManagerPhong
    {
        public string cnstr;
        private HttpRequest Request;
        private HttpSessionState Session;
        private HttpResponse Response;
        private lib_user.User user;
        public ManagerPhong(System.Web.UI.Page papa, lib_user.User user, string cnstr)
        {
            this.Request = papa.Request;
            this.Session = papa.Session;
            this.Response = papa.Response;
            this.user = user;
            this.cnstr = cnstr;
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
            //khai báo đối tượng ở DLL
            lib_db.sqlserver db = new lib_db.sqlserver();
            //truyền chuỗi kết nối vào
            db.cnstr = cnstr;
            db.SP = "SP_API";
            return db;
        }
        void get_status()
        {
            //dùng dll để get_status
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //lấy thêm tham số tên là idday từ client gửi POST lên
                int idDay = int.Parse(this.Request.Form["idDay"]);
                //gọi hàm trong dll, truyền tham số, nhận lại json
                json = db.get_status(idDay);
            }
            catch (Exception ex)
            {
                //nếu có lỗi thì thay json bằng biến ex try catch đc
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                //gửi lại client
                this.Response.Write(json);
            }
        }
        void get_all_status()
        {
            //dùng dll để get_status
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //gọi hàm trong dll, ko truyền tham số, nhận lại json
                json = db.get_all_status();
            }
            catch (Exception ex)
            {
                //nếu có lỗi thì thay json bằng biến ex try catch đc
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                //gửi lại client
                this.Response.Write(json);
            }
        }
        void get_history()
        {
            //dùng dll để get_status
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //lấy thêm tham số tên là idPhong từ client gửi POST lên
                int idPhong = int.Parse(this.Request.Form["idPhong"]);
                //gọi hàm trong dll, truyền tham số, nhận lại json
                json = db.get_history(idPhong);
            }
            catch (Exception ex)
            {
                //nếu có lỗi thì thay json bằng biến ex try catch đc
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                //gửi lại client
                this.Response.Write(json);
            }
        }
        void change_status()
        {
            //dùng dll để get_status
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //lấy thêm tham số tên là idPhong từ client gửi POST lên
                int idPhong = int.Parse(this.Request.Form["idPhong"]);
                //lấy thêm tham số tên là status từ client gửi POST lên
                int status = int.Parse(this.Request.Form["status"]);
                //gọi hàm trong dll, truyền tham số, nhận lại json
                json = db.change_status(idPhong, status);
            }
            catch (Exception ex)
            {
                //nếu có lỗi thì thay json bằng biến ex try catch đc
                json = get_json_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                //gửi lại client
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
