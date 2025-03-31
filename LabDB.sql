DROP DATABASE IF EXISTS LabDB;
CREATE DATABASE LabDB;
USE LabDB

CREATE TABLE Customers(
custID CHAR(5) , 
custFirstName VARCHAR(20), 
custLastName VARCHAR(20),
address VARCHAR(40),
city VARCHAR(20),   
state CHAR(2),
custEmail VARCHAR(30), 
custPhone CHAR(12) ,
password VARCHAR(10),
PRIMARY KEY(custID));

CREATE TABLE Items(
itemID CHAR(3) , 
itemName VARCHAR(30), 
qtyInStock  SMALLINT,
listedPrice FLOAT(8,2),
PRIMARY KEY(itemID)); 

CREATE TABLE Orders(
orderID CHAR(10) , 
ordDate DATE, 
custID CHAR(5) , 
ordAmt  FLOAT(10,2),
PRIMARY KEY(orderID),
FOREIGN KEY(custID) REFERENCES Customers(custID));


CREATE TABLE orderItem(
orderID CHAR(10) , 
itemID CHAR(3) , 
qty  SMALLINT,
unitPrice FLOAT(8,2),
PRIMARY KEY(orderID,itemID),
FOREIGN KEY(orderID) REFERENCES Orders(orderID),
FOREIGN KEY(itemID) REFERENCES Items(itemID));

CREATE TABLE Suppliers(
supID CHAR(4) , 
supName VARCHAR(20), 
city VARCHAR(20), 
state CHAR(2),
phone CHAR(12),
ContactPerson VARCHAR(40),
PRIMARY KEY(supID));

CREATE TABLE Supplies(
supID CHAR(4), 
itemID CHAR(3),
unitCost FLOAT(7,2),
PRIMARY KEY(supID,itemID),
FOREIGN KEY(supID) REFERENCES Suppliers(supID),
FOREIGN KEY(itemID) REFERENCES Items(itemID));

INSERT INTO Customers VALUES ('00001', 'Roger', 'Brown', '432 Rice Street', 'Charlotte', 'NC','roger@aol.com', '704-544-3219', '123');
INSERT INTO Customers VALUES ('00002', 'Chris', 'Austins', '1233 Ridge Drive', 'Charlotte', 'NC', 'chris@aol.com', '704-967-8845', '123');
INSERT INTO Customers VALUES ('00003', 'Joe', 'Yeri', '12 Main Street', 'Concard', 'NC', 'joe@aol.com', '980-344-5654', '123');
INSERT INTO Customers VALUES ('00004', 'John', 'Shepherd', '6200 Ryder Ave','Durham', 'NC',  'john@aol.com', '704-854-4431', '123');
INSERT INTO Customers VALUES ('00005', 'Ari', 'Kundu', '3321 Wannamaker Lane','New York City', 'NY',  'ari@aol.com', '212-866-9012', '123');
INSERT INTO Customers VALUES ('00006', 'Barbara', 'Paterek', '2122 Tryon Street', 'Charlotte', 'NC','barbara@aol.com', '704-988-4322', '123');
INSERT INTO Customers VALUES ('00007', 'Tom', 'Golen', '4321 West Main Street','Durham', 'NC',  'tom@aol.com', '704-655-7410', '123');
INSERT INTO Customers VALUES ('00008', 'George', 'Elio', '544 Maker Lane', 'Colorado Springs','Co', 'george@aol.com', '719-556-7410', '123');
INSERT INTO Customers VALUES ('00009', 'Dan', 'Gibby', '43 Austria Lane','Concard', 'NC', 'dan@aol.com', '704-577-0922', '123');
INSERT INTO Customers VALUES ('00010', 'David', 'Boatsman', '22 Master Street', 'Charlotte', 'NC','david@aol.com', '704-522-1075', '123');
INSERT INTO Customers VALUES ('00011', 'Tom', 'Bank', '2234 Reagan Ave', 'Greensboro', 'NC','tom.bank@aol.com', '980-877-2301', '123');
INSERT INTO Customers VALUES ('00012', 'Jerry', 'Seinfeld', '9008 MainStreet', 'Charlotte', 'NC','jerry@aol.com', '704-585-4432', '123');
INSERT INTO Customers VALUES ('00013', 'Roy', 'Trenneman', '43 Jay Ave', 'New York City', 'NY','roy@aol.com', '703-433-0122', '123');
INSERT INTO Customers VALUES ('00014', 'Christy', 'Taskaly', '1222 Corn Street','Durham', 'NC',  'christy@aol.com', '704-822-3012', '123');
INSERT INTO Customers VALUES ('00015', 'Jessica', 'Taylor', '2333 Round Circle', 'Durham', 'NC', 'jessica@aol.com', '704-988-4923', '123');

INSERT INTO Orders VALUES ('0032298453', '2012-01-23', '00001', 438.00);
INSERT INTO Orders VALUES ('0032221343', '2012-02-12', '00003', 19.00);
INSERT INTO Orders VALUES ('0032291230', '2012-07-03', '00004', 76.00);
INSERT INTO Orders VALUES ('0032212902', '2013-02-24', '00012', 791.92);
INSERT INTO Orders VALUES ('0032293229', '2011-09-21', '00012', 299.00);
INSERT INTO Orders VALUES ('0032288202', '2012-04-13', '00008', 36.50);
INSERT INTO Orders VALUES ('0032273229', '2012-04-08', '00007', 359.96);
INSERT INTO Orders VALUES ('0032291299', '2013-01-23', '00009', 198.00);
INSERT INTO Orders VALUES ('0032290223', '2013-01-23', '00001', 897.00);
INSERT INTO Orders VALUES ('0032292300', '2012-01-29', '00012', 2388.00);
INSERT INTO Orders VALUES ('0032298234', '2012-09-25', '00008', 76.00);
INSERT INTO Orders VALUES ('0032232211', '2011-11-21', '00005', 1003.00);
INSERT INTO Orders VALUES ('0032292301', '2013-01-30', '00009', 2367.92);
INSERT INTO Orders VALUES ('0032298452', '2012-01-15', '00001', 112.99);
INSERT INTO Orders VALUES ('0032298233', '2012-09-12', '00001', 358.00);


