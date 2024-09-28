using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;
using static System.Net.Mime.MediaTypeNames;

namespace web_monitor_tnut
{
    public partial class api : System.Web.UI.Page
    {
        private string cnstr;
        public api()
        {
            //hàm tạo, đọc lấy chuỗi kết nối trong file cấu hình
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
        }
        class PhanHoi
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
            public int dem;

        }
        string get_json_bao_loi(string msg, bool ok = false, string captcha = null, string salt = null)
        {
            //chuỗi báo lỗi msg sẽ được bọc vào trong class PhanHoi
            //để json format luôn ok
            PhanHoi p = new PhanHoi();
            p.ok = ok;
            p.msg = msg;
            p.captcha = captcha;
            p.salt = salt;
            p.dem = get_count_login();
            //sử dụng thư viện :\Newtonsoft.Json.13.0.3\lib\net20\Newtonsoft.Json.dll
            //để chuyển đối tượng p => json
            string json = JsonConvert.SerializeObject(p);

            //trả json về cho nơi gọi
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

        class LoginData
        {
            public int ok { get; set; }
            public string uid { get; set; }
            public string name { get; set; }
            public string fp { get; set; }
        }

        void check_logined()
        {
            try
            {
                LoginData m = (LoginData)this.Session["user-info"];
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
            catch (Exception ex)
            {
                bao_loi($"Lỗi gì đó: {ex.Message}");
            }

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
        void login()
        {
            string json = "";
            try
            {
                lib_db.sqlserver db = get_db(); //hàm này dùng chung cho nhanh
                //lấy thêm tham số tên là idPhong từ client gửi POST lên
                string uid = this.Request.Form["uid"];
                string pwd = this.Request.Form["pwd"]; //pwd rõ
                //gọi hàm trong dll, truyền tham số, nhận lại json
                json = db.login(uid, pwd); //pwd rõ ở đây

                //chuyeern json -> obj LoginData
                LoginData m = JsonConvert.DeserializeObject<LoginData>(json);
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
        bool captcha_is_ok()
        {
            try
            {
                if (count_login_is_over())
                {
                    //nếu quá số lần sai thì phải check captcha trước
                    string captcha_user = this.Request.Form["captcha"];
                    string captcha_server = (string)this.Session["captcha"];
                    //so sánh bỏ qua HOA thường
                    return captcha_server.Equals(captcha_user, StringComparison.OrdinalIgnoreCase);
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
        void login2()
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
                lib_db.sqlserver db = new lib_db.sqlserver();
                db.cnstr = cnstr;
                byte[] pw_db_sha1 = db.GetStoredPasswordHash(uid); //lấy mật khẩu đã mã hoá trong db

                if (pw_db_sha1 != null)
                {
                    bool ok = lib_salt.PasswordHasher.VerifyPassword(pw_db_sha1, client_pwd_hash, salt);
                    if (ok)
                    {
                        json = db.get_user(uid); //lấy thông tin user theo uid, ko cần pwd

                        //chuyển json -> obj LoginData
                        LoginData m = JsonConvert.DeserializeObject<LoginData>(json);
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
                        string msg = $"Mật khẩu sai rồi!";
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

        void logout()
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

        bool is_logined()
        {
            try
            {
                LoginData m = (LoginData)this.Session["user-info"];
                return (m.ok == 1);
            }
            catch
            {
                return false;
            }
        }
        string get_salt()
        {
            string salt = lib_salt.Salt.RandomString(32);
            this.Session["salt"] = salt;
            return salt;
        }
        void GenerateSalt()
        {
            string salt = get_salt();

            if (count_login_is_over())
            {
                string json = json_captcha(salt, true);
                this.Response.Write(json);
            }
            else
            {
                string json = get_json_bao_loi(salt, true);
                this.Response.Write(json);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Request.Form là lấy từ POST của client
            string action = this.Request.Form["action"];

            //phân luồng thực hiện bằng biến action
            //action có giá trị là gì thì gọi hàm có tên tương ứng cho khỏi nhầm lẫn
            switch (action)
            {
                case "get_status":
                    get_status();
                    break;
                case "get_all_status":
                    get_all_status();
                    break;
                case "get_history":
                    if (is_logined())
                    {
                        get_history();
                    }
                    else
                    {
                        bao_loi("Chưa login thì ko xem được lịch sử thay đổi em ơi!");
                    }
                    break;
                case "change_status":
                    if (is_logined())
                    {
                        change_status();
                    }
                    else
                    {
                        bao_loi("Chưa login em ơi!");
                    }
                    break;

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