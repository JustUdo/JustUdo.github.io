/* *********************************************************************************
 * Name: Udo Okeke			
 * Class: CST 235 															*
 * Date: 2/26/2025
 * I have not received or given help on this assignment: Udochukwu Okeke
 ************************************************************************************/


DROP DATABASE IF EXISTS Lab4;

CREATE DATABASE Lab4;
USE Lab4;

CREATE TABLE Accounts (
 memberID CHAR(9),
 fName VARCHAR(25),
 lName VARCHAR(25),
 email VARCHAR (35),
 creditCardNo CHAR (16),
 password VARCHAR(10),
 PRIMARY KEY(memberID));

CREATE TABLE CreatesProfiles (
 memberID CHAR(9),
 name VARCHAR(25),
 gender CHAR(1),
 dob DATE,
 PRIMARY KEY(memberID, name),
 FOREIGN KEY (memberID) REFERENCES Accounts(memberID)
 ON UPDATE CASCADE ON DELETE CASCADE);
 
CREATE TABLE pGenres (
 memberID CHAR(9) ,
 name VARCHAR(25),
 genre VARCHAR(15),
 PRIMARY KEY(memberID, name, genre),
 FOREIGN KEY (memberID, name) REFERENCES CreatesProfiles(memberID, name)ON UPDATE CASCADE ON DELETE CASCADE );

 
CREATE TABLE Movies (
 movieID CHAR(8),
 title VARCHAR(100),
 yearOfRelease YEAR(4),
 lengthInMinutes CHAR(3),
 avgRating DECIMAL(2,1),
 PRIMARY KEY (movieID));
 
CREATE TABLE mGenres (
 movieID CHAR(8),
 genre VARCHAR (15),
 PRIMARY KEY (movieID, genre),
 FOREIGN KEY (movieID) REFERENCES Movies (movieID));


CREATE TABLE Directors (
 dID CHAR (6),
 fName VARCHAR(25),
 lName VARCHAR(25),
 dob DATE,
 PRIMARY KEY(dID));
 
CREATE TABLE Actors (
 aID CHAR (6),
 fName VARCHAR(25),
 lName VARCHAR(25),
 PRIMARY KEY(aID));
 
 CREATE TABLE Streams (
 movieID CHAR(8),
 memberID CHAR(9),
 name VARCHAR(25),
 rating DECIMAL (2,1),
 dateTimeWatched DATETIME,
 PRIMARY KEY (movieID, memberID, name),
 FOREIGN KEY (movieID) REFERENCES Movies (movieID),
 FOREIGN KEY (memberID, name) REFERENCES CreatesProfiles(memberID, name) );

 CREATE TABLE Directs (
 movieID CHAR(8),
 dID CHAR (6),
 PRIMARY KEY (movieID, dID),
 FOREIGN KEY (movieID) REFERENCES Movies (movieID),
 FOREIGN KEY (dID) REFERENCES Directors (dID));

CREATE TABLE Casts (
 movieID CHAR(8),
 aID CHAR (6),
 role VARCHAR (25),
 PRIMARY KEY (movieID, aID),
 FOREIGN KEY (movieID) REFERENCES Movies (movieID),
 FOREIGN KEY (aID) REFERENCES Actors (aID));
 

 INSERT INTO Accounts (memberID ,fName, lName, email,creditCardNo, password)VALUES
 ('robert123', 'Bob', 'Bush', 'robert123@mail.com', '1234567890123456', 'happy' ),
 ('cassie321', 'Cassie','Bush', 'cassie321@mail.com', '1234567890123478', 'postitive' ),
 ('abana101', 'Abana', 'Kafai', 'Abana101@gmail.com', '223344234123678','Smiling'), 
 ('amiles333', 'Aaron', 'Miles', 'amiles@gmail.com', '223344173346758','joyful'),
 ('gates001', 'Tom', 'Gates', 'gfhr@gmail.com', '52452154265891', 'Wealth'),
 ('jones512', 'kyle', 'jones', '23jordan@gmail.com', '8445121456','Health'),
 ('taiwan01', 'Neo', 'Bush', 'neobush@gmail.com', '4455321871997727', 'happy'),
 ('billy', 'Tom', 'Jill', 'tomjill@gmail.com',    '5215426583344746', 'postivie'),
 ('Ne33o', 'Storm', 'Pall', 'pall3000@gmail.com', '3521542658129279', 'Summy'),
 ('Doe001', 'John', 'Doe', 'johndoe@example.com',   '3599542658129559', 'Smy123'),
 ('jSmith', 'Jane', 'Smith', 'janesmith@example.com','3521999658111179', 'a123');

 
 INSERT INTO CreatesProfiles ( memberID,name, gender, dob)VALUES
 ('robert123','Dad', 'M', '1968-01-01'),
 ('robert123','Kid', 'M', '1990-01-01'),
 ('cassie321','Mom', 'F', '1989-01-11'),
 ('cassie321','Skywalker','M', '1959-06-11'),
 ('cassie321','Jannah','F', '1969-06-15'),
 ('cassie321','Anakin', 'M', '1977-08-21'), 
 ('cassie321','Leia', 'F', '1991-04-04'),
 ('Abana101','Kid1',  'M', '1987-06-19'),
 ('Abana101', 'Kid2',  'M', '1991-08-12'),
 ('gates001','Adam',  'M', '2010-01-01'),
 ('gates001','Nina',  'F', '2017-05-21'),
 ('gates001','A+',  'M', '1985-04-04'),
 ('gates001','kim',  'F', '2001-11-29'),
 ('gates001','John', 'M', '2015-08-13'), 
 ('gates001','Lucy',  'F', '1987-01-08'),
 ('jones512', 'kim', 'F', '2010-08-08'),
 ('jones512', 'Adam', 'M', '2014-11-01'),
 ('jones512','Nina',  'F', '2015-05-21'),
 ('jones512', 'Dad', 'M', '1975-04-04'),
 ('taiwan01', 'Dad', 'M', '1970-08-12'),
 ('taiwan01', 'Mom', 'F', '1970-08-12'),
 ('billy','Adam',  'M', '1999-06-24'),
 ('billy','Friend',  'F', '1999-08-14'),
 ('Ne33o','330',  'F', '1998-07-07'),
