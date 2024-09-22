--đoạn code này chạy nhiều lần mỗi lần edit số liệu ở 3 dòng đầu -> để auto gen data vào bảng Phòng
declare @day int =16; --nhà a10
declare @tang int=1, @tang_max int=7; --a16 5 tầng
declare @phong int=1, @phong_max int=5; --mỗi tầng có 5 phòng
while(@tang<=@tang_max)
begin
	set @phong=1;
	while(@phong<=@phong_max)
	begin
		declare @id_phong int =@day*10000 + @tang*100+@phong;
		insert into Phong(id,idDay,[name],[status])values(@id_phong,@day,formatmessage('A%d-%d',@day,@tang*100+@phong),1);
		set @phong=@phong+1; --phòng
	end	
	set @tang=@tang+1; --tầng
end