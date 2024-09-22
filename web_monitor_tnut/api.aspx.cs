﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            public bool ok;
            public string msg;
        }
        string get_bao_loi(string msg)
        {
            //chuỗi báo lỗi msg sẽ được bọc vào trong class PhanHoi
            //để json format luôn ok
            PhanHoi p = new PhanHoi();
            p.ok = false;
            p.msg = msg;
            //sử dụng thư viện :\Newtonsoft.Json.13.0.3\lib\net20\Newtonsoft.Json.dll
            //để chuyển đối tượng p => json
            string json = JsonConvert.SerializeObject(p);

            //trả json về cho nơi gọi
            return json;
        }
        void bao_loi(string msg)
        {
            string json = get_bao_loi(msg);
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
                json = get_bao_loi($"Error: {ex.Message}");
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
                json = get_bao_loi($"Error: {ex.Message}");
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
                json = get_bao_loi($"Error: {ex.Message}");
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
                json = get_bao_loi($"Error: {ex.Message}");
            }
            finally
            {
                //gửi lại client
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
                    get_history();
                    break;
                case "change_status":
                    change_status();
                    break;
                default:
                    bao_loi("Lỗi rồi nhé, kiểm tra lại action!");
                    break;
            }
        }
    }
}