use demo;
INSERT INTO `demo`.`products` (`Id`, `productCode`, `productName`, `productPrice`, `productAmount`, `productDescription`, `productStatus`) 
VALUES ('1', '0', 'sang', '9', '10', 'co', '1');
CREATE INDEX school 
ON products(productCode );
CREATE INDEX ninja
ON products (productName , productPrice);
EXPLAIN SELECT * FROM products;
CREATE VIEW productview AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM products;
-- sữa đổi view
create or replace view productview as
select productCode, productName, productPrice,productStatus from products where id = 1;
select * from productview;
-- Tao store procedure lay tat ca thong tin
DELIMITER //
create procedure DisplayInfo ()
begin select * from products;
end //
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure AddProduct (
IN sId int ,
In sproductCode int,
IN sproductName varchar(50),
IN sproductPrice float,
IN sproductAmount int,
IN sproductDescription varchar(50),
IN sproductStatus bit) 
begin 
	insert into products (Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
	values (sId,sproductCode,sproductName,sproductPrice,sproductAmount,sproductDescription,sproductStatus);
end //
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure updayProduct (
IN sId int ,
In sproductCode int,
IN sproductName varchar(50),
IN sproductPrice float,
IN sproductAmount int,
IN sproductDescription varchar(50),
IN sproductStatus bit,
out message varchar(50))
begin
	declare flag boolean;
    set flag = true;
    if (not exists (select id from products where id = sId)) then
    set message = 'id chưa tồn tại';
    set flag = false;
    end if;
    if (flag = true) then
    update products 
    set 
		productCode = sproductCode,
        productName = sproductName,
        productPrice = sproductPrice,
        productAmount = sproductAmount,
        productDescription = sproductDescription,
        productStatus = sproductStatus
        where id = sId;
        set message = 'cập nhật thành công';
        end if;
end //
-- store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteproduct (
in eid int,
out message varchar(45)
)
begin
declare flag boolean;
    set flag = true;
    if (not exists (select id from products where id = eId)) then
    set message = 'id chưa tồn tại';
    set flag = false;
    end if;
    if (flag = true) then
    delete from products 
    where id = eid;
    set message = "xóa thành công";
    end if;
end //
