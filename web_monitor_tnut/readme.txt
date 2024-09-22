1. tạo solution+project web
2. download thư viện: jquery, jquery-ui (min), bootstrap, 
3. tạo biểu tượng cho app, cần pts để nó trong suốt vài chỗ, tạo các ảnh => mất thời gian
4. tạo db, nhập dữ liệu, tạo sp_api để get_status
5. viết api.aspx: trả về json cho action=get_status: dùng DLL
6. tạo project DLL: đọc dữ liệu từ sql server: cần chuỗi kết nối. Nơi gọi cần truyền sang
   lưu chuỗi kết nối từ file web.config
   đọc chuỗi đó