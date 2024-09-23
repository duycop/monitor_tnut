# Monitor_TNUT

## Thử làm bài tập 2 cùng 57kmt

## Đề bài:
1. Tạo website giám sát trạng thái các phòng học của tnut, mỗi phòng có các trạng thái: CÓ NGƯỜI HỌC, KHÔNG CÓ NGƯỜI HỌC, ĐANG SỬA CHỮA
2. Sử dụng database SQL Server với cấu trúc phù hợp.
3. Giao diện web cho phép cập nhật thay đổi trạng thái mỗi phòng học.
4. Thống kê dạng bảng sự thay đổi trạng thái các phòng.
5. Báo cáo thời điểm có ít phòng ĐANG CÓ NGƯỜI HỌC

## Các bước làm:
1. Thiết kế database:

![image](https://github.com/user-attachments/assets/1bee25d0-9af7-47a5-872f-190313ea8c74)

2. Tạo App Web form .net framework 2.0

2.1. **index.html**  

có dùng các thư viện có sẵn (css,js: jquery, jquery-ui, jquery-confirm, bootstrap)

![image](https://github.com/user-attachments/assets/e76ba97f-0cab-4a39-845b-f6501c2ac97e)

và code phần khung giao diện:

![image](https://github.com/user-attachments/assets/3850dc05-962e-4d00-bc09-20665c5b18a1)

2.2. **mystyle.css**: chuẩn bị ảnh, dùng jquery-ui để cho phép kéo thả **$(".toa-nha").draggable();**

cập nhật file css kết quả việc kéo thả:

![image](https://github.com/user-attachments/assets/75ed1521-3d06-4d7b-b979-dcb7f4506e11)

2.3. mycode.js : vất vả nhất ở đây

- Đăng ký các sự kiện mà người dùng click vào thì sẽ làm gì.
- Hiển thị hộp thoại: dùng $.confirm({...})  => tham khảo trang chủ của **jquery-confirm**
- Gửi dữ liệu từ client lên server (api): dùng **$.post(api,{json_key:json_value,...},function(json){code here},'json');**
- vừa làm vừa xem kết quả để hiệu chỉnh

2.4. api.aspx: xoá các dòng ở asp.aspx trừ dòng 1, code ở api.aspx.cs tại sự kiện Page_Load() :

![image](https://github.com/user-attachments/assets/e1f74ef3-ef88-4289-b078-57bc8fa8e154)

2.5 Tạo DLL để xử lý các hàm: 
 - tương tác với db - 
 - xem code file [lib_db/cls_sqlserver.cs](lib_db/cls_sqlserver.cs)

  ![image](https://github.com/user-attachments/assets/6a59f781-86e1-476a-a184-4bfb10f687a9)


2.6. Dùng các hàm của DLL để giải quyết các hàm đã phân luồn tại **Page_Load switch(action)** :

![image](https://github.com/user-attachments/assets/41ce3783-568b-4fbc-a334-e2fd52a2c2a2)







