using Newtonsoft.Json;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;

namespace lib_user
{
    public class User
    {
        public string cnstr;
        private const string SP = "SP_User";
        private HttpRequest Request;
        private HttpSessionState Session;
        private HttpResponse Response;
        private lib_db.sqlserver db;

        public User(System.Web.UI.Page papa, string cnstr)
        {
            this.Request=papa.Request;
            this.Session=papa.Session;
            this.Response=papa.Response;
            this.cnstr = cnstr;
            db = get_db();
        }

        private class LoginData
        {
            public int ok { get; set; }
            public string uid { get; set; }
            public string name { get; set; }
            public string fp { get; set; }
        }

        private class PhanHoi
        {
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public bool ok;
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public string msg;
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public string captcha;
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public string salt;
            [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
            public int? dem;
        }

        private lib_db.sqlserver get_db()
        {
            //khai báo đối tượng ở DLL
            lib_db.sqlserver db = new lib_db.sqlserver();
            //truyền chuỗi kết nối vào
            db.cnstr = this.cnstr;
            db.SP = SP;
            return db;
        }

        public string get_json_bao_loi(string msg, bool ok = false, string captcha = null, string salt = null)
        {
            PhanHoi p = new PhanHoi();
            p.ok = ok;
            p.msg = msg;
            p.captcha = captcha;
            p.salt = salt;
            p.dem = get_count_login();
            return JsonConvert.SerializeObject(p);
        }
        public void bao_loi(string msg)
        {
            string json = get_json_bao_loi(msg);
            this.Response.Write(json);
        }

        public void check_logined()
        {
            try
            {
                object obj = this.Session["user-info"];
                if (obj == null)
                {
                    bao_loi("chưa từng login");
                }
                else
                {
                    LoginData m = (LoginData)this.Session["user-info"]; //hàm check_logined
                    if (m.ok == 1)
                    {
                        string fp = this.Request.Form["fp"];
                        bool ok = m.fp.Equals(fp, StringComparison.OrdinalIgnoreCase);
                        if (ok)
                        {
                            this.Session["count_login"] = 0;
                            string json = JsonConvert.SerializeObject(m);
                            this.Response.Write(json);
                        }
                        else
                        {
                            bao_loi("có gì đó dính trên cốc mà sai sai");
                        }
                    }
                    else
                    {
                        bao_loi("Chưa lưu user-info");
                    }
                }
            }
            catch (Exception ex)
            {
                bao_loi($"Lỗi gì đó: {ex.Message}");
            }

        }

