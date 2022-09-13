-- Tạo View 
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;
-- lấy dữ liệu từ bảng ảo
select * from customer_views;
-- Cập nhật view
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';
-- Xoá view bằng Drop