('Doe001', 'MovieFan1','M',  '1995-05-10'),
('Doe001','Cinephile23','F',  '2000-10-20'),
('jSmith', 'Winner','F', '2000-10-20'),
('jSmith', 'Lucky','F', '1998-08-12'),
('jSmith', 'Beatiful','F', '2000-08-12'),
('jSmith', 'Handson','M', '2004-10-10'),
('jSmith', 'Bob','M', '2019-05-07');

 
 INSERT INTO pGenres ( genre, name, memberID)VALUES
 ('Horror', 'Kid','robert123'),
 ('Horror', 'Dad','robert123'),
 ('Comedy', 'Mom','cassie321'),
 ('Drama', 'Leia','cassie321'),
 ('Comedy', 'Anakin','cassie321'),
 ('Sci-Fi', 'Skywalker','cassie321'), 
 ('Comedy', 'Jannah','cassie321'),
 ('Action', 'Kid1', 'Abana101'),
 ('Modeling', 'Kid1', 'Abana101'),
 ('Action', 'Kid2', 'Abana101'),
 ('Action', 'Adam', 'gates001'),
 ('Sci-Fi', 'Adam', 'gates001'),
 ('Comedy','Adam', 'gates001'), 
 ('Thriller', 'Nina', 'gates001'),
 ('Horror', 'Nina', 'gates001'),
 ('Sci-Fi', 'A+', 'gates001'),
 ('Comedy', 'A+', 'gates001'),
 ('Comedy', 'kim', 'gates001'), 
 ('Sci-Fi', 'John', 'gates001'),
 ('Comedy', 'Adam', 'jones512'), 
 ('Sci-Fi', 'Nina', 'jones512'),
 ('Comedy','Dad', 'jones512'), 
 ('Thriller','Dad', 'jones512'),
 ('Horror', 'Dad', 'taiwan01'),
 ('Sci-Fi', 'Mom', 'taiwan01'),
 ('Action', 'Adam', 'billy'),
 ('Sci-Fi', 'Adam', 'billy'),
 ('Drama','Friend', 'billy'),
 ('Action', 'Friend', 'billy'),
 ('Comedy','330', 'Ne33o'),
 ('Action', 'MovieFan1', 'Doe001'),
 ('Sci-Fi', 'MovieFan1', 'Doe001'),
 ('Drama','Cinephile23', 'Doe001'),
 ('Romance','Cinephile23', 'Doe001');

 
 INSERT INTO Movies ( movieID, title, yearOfRelease, lengthInMinutes, avgRating)VALUES
 ('chri1234', 'Christmas Evil', '1980', '123', 7.0),
 ('sill4321', 'Christmas Funny Story', '1980', '150', 9.9),
 ('00015523', 'The Great', '2018', '170', 8.6),
 ('11110123', 'The 48 laws of power', '2007', '180', 7.9),
 ('00015234', 'Indiana Jones', '1984', '118', '8.9'),
 ('00015231', 'Indiana Jones and the Raiders of the Lost Ark', '1981', '115', '8.4'),
 ('00015235', 'Star Trex', '2005', '127', '9.2'),
 ('00015236', 'Super 8', '2011', '112', '7.0'),
 ('00015111', 'Inception', 2010, 148,  8.8),
 ('02225236', 'Titanic', 1997, 195,  7.8),
 ('20025632', 'The Matrix', '1999', 136, 5.3),
 ('20025633', 'Avatar', '2009', 162, 7.9);
 

 INSERT INTO mGenres ( movieID, genre)VALUES
 ('chri1234', 'Horror'),
 ('chri1234', 'Thriller'),
 ('sill4321', 'Comedy'),
 ('00015523', 'Comedy'),
 ('00015523', 'Sitcom'),
 ('00015523', 'Drama'),
 ('00015523', 'History'),
 ('11110123', 'Drama'),
 ('00015234', 'Action'),
 ('00015234', 'Adventure'),
 ('00015235', 'Action'),
 ('00015235', 'Sci-Fi'),
 ('00015231', 'Action'),
 ('00015231', 'Adventure'),
 ('00015236', 'Action'),
 ('00015236', 'Mystery'),
 ('00015236', 'Sci-Fi'),
 ('20025633','Sci-Fi'),
 ('20025633','Action'),
 ('00015111', 'Action'),
 ('00015111', 'Sci-Fi'),
 ('02225236','Romance'),
 ('02225236','Adventure'),
 ('20025632', 'Sci-Fi'),
 ('20025632', 'Action');

 

 INSERT INTO Directors ( dID, fName, lName, dob) VALUES
 ('Der123', 'Lewis', 'Jackson', '1950-01-01'),
 ('Bil321', 'Bill', 'Smith', '1959-10-01'),
 ('00151', 'Tony', 'McNamara', '1957-12-12'),   
 ('11110', 'Drake', 'Turns', '1980-07-07'),
 ('00152', 'Steven', 'Speilberg', '1946-12-28'),
 ('00153', 'J.J.', 'Abrams', '1966-06-27'),
 ('10153', 'Christopher', 'Nolan', '1970-07-30'),
 ('11330','James', 'Cameron','1954-08-26');

 INSERT INTO Actors ( aID, fName, lName)VALUES
 ('tom001', 'Brandon', 'Maggart'),
 ('tom002', 'Jeffrey', 'DeMunn'), 
 ('tom003', 'Dianne', 'Hull'),
 ('tom004', 'Andy', 'Fenwick'),
 ('cam321', 'Cammie', 'Bobby'),
 ('000111', 'Elle', 'Fanning'), 
 ('000112', 'Nicholas', 'Hoult'), 
 ('000113', 'Phoebe', 'Fox'),
 ('000114', 'Sacha', 'Dhawan'), 
 ('000115', 'Charity', 'Wakefield'),
 ('000116', 'Gwilym', 'Lee'),
 ('000117', 'Adam', 'Godley'),
 ('000118', 'Douglas', 'Hodge'),
 ('000119', 'Harrison', 'Ford'), 
 ('000120', 'Karen', 'Allen'), 
 ('000121', 'Paul', 'Freenman'), 
 ('000122', 'John', 'Rhys-Davies'), 
 ('000123', 'Ronald', 'Lacey'),
 ('000124', 'Denholm', 'Elliott'),
 ('000125', 'AJ', 'Michalka'),
 ('000126', 'Kyle', 'Courtney'), 
 ('000127', 'Jessica', 'Tuck'),
 ('000128', 'Joel', 'Miller'),
 ('000129', 'Ryan', 'Lee'),
 ('000130', 'Zach', 'Mills'),
 ('000131', 'Riley', 'Griffiths'),
 ('000132', 'Leonardo', 'DiCaprio'),
 ('000133', 'Cillian', 'Murphy'),
 ('000134', 'Zoe', 'Saldana'),
 ('000135', 'Sam', 'Worthington'),
 ('000136', 'Sigoumey', 'Weaver');



 INSERT INTO Streams ( movieID, name, memberID, rating, dateTimeWatched)VALUES
 ('chri1234', 'Kid','robert123', 3.0, '2021-12-21 11:01:22'),
 ('chri1234', 'Dad','robert123', 4.0, '2021-12-21 11:01:22'),
 ('00015231', 'Dad','robert123', 4.0, '2021-12-24 20:15:22'),
 ('sill4321', 'Kid','robert123', 9.9, '2021-12-21 13:01:26'),
 ('chri1234', 'Leia','cassie321', 7.0, '2021-12-21 09:01:22'),
 ('sill4321', 'Leia','cassie321', 9.8, '2021-12-20 10:01:22'),
 ('00015523', 'Leia','cassie321', 5.0, '2021-12-22 13:00:00'),
 ('11110123', 'Leia','cassie321', 9.9, '2021-12-23 14:30:30'), 
 ('00015234', 'Mom','cassie321', 7.0, '2022-01-21 15:01:00'),
 ('11110123', 'Mom','cassie321', 9.8, '2022-01-24 10:34:26'),
 ('00015523', 'Mom', 'cassie321', 8.8, '2021-12-23 20:01:00'),
 ('sill4321', 'Skywalker', 'cassie321', 9.1, '2021-10-11 21:00:07'), 
 ('00015234', 'Skywalker','cassie321', 6.8, '2021-10-14 21:01:22'),
 ('11110123', 'Skywalker','cassie321', 9.6, '2021-10-21 21:00:56'), 
 ('chri1234', 'Skywalker','cassie321', 5.6, '2021-10-21 23:10:22'),
 ('00015234', 'Anakin', 'cassie321', 8.9, '2022-01-11 14:01:22'),
 ('00015231', 'Anakin', 'cassie321', 8.9, '2022-01-15 15:01:00'),
 ('00015523', 'Kid1', 'Abana101',8.8, '2021-12-23 20:01:00'),
 ('sill4321', 'Kid1', 'Abana101', 9.1, '2021-10-11 21:00:07'), 
 ('00015235','Adam', 'gates001', 9.9, '2021-10-11 21:00:07'), 
 ('00015235','Nina', 'gates001', 9.8, '2021-10-11 21:00:07'), 
 ('00015235','kim', 'jones512', 9.9, '2021-12-11 20:30:07'), 
 ('11110123','kim', 'jones512', 9.8, '2021-12-11 18:00:05'), 
 ('11110123','Nina', 'jones512', 9.9, '2021-12-11 19:00:07'), 
 ('00015235','Nina', 'jones512', 9.8, '2021-12-11 20:00:07');
 
 INSERT INTO Directs ( dID, movieID)VALUES
 ('Der123', 'chri1234'),
 ('Bil321', 'sill4321'),
 ('00151', '00015523'),
 ('11110', '11110123'),
 ('00152', '00015234'),
 ('00153', '00015235'),
 ('00152', '00015236'),
 ('00153', '00015236'),
 ('10153', '00015111'),
 ('11330','02225236'),
 ('11330','20025633');
 
 INSERT INTO Casts ( movieID, aID, role)VALUES
 ('chri1234', 'tom001', 'Harry Stadling'),
 ('chri1234', 'tom002', 'Philip Stadling'),
 ('chri1234', 'tom003', 'Kackie Stadling'), 
 ('chri1234', 'tom004', 'Dennis Stadling') ,
 ('sill4321', 'cam321', 'The Runaway'),
 ('00015523', '000111','Catherine'),
 ('00015523', '000112','Peter III of Russia'),
 ('00015523', '000113','Marial'),
 ('00015523', '000114','Count Orlo'),
 ('00015523', '000115','Georgina Dymova'),
 ('00015523', '000116','Grigor Dymov'),
 ('00015523', '000117','Archie'),
 ('00015523', '000118','General Velement'),
 ('00015234', '000119','Indy'),
 ('00015234', '000120', 'Marion'), 
 ('00015234', '000121', 'Bellog'), 
 ('00015234', '000122', 'Sallah'), 
 ('00015234', '000123', 'Toht'), 
 ('00015234', '000124', 'Brody'),
 ('00015231', '000119','Indy'),
 ('00015231', '000120', 'Marion'), 
 ('00015231', '000121', 'Bellog'), 
 ('00015231', '000122', 'Sallah'), 
 ('00015231', '000123', 'Toht'), 
 ('00015231', '000124', 'Brody'),
 ('00015236', '000111','Alice Dainard'),
 ('00015236', '000126','Jen Kaznyk'),
 ('00015236', '000127','Deputy Jackson Lamb'),
 ('00015236', '000128','Joe Lamb'),
 ('00015236', '000129','Mrs. Kaznyk'),
 ('00015236', '000130','Mr. Kaznyk'),
 ('00015236', '000131','Cary'),
 ('00015111','000132', 'Cobb'),
 ('00015111','000133', 'Fisher'),
 ('20025633','000134', 'Zeytin'),
 ('20025633','000135', 'Jake Sully'),
 ('20025633','000136', 'Dr. Grace Augus');
 

--  SHOW TABLES;

 SELECT * FROM Actors;
 SELECT * FROM Accounts;
 SELECT * FROM Movies;
 SELECT * FROM Directors;

 SELECT * FROM Directs;
 SELECT * FROM Casts;
 SELECT * FROM CreatesProfiles;
 SELECT * FROM pGenres;
 SELECT * FROM Streams;
 SELECT * FROM MGenres;
