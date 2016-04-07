drop table shoes_color_bridge
drop table shirt_color_bridge
drop table jeans_color_bridge
DROP TABLE COLOR
DROP TABLE Clothing_TYpe
DROP TABLE Shirt
DROP Table Jeans
drop table shoes


CREATE TABLE Color (
ID integer NOT NULL identity Primary KEY,
Name varchar(20) null,
Neutral bit DEFAULT(0)
)

CREATE TABLE Clothing_Type(
ID integer NOT NULL identity Primary KEY,
Name varchar(20)
)

CREATE TABLE Shirt (
ID integer NOT NULL  identity Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
Brand varchar (50) null,
type integer FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Shirt_Color_Bridge(
ID integer NOT NULL  identity Primary KEY,
Shirt_ID integer FOREIGN KEY References Shirt(ID),
Color_ID integer FOREIGN KEY References Color(ID)
)

CREATE TABLE Jeans (
ID integer NOT NULL identity Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
Brand varchar(50) null,
type integer FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Jeans_Color_Bridge(
ID integer NOT NULL identity Primary KEY,
Jeans_ID integer FOREIGN KEY References Jeans(ID),
Color_ID integer FOREIGN KEY References Color(ID)
)


CREATE TABLE Shoes (
ID integer NOT NULL identity Primary KEY,
Name varchar(50) null,
Description varchar(200) null,
brand varchar(50),
type integer FOREIGN KEY References Clothing_Type(ID)
)

CREATE TABLE Shoes_Color_Bridge(
ID integer NOT NULL identity Primary KEY,
Shoes_ID integer FOREIGN KEY References Shoes(ID),
Color_ID integer FOREIGN KEY References Color(ID)
)


INSERT INTO Clothing_Type (Name)
VALUES ('Shirt')


INSERT INTO Clothing_Type (Name)
VALUES ('Jeans')


INSERT INTO Clothing_Type (Name)
VALUES ('Shoes')

INSERT INTO Color (Name, Neutral)
VALUES ('Red', 0)

INSERT INTO Color (Name, Neutral)
VALUES ('Orange', 0)

INSERT INTO Color (Name, Neutral)
VALUES ('Yellow', 0)

INSERT INTO Color (Name, Neutral)
VALUES ('Green', 0)

INSERT INTO Color (Name, Neutral)
VALUES ('Blue', 0)

INSERT INTO Color (Name, Neutral)
VALUES ('Purple', 0)

ALTER TABLE Shirt ADD Picture ntext NULL

ALTER TABLE Jeans ADD Picture ntext NULL

ALTER TABLE Shoes ADD Picture ntext NULL
