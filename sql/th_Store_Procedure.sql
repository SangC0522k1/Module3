use classicmodels;
-- Tạo Mysql Stored Procedure đầu tiên
Delimiter //
create procedure findAllCustomers()
begin
select * from customers;
end//
-- gọi procedure
call findAllCustomers();
-- Sửa procedure
Delimiter //
create procedure findAllCustomers()
begin
SELECT * FROM customers where customerNumber = 175;
end //