INSERT INTO Items VALUES ('045', 'Power Supply', 20,  59.00);
INSERT INTO Items VALUES ('046', 'Network Interface Card', 93,  19.99);
INSERT INTO Items VALUES ('048', 'PC Case Blue', 21, 98.99);
INSERT INTO Items VALUES ('049', 'PC Case Red', 40,  98.99);
INSERT INTO Items VALUES ('050', 'PC Case Silver', 80,  98.99);
INSERT INTO Items VALUES ('051', 'PC Case Black', 53, 98.99);
INSERT INTO Items VALUES ('055', 'LCD Monitor 15 Inch', 20,  179.00);
INSERT INTO Items VALUES ('056', 'LCD Monitor 17 Inch', 78,  199.00);
INSERT INTO Items VALUES ('057', 'LCD Monitor 19 Inch', 43, 219.00);
INSERT INTO Items VALUES ('058', 'LCD Monitor 21 Inch', 21, 299.00);
INSERT INTO Items VALUES ('060', 'USB Keyboard Black', 43, 19.00);
INSERT INTO Items VALUES ('062', 'USB Keyboard White', 3, 19.00);
INSERT INTO Items VALUES ('065', 'USB Mouse Black', 93, 12.00);
INSERT INTO Items VALUES ('066', 'USB Mouse White', 65, 12.00);
INSERT INTO Items VALUES ('076', 'Linksys Router WRT54G', 10, 99.00);
INSERT INTO Items VALUES ('077', 'Netgear 1G 24-Port Switch', 2,  112.99);

INSERT INTO OrderItem VALUES ('0032298453', '057', 2, 219.00);
INSERT INTO OrderItem VALUES ('0032221343', '062', 1, 19.00);
INSERT INTO OrderItem VALUES ('0032291230', '060', 4, 19.00);
INSERT INTO OrderItem VALUES ('0032212902', '050', 8, 98.99);
INSERT INTO OrderItem VALUES ('0032293229', '058', 1, 299.00);
INSERT INTO OrderItem VALUES ('0032288202', '066', 3, 12.00);
INSERT INTO OrderItem VALUES ('0032273229', '048', 4, 98.99);
INSERT INTO OrderItem VALUES ('0032291299', '076', 2, 99.00);
INSERT INTO OrderItem VALUES ('0032290223', '058', 3, 299.00);
INSERT INTO OrderItem VALUES ('0032292300', '057', 12, 199.00);
INSERT INTO OrderItem VALUES ('0032298234', '062', 4, 19.00);
INSERT INTO OrderItem VALUES ('0032232211', '045', 17, 59.00);
INSERT INTO OrderItem VALUES ('0032292301', '058', 8, 295.99);
INSERT INTO OrderItem VALUES ('0032298452', '077', 1, 112.99);
INSERT INTO OrderItem VALUES ('0032298233', '055', 2, 179.00);


INSERT INTO Suppliers (supID, supName, city, state, phone, contactPerson)
VALUES('A002', 'A+', 'Charlotte', 'NC', '704-222-111', 'John Smith');
INSERT INTO Suppliers VALUES('M001', 'Acer', 'Round Rock', 'Tx', '800-433-9014', 'Sara Brown');
INSERT INTO Suppliers VALUES('M002', 'Tiger', 'Charlotte', 'NC', '704-413-3344', 'James Williamson');


INSERT INTO Supplies VALUES ('A002', '045', 22.31);
INSERT INTO Supplies VALUES ('A002', '046',  10.32);
INSERT INTO Supplies VALUES ('A002', '048', 29.31);
INSERT INTO Supplies VALUES ('A002', '049', 29.31);
INSERT INTO Supplies VALUES ('A002', '050', 29.31);
INSERT INTO Supplies VALUES ('A002', '051', 29.31);
INSERT INTO Supplies VALUES ('M001', '055', 145.20);
INSERT INTO Supplies VALUES ('M001', '056', 167.89);
INSERT INTO Supplies VALUES ('M001', '057', 198.31);
INSERT INTO Supplies VALUES ('M001', '058', 245.12);
INSERT INTO Supplies VALUES ('M002', '060', 12.90);
INSERT INTO Supplies VALUES ('M002', '062', 12.98);
INSERT INTO Supplies VALUES ('M002', '065', 5.01);
INSERT INTO Supplies VALUES ('M002', '066', 5.02);
INSERT INTO Supplies VALUES ('M002', '076', 76.01);
INSERT INTO Supplies VALUES ('M002', '077', 89.32);
INSERT INTO Supplies VALUES ('M002', '045', 26.99);
INSERT INTO Supplies VALUES ('M001', '046',  9.58);
INSERT INTO Supplies VALUES ('M001', '048', 28.95);
INSERT INTO Supplies VALUES ('M001', '062', 13.05);
INSERT INTO Supplies VALUES ('M001', '065', 5.00);
INSERT INTO Supplies VALUES ('A002', '056', 166.59);
INSERT INTO Supplies VALUES ('M002', '057', 200.01);
INSERT INTO Supplies VALUES ('M001', '045', 20.01);
INSERT INTO Supplies VALUES ('M002', '055', 180.20);
INSERT INTO Supplies VALUES ('M002', '056', 150.89);
