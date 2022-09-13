use quanlybanhang;
create table customer (
cID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
cName varchar(45) not null,
cAge int
);
create table oder (
oID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
cID int not null,
oData datetime,
oTotalPrice double,
foreign key (cID) REFERENCES oder(cID)
);
create table oderdetail (
oID int not null,
pID int not null,
odQty varchar(45),
foreign key (oID) REFERENCES oder(oID),
foreign key (pID) REFERENCES product(pID)
);
create table product (
pID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
pName varchar(45) not null,
pPrice double
);