# BÀI TẬP 3 #

Dành cho cả lớp, làm chung 1 đề!

## Tạo solution gồm các project sau:
1. **Class Library** (.NET Framework 2.0): **Captcha**
  - **Input+Output:**
    + Input: Nhận vào chuỗi kí tự (khoảng 6 kí tự).
    + Ouput: Đầu ra là Bitmap chứa 6 kí tự đó. Nhưng phải làm sao để người thì nhìn thấy còn máy thì khó!
  - **Thuật toán:**
    + Nhận chuỗi ngẫu nhiên
    + DLL có sẵn trước khoảng 10 ảnh nền gây lú.
    + Load 1 ảnh nền bất kỳ ngẫu nhiên (ảnh nền là resource của DLL đó luôn)
    + Vẽ từng ký tự trong chuỗi ngẫu nhiên vào ảnh, mỗi ký tự dùng ngẫu nhiên 1 Font trong 1 tập font xác định trước, mỗi kí tự này còn xoay đi 1 góc ngẫu nhiên (-45 độ đến +45 độ), và mỗi kí tự có 1 size ngâu nhiên, toạ độ (y) của kí tự cũng ngẫu nhiên, còn toạ độ x thì đương nhiên tăng dần để phân biệt thứ tự trước sau của các kí tự, các kí tự có thể có màu ngẫu nhiên và có thể đè lên nhau.
    + Có thể bổ xung thêm các hiệu ứng: làm thế nào đó để chữ nó ngoằn nghèo như sóng (tuỳ ý sáng tạo, tuy nhiên vẫn phải để cho người nhìn thấy chữ)
    + Bổ xung thêm nhiễu vào ảnh: vẽ các đường thẳng, hình tròn, tam giác ở các vị trí ngẫu nhiên, kích thước ngẫu nhiên, màu sắc ngẫu nhiên, có thể đè lên các kí tự để khó nhìn, ngây nhiễu.'
2. **Windows Form App** (.NET Framework 2.0): **Test dispay Captcha**
  - Tham chiếu tới DLL trên
  - Cho phép nhập text
  - Dùng DLL tạo ảnh có chứa text vừa nhập, hiển thị ảnh ra Form (có thể dùng PictureBox, or any other)
3. **ASP.NET Web Application** (.NET Framework 2.0): **Login with Captcha**
  - Mục tiêu: khi login sai 3 lần thì bắt nhập thêm captcha.
  - Thuật toán:
    + Thông tin user (uid và pwd) lưu trong database SQL Server
    + Sử dụng kỹ thuật tạo api.aspx để xử lý các truy vấn từ client gửi lên, kết quả trả lại json hoặc định dạng phù hợp.
    + Sử dụng Session để đếm số lần login thất bại (cặp thông tin uid và pwd không khớp với db thì tính là không hợp lệ)
    + Nếu đã 3 lần thất bại thì form login sẽ hiển thị ảnh captcha, người dùng cần nhập đúng text trong ảnh captcha thì mới xét tính đúng đắn của uid và pwd => Nếu captcha sai hoặc uid sai hoặc pwd sai thì đều bắt nhập lại với captcha mới.
    + html dùng thẻ &lt;img src="..." /&gt; sẽ hiển thị được ảnh. thuộc tính **src** của thẻ **img** có thể là 1 **url**, hoặc cũng có thể ở dạng **base64**
    + Sử dụng các thư viện jQuery và jQuery-Confirm để viết code js.

**Kết quả là quá trình làm**: 
  1. Quay video full màn hình quá trình làm, upload lên youtube (hoặc bất kì nền tảng nào khác mà xem lại được). Có thể upload nhiều video. Trong video có nói cách làm, quay cả quá trình tìm kiếm, chát với AI,... copy và sửa đổi, test lỗi và hết lỗi (sướng thế nào!)
  2. Quá trình làm push code lên github.
  3. Ghi lại thuật toán, các bước làm, các thất bại và thành công trong quá trình làm ra file readme.md

**Deadline**
  - 23:59:59 ngày 01/10/2024.
  - Nếu quá trình làm toàn thất bại cũng upload quá trình đó lên: thầy chấm quá trình, ko chấm kết quả.
- Sinh viên không chịu nỗ lực tìm kiếm và thử sai thử sai: **Chắc chắn bị cấm thi**
