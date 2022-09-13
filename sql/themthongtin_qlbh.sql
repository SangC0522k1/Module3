use quanlybanhang;
insert into customer(cID,cName, cAge)
values (1,'Minh Quan',10),
	(2,'Ngoc Oanh',20),
    (3,'Hong Ha',50);

insert into oder(oID,cID,oData)
values(1,1,'3/21/2006'),
	(2,2,'3/23/2006'),
    (3,1,'3/16/2006');
    
insert into orderdetail(oID,pID,odQty)
values (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

insert into product(pID,pName,pPrice)
value (1,'May Giat','3'),
	(2,'Tu Lanh','5'),
    (3,'Dieu Hoa','7'),
    (4,'Quat','1'),
    (5,'Bep Dien','2');
    