        private string db_login(string uid, string pwd)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("uid", SqlDbType.VarChar, 50).Value = uid;
                cmd.Parameters.Add("pwd", SqlDbType.VarChar, 50).Value = pwd;
                string json = db.get_json("login", cmd);
                return json;
            }
        }
        private string db_get_user(string uid)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Parameters.Add("uid", SqlDbType.VarChar, 50).Value = uid;
                string json = db.get_json("get_user", cmd);
                return json;
            }
        }


        private byte[] db_GetStoredPasswordHash(string uid)
        {
            byte[] storedHash = null;

            using (SqlConnection conn = new SqlConnection(cnstr))
            {
                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = SP;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("action", SqlDbType.VarChar, 50).Value = "GetStoredPasswordHash";
                    cmd.Parameters.Add("uid", SqlDbType.VarChar, 50).Value = uid;

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        storedHash = (byte[])result;
                    }
                }
            }

            return storedHash;
        }

        private void count_login_reset()
        {
            this.Session["count_login"] = 0;
        }
        private void count_login_add()
        {
            try
            {
                object t = this.Session["count_login"];
                if (t != null)
                {
                    int dem = (int)t;
                    dem++;
                    this.Session["count_login"] = dem;
                }
            }
            catch
            {
            }
        }
        private int get_count_login()
        {
            int dem = 0;
            try
            {
                object t = this.Session["count_login"];
                if (t != null)
                {
                    dem = (int)t;
                }
                else
                {
                    this.Session["count_login"] = 0;
                }
            }
            catch
            {
            }
            return dem;
        }
        private bool count_login_is_over()
        {
            int dem = get_count_login();
            return dem >= 3;
        }
        private void login()
        {
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //lấy thêm tham số tên là idPhong từ client gửi POST lên
                string uid = this.Request.Form["uid"];
                string pwd = this.Request.Form["pwd"]; //pwd rõ
                //gọi hàm trong dll, truyền tham số, nhận lại json
                json = db_login(uid, pwd); //pwd rõ ở đây

                //chuyeern json -> obj LoginData
                LoginData m = JsonConvert.DeserializeObject<LoginData>(json); //hàm login
                if (m.ok == 1)
                {
                    //luu m vào session
                    this.Session["user-info"] = m;
                    count_login_reset();
                }
                else
                {

                }
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
        private string get_captcha_base64()
        {
            lib_captcha.CaptchaGenerator captcha = new lib_captcha.CaptchaGenerator();
            string txt = lib_captcha.CaptchaGenerator.RandomString(6);
            Session["captcha"] = txt; //lưu txt ngẫu nhiên này vào session
            Bitmap img = captcha.GenerateCaptcha(txt);
            string base64 = captcha.ConvertBitmapToBase64(img);
            return base64;
        }
        private string json_captcha(string msg, bool ok = false)
        {
            lib_captcha.CaptchaGenerator captcha = new lib_captcha.CaptchaGenerator();
            string txt = lib_captcha.CaptchaGenerator.RandomString(6);
            Session["captcha"] = txt; //lưu txt ngẫu nhiên này vào session
            Bitmap img = captcha.GenerateCaptcha(txt);
            string base64 = captcha.ConvertBitmapToBase64(img);
            string salt = get_salt();
            return get_json_bao_loi(msg, ok: ok, captcha: base64, salt: salt);
        }
        private bool captcha_is_ok()
        {
            try
            {
                if (count_login_is_over())
                {
                    //nếu quá số lần sai thì phải check captcha trước
                    string captcha_user = this.Request.Form["captcha"].ToLower();
                    string captcha_server = (string)this.Session["captcha"].ToString().ToLower();
                    //so sánh bỏ qua HOA thường
                    return captcha_server.Equals(captcha_user, StringComparison.CurrentCultureIgnoreCase);
                }
                else
                {
                    //chưa quá số lần sai thì coi như đúng
                    return true;
                }
            }
            catch
            {
                //trong quá trình kiểm tra mà có lỗi gì thì coi như nhập sai
                return false;
            }
        }
        private void login2()
        {
            string json = "";
            try
            {
                string uid = this.Request.Form["uid"];
                string client_pwd_hash = this.Request.Form["pwd"]; //pw đã mã hoá với muối
                string salt = (string)this.Session["salt"];  //lấy muối đã lưu trong session trước đó
                if (!captcha_is_ok())
                {
                    count_login_add();
                    //mỗi lần nhập sai là lại sinh ra ảnh mới
                    json = json_captcha("Nhập sai captcha!");
                    return;
                }

                byte[] pw_db_sha1 = db_GetStoredPasswordHash(uid); //lấy mật khẩu đã mã hoá trong db

                if (pw_db_sha1 != null)
                {
                    bool ok = lib_salt.PasswordHasher.VerifyPassword(pw_db_sha1, client_pwd_hash, salt);
                    if (ok)
                    {
                        json = db_get_user(uid); //lấy thông tin user theo uid, ko cần pwd

                        //chuyển json -> obj LoginData
                        LoginData m = JsonConvert.DeserializeObject<LoginData>(json); //hàm login2
                        if (m.ok == 1)
                        {
                            m.fp = this.Request.Form["fp"];
                            //lưu m vào session
                            this.Session["user-info"] = m;
                            count_login_reset();
                        }
                    }
                    else
                    {
                        count_login_add(); //Mật khẩu sai rồi!
                        string msg = $"Nhập password sai rồi!";
                        if (count_login_is_over())
                        {
                            json = json_captcha(msg);
                        }
                        else
                        {
                            json = get_json_bao_loi(msg);
                        }
                    }
                }
                else
                {
                    count_login_add(); //Không tồn tại user
                    string msg = $"Không tồn tại user này!";
                    if (count_login_is_over())
                    {
                        json = json_captcha(msg);
                    }
                    else
                    {
                        json = get_json_bao_loi(msg, salt: get_salt());
                    }
                }
            }
            catch (Exception ex)
            {
                count_login_add(); //login Exception
                string msg = $"Error: {ex.Message}";
                if (count_login_is_over())
                {
                    json = json_captcha(msg);
                }
                else
                {
                    json = get_json_bao_loi(msg, salt: get_salt());
                }
            }
            finally
            {
                //gửi lại client
                this.Response.Write(json);
            }
        }

        public void logout()
        {
            this.Session["user-info"] = null; //cho ăn chắc
            this.Session.Abandon(); //huỷ mọi thứ của ngăn kéo này
                                    //luôn thành công
            PhanHoi p = new PhanHoi();
            p.ok = true;
            p.msg = "Thoát rồi nhé! bye bye";
            //sử dụng thư viện :\Newtonsoft.Json.13.0.3\lib\net20\Newtonsoft.Json.dll
            //để chuyển đối tượng p => json
            string json = JsonConvert.SerializeObject(p);

            //trả json về cho client
            this.Response.Write(json);
        }

        public bool is_logined()
        {
            try
            {
                LoginData m = (LoginData)this.Session["user-info"]; //is_logined
                return (m.ok == 1);
            }
            catch
            {
                return false;
            }
        }
        public string get_salt()
        {
            string salt = lib_salt.Salt.RandomString(32);
            this.Session["salt"] = salt;
            return salt;
        }
        public void GenerateSalt()
        {
            string json;
            if (count_login_is_over())
            {
                json = json_captcha("get new salt+captcha ok", true);
            }
            else
            {
                string salt = get_salt();
                json = get_json_bao_loi(msg: "new salt ok", ok: true, salt: salt);
            }
            this.Response.Write(json);
        }
        public void Run(string action)
        {
            switch (action)
            {
                case "check_logined":
                    check_logined();
                    break;
                case "login":
                    //login();
                    login2();
                    break;
                case "logout":
                    logout();
                    break;

                case "GenerateSalt":
                    GenerateSalt();
                    break;

                default:
                    bao_loi("Lỗi rồi nhé, kiểm tra lại action!");
                    break;
            }
        }
    }
}
