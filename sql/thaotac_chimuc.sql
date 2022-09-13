USE classicmodels;
-- tìm thông tin của khách hàng có tên là Land Of Toys Inc
select * from customers
where customerName = "Land of Toys Inc.";
-- lệnh này bạn sẽ nhận ra được với câu Query của bạn
 SELECT * FROM customers
 WHERE customerName = 'Land of Toys Inc.'; 
 -- thêm chỉ mục cho bảng customers
 ALTER TABLE customers ADD INDEX idx_customerName(customerName);
 SELECT * FROM customers
 WHERE customerName = 'Land of Toys Inc.';
 -- Add index theo cặp như bạn add index cho cặp contactFirstName và contactLastName.
 ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
 SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
 --  xoá chỉ mục trong bảng
 ALTER TABLE customers DROP INDEX idx_full_name;