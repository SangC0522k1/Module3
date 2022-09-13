use quanlybanhang;
-- hiển thị thông tin hóa đơn 
select oID, oData, oTotalPrice
from oder;
-- hiển thị các khách hàng đã mua và sản phẩm dc mua
select customer.cName, product.pName
from customer join oder on customer.cID = oder.cId 
join orderdetail on oder.oId = orderdetail.oID 
join product on orderdetail.pId = product.pID;
-- hien thi khach hang k mua san pham nao
select cName, count(oder.cID) from customer 
customer left join oder on customer.cID = oder.cID
group by cName
having count(oder.cID) = 0;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select oder.oId,oder.oData, orderdetail.odQTy*product.pPrice as Total
from oder join orderdetail on oder.oId = orderdetail.oId join product on orderdetail.pId = product.pId;

-- --tinh tong hoa don theo id
select oder.oId,oder.oData,sum(orderdetail.odQTy*product.pPrice) as sumTotalByoId
from oder join orderdetail on oder.oId = orderdetail.oId join product on orderdetail.pId = product.pId
group by oder.oId,oder.oData;

-- hien thi tu ngay 20 tro len
select oder.oId,oder.oData,sum(orderdetail.odQTy*product.pPrice) as sumTotalByoId
from oder join orderdetail on oder.oId = orderdetail.oId join product on orderdetail.pId = product.pId
group by oder.oId,oder.oData
having oData > '2006-03-20';



