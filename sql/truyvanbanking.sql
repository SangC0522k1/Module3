use banking;
delimiter //
create procedure sp_deposit (
in sCustomerID int,
in sMoney decimal(12,0),
out sMessage varchar(200)
)
begin
declare flag boolean;
declare total decimal(12,0);
set flag = true;
if(not exists (select id from customers where id = sCustomerID)) then
set sMessage = 'nguoi nay k co';
set flag = false;
end if;
if(sMoney <= 0) then
set sMessage = 'lớn hơn 0';
set flag = false;
end if;
if(flag = true) then
INSERT INTO `banking`.`deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
        VALUES (now(), 0, sCustomerId, sMoney);
  set total = (select balance from banking.customers where id = sCustomerID);
  set total = total+ sMoney;
  UPDATE `banking`.`customers` SET `balance` = total WHERE (`id` = sCustomerId);
  end if;
end;
delimiter //
create procedure sp_transfer(
in sIdNguoiGui int,
in sMoney decimal(12,0),
in sIdNguoiNhan int,
out message varchar(45)
)
begin
	declare flag boolean;
    declare total decimal(12,0);
    set flag = true;
    if(not exists (select id from customers where id = sIdNguoiGui)) then
		set message = 'người dùng không tồn tại';
        set flag = false;
        end if;
    if(sMoney <= 0) then
		set message = 'số tiền chuyển phải lớn hơn 0';
        set flag = false;
        end if;
	if((select balance from customers where customers.id = sIdNguoiGui) < sMoney) then
		set message = 'số tiền chuyển không được quá số dư';
        set flag = false;
	end if;
     if(not exists (select id from customers where id = sIdNguoiNhan)) then
		set message = 'người nhận không tồn tại';
        set flag = false;
        end if;
    if (flag = true) then
		insert into `banking`.`transfers` (`created_at`, `deleted`, `transaction_amount`,`recipient_id`,`sender_id`)
        values (now(), 0, sMoney, sIdNguoiNhan, sIdNguoiGui);
        set total = (SELECT balance FROM c5_banking.customers where id = sIdNguoiGui);
		set total = total - soney;
        UPDATE `banking`.`customers` SET `balance` = total WHERE (`id` = sIdNguoiGui);
        set total = (SELECT balance FROM c5_banking.customers where id = sIdNguoiNhan);
		set total = total + sMoney;
        UPDATE `banking`.`customers` SET `balance` = total WHERE (`id` = sIdNguoiNhan);
        set message = 'chuyển thành công';
	end if;
end;//
delimiter //
create procedure sp_withdraw(
	IN sCustomerId int,
    IN sMoney decimal(12,0),
    OUT sMessage varchar(200)
)
begin
	declare flag boolean;
    declare total decimal(12,0);
    set flag = true;
	if(not exists (select id from customers where id = sCustomerId)) then
		set sMessage = 'Nguoi dung khong ton tai';
        set flag = false;
	end if;
    if(sMoney <= 0) then
		set sMessage = 'So tien rut phai lon hon 0';
        set flag = false;
    end if;
    if((select balance from customers where customers.id = sCustomerId) < sMoney) then
		set sMessage = 'số tiền rút không được quá số dư';
        set flag = false;
	end if;
    if(flag = true) then
		INSERT INTO `banking`.`withdraws` (`created_at`, `deleted`, `customer_id`, `transaction_amount`)
        VALUES (now(), 0, sCustomerId, sMoney);
        set total = (SELECT balance FROM c5_banking.customers where id = sCustomerId);
		set total = total - sMoney;
        UPDATE `banking`.`customers` SET `balance` = total WHERE (`id` = sCustomerId);
        set sMessage = 'rút thành công';
	end if;
end;//
