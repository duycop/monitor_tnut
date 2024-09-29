using System;
using System.Configuration;

namespace web_monitor_tnut
{
    public partial class api : System.Web.UI.Page
    {
        private string cnstr;
        private lib_user.User user;
        private lib_phong.Phong phong;
        private lib_log.Log log;
        public api()
        {
            //hàm tạo, đọc lấy chuỗi kết nối trong file cấu hình
            cnstr = ConfigurationManager.ConnectionStrings["cnstr"].ConnectionString;
        }
        void init_objects()
        {
            user = new lib_user.User(this, cnstr);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            init_objects();
            string action = this.Request.Form["action"];
            switch (action)
            {
                case "get_status":
                case "get_all_status":
                case "get_history":
                case "change_status":
                    phong = new lib_phong.Phong(this, user, cnstr);
                    phong.Run(action);
                    break;

                case "check_logined":
                case "login":
                case "logout":
                case "GenerateSalt":

                case "get_list_role":
                case "get_list_user":
                    user.Run(action);
                    break;

                case "get_log":
                    log = new lib_log.Log(this, user, cnstr);
                    log.Run(action);
                    break;

                default:
                    user.bao_loi("Lỗi rồi nhé, kiểm tra lại action!");
                    break;
            }
        }
    }
}