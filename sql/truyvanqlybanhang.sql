use c5_qlybanhang;
-- 1 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.
select MASP,TENSP
from sanpham
where NuocSX = 'trung quoc';
-- 2 In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
select MASP,TenSP
from sanpham 
where DVT = 'cay' or DVT = 'quyen';
-- 3 In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select MASP,TenSP
from sanpham
where MaSP like 'B%01';
-- 4 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.
select MASP,TenSP
from sanpham
where NuocSX = 'trung quoc' and Gia between 20000 and 30000;
-- 5 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ 20.000 đến 30.000.
select MASP,TenSP
from sanpham
where(NuocSX = 'trung quoc' or 'thai lan')and Gia between 30000 and 40000;
-- 6  In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select SoHoaDon, TriGia , NgayMuaHang
from hoadon
where NgayMuaHang ='2007-01-01' or NgayMuaHang = '2007-01-02';
-- 7 In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).
select SoHoaDon, TriGia
from hoadon
where month(NgayMuaHang) = 1 and year(NgayMuaHang) = 2007
order by NgayMuaHang asc , TriGia desc;
-- 8 In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select A.MaKH,HoTen
from  hoadon A , khachhang B
where A.MaKH= B.MAKH and NgayMuaHang = '2007-01-01';
-- 9 In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong háng 10/2006.
SELECT C.MASP, TENSP
FROM  hoadon a,khachhang B, cthd C , sanpham D
WHERE A.MAKH=B.MAKH AND A.SoHoaDon=C.SoHD AND C.MASP=D.MASP AND
MONTH(NgayMuaHang)=10 AND YEAR(NgayMuaHang)=2006 AND HOTEN='NGUYEN VAN A' ;
-- 11  In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.
select SoHoaDon,TriGia
from hoadon A, nhanvien B 
where A.MaNV= B.MaNV and NgayMuaHang = '2006-10-28' and HoTen = 'Nguyen van B';
-- 11 Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select SoHD
from cthd
where MaSP = 'BB01' or MaSP= 'BB02';
-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
select SoHD
from cthd
where (MaSP = 'BB01' or MaSP= 'BB02') and SoLuong between 10 and 20;
-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
select SoHD
from cthd
where SoLuong between 10 and 20 and MaSP = 'BB01'and SoHD in (select SoHD from cthd where MaSP = 'BB02');
-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán a trong ngày 1/1/2007.
select distinct A.MaSP, TENSP
from sanpham A , hoadon B , cthd C 
where NuocSX = 'trung quoc' or (B.SoHoaDon = C.SoHD and C.MaSP = A.MaSP and NgayMuaHang = '2007-01-01');
-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select MaSP , TENSP
from sanpham 
where MaSP not in (select MaSP from cthd);
-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select MaSP, TENSP
from sanpham
where MaSP not in (select MaSP from cthd A , hoadon B where A.SoHD = B.SoHoaDon and year(2006));
-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
select MaSP, TENSP
from sanpham 
where NuocSX = 'trung quoc' and  MaSP not in (select MaSP from cthd A , hoadon B where A.SoHD = B.SoHoaDon and year(2006));
-- 18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select * from hoadon
where MaKH is null;
-- 19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(TriGia), min(TriGia)
from hoadon;
-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(TriGia)
from hoadon 
where year(NgayMuaHang) = '2006';
-- 21. Tính doanh thu bán hàng trong năm 2006.
select sum(TriGia)
from hoadon
where year(NgayMuaHang) = '2006';
-- 22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select max(TriGia)
from hoadon 
where year(NgayMuaHang) = '2006';
-- 23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select HoTen, max(TriGia)
from khachhang, hoadon
where year(NgayMuaHang) = '2006';
-- 24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select MaKH, HOTEN
from khachhang
order by DoanhSo desc
limit 3;
-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select MASP, TENSP
from sanpham
order by Gia desc
limit 3;
-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của tất cả các sản phẩm).
select MASP, TENSP
from sanpham
where NuocSX = 'trung quoc'
order by Gia
limit 3;
-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức iá thấp nhất (của sản phẩm do “Trung Quốc” sản xuất).
select MASP, TENSP, NuocSX
from sanpham
where NuocSX = 'trung quoc'
order by Gia
limit 3;
-- 28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select a.MAKH, a.HOTEN
from khachhang a join hoadon b on b.MaKH = a.MaKH
where a.MaKH = b.MaKH
group by a.MaKH
order by sum(b.TriGia) desc
limit 3;
-- 29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.
select count(MaSP) as TQSX
from sanpham
where NuocSX = 'trung quoc';
-- 30. Tính tổng số sản phẩm của từng nước sản xuất.
select NuocSX , count(MaSP) as tungnuocSX
from sanpham
group by NuocSX;
-- 31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select NuocSX, count(MASP) as tungnuocSX, max(Gia) as GiaMax, min(Gia) as GiaMin, avg(Gia) as GiaTB
from sanpham
group by NuocSX;
-- 32. Tính doanh thu bán hàng mỗi ngày.
select NgayMuaHang, sum(TriGia) as doanhthu
from hoadon
group by NgayMuaHang;
-- 33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.
SELECT MaSP, SUM(SoLuong) AS TongSoLuong 
FROM cthd
JOIN hoadon ON cthd.SoHD = hoadon.SoHoaDon
	WHERE hoadon.NgayMuaHang = '2006-10-28'
GROUP BY MaSP;
-- 34. Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(NgayMuaHang) as thang, sum(TriGia) as doanhthu
from hoadon
where year(NgayMuaHang) = '2006'
group by month(NgayMuaHang)
order by NgayMuaHang;
-- 35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select hd.MaKH, kh.HoTen,count(hd.MaKH) as SLM
from hoadon hd join khachhang kh on kh.MaKH = hd.MaKH
group by hd.MaKH, kh.HoTen
order by SLM desc
limit 1;
-- 36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select sp.MASP, sp.TENSP
from sanpham sp join cthd on sp.MaSP = cthd.MaSP join hoadon hd on hd.SoHoaDon = cthd.SoHD
where year(hd.NgayMuaHang) = '2006'
group by cthd.MaSP
order by sum(cthd.SoLuong)
limit 1;
-- 37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?
select month(NgayMuaHang) as thangthapnhat
from hoadon
where year(NgayMuaHang) = '2006'
group by month(NgayMuaHang)
order by NgayMuaHang
limit 1;
-- 38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select NuocSX, MASP, TENSP
from sanpham sp
where Gia = (select max(Gia) from sanpham sph where sp.NuocSX = sph.NuocSX)
order by Gia desc;
-- 39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
-- 40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
