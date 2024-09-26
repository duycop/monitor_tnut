using System;
using System.Text;

namespace test_hash
{
    internal class Program
    {
        public static byte[] GetStoredPasswordHash(string username)
        {
            lib_db.sqlserver db = new lib_db.sqlserver();
            db.cnstr = "Server=MIU-LAPTOP\\SQLEXPRESS;Database=tnut-monitor;User Id=sa;Password=123;";
            return db.GetStoredPasswordHash("binh");
        }
        // Hàm để kiểm tra mật khẩu đã mã hóa
        public static bool VerifyPassword(string uid, string pwd_hashed, string salt)
        {
            Console.WriteLine("GetStoredPasswordHash of "+uid+" ...");
            // Lấy mật khẩu đã lưu trong database
            byte[] storedHash = GetStoredPasswordHash(uid);
            if (storedHash == null)
            {
                Console.WriteLine("GetStoredPasswordHash not ok");
                return false; // Không tìm thấy user
            }
            Console.WriteLine("GetStoredPasswordHash ok");

            return lib_salt.PasswordHasher.VerifyPassword(storedHash, pwd_hashed, salt);
        }

        static void Main(string[] args)
        {
            Console.InputEncoding = Encoding.UTF8;
            Console.OutputEncoding = Encoding.UTF8;
            Console.WriteLine("CHƯƠNG TRÌNH THỬ NGHIỆM XEM CODE C# CÓ OK CHECK HASH PWD KHÔNG?");
            // Sử dụng hàm VerifyPassword
            string username = "binh";
            string passwordHash = "fcf0884a092c6601eb0ef99c2a3e3450e4797fdc"; // Giá trị gửi từ client
            string salt = "skldfj3985467fvk78934uowidfjwe8574"; // Muối gửi từ client
            bool isPasswordValid = VerifyPassword(username, passwordHash, salt);

            if (isPasswordValid)
            {
                Console.WriteLine("Mật khẩu hợp lệ.");
            }
            else
            {
                Console.WriteLine("Mật khẩu không hợp lệ.");
            }
            Console.ReadKey(true);
        }
    }
}
