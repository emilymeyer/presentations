CREATE TABLE Color (
ID uniqueidentifier NOT NULL Primary KEY,
Name varchar(20) null,
Neutral bit DEFAULT(0)
)

CREATE TABLE Clothing_Type(
ID uniqueidentifier NOT NULL Primary KEY,
Name varchar(20)
)

CREATE TABLE Shirt (
ID uniqueidentifier NOT NULL Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
Brand varchar (50) null,
type uniqueidentifier FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Shirt_Color_Bridge(
ID uniqueidentifier NOT NULL Primary KEY,
Shirt_ID uniqueidentifier FOREIGN KEY References Shirt(ID),
Color_ID uniqueidentifier FOREIGN KEY References Color(ID)
)

CREATE TABLE Jeans (
ID uniqueidentifier NOT NULL Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
Brand varchar(50) null,
type uniqueidentifier FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Jeans_Color_Bridge(
ID uniqueidentifier NOT NULL Primary KEY,
Jeans_ID uniqueidentifier FOREIGN KEY References Jeans(ID),
Color_ID uniqueidentifier FOREIGN KEY References Color(ID)
)


CREATE TABLE Shoes (
ID uniqueidentifier NOT NULL Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
plaid bit null default(0),
brand varchar(50),
type uniqueidentifier FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Shoes_Color_Bridge(
ID uniqueidentifier NOT NULL Primary KEY,
Shoes_ID uniqueidentifier FOREIGN KEY References Shoes(ID),
Color_ID uniqueidentifier FOREIGN KEY References Color(ID)
)


INSERT INTO Clothing_Type (ID, Name)
VALUES (NEWID(), 'Shirt')


INSERT INTO Clothing_Type (ID, Name)
VALUES (NEWID(), 'Jeans')


INSERT INTO Clothing_Type (ID, Name)
VALUES (NEWID(), 'Shoes')

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Red', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Orange', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Yellow', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Green', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Blue', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Purple', 0)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Brown', 1)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'Black', 1)

INSERT INTO Color (ID, Name, Neutral)
VALUES (NEWID(), 'White', 1)

ALTER TABLE Shirt ADD Picture ntext NULL

ALTER TABLE Jeans ADD Picture ntext NULL

ALTER TABLE Shoes ADD Picture ntext NULL
