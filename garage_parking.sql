-- Andrew Bruckbauer
-- 10/21/2021
-- Database for Parking Spots

create database ParkingSpots;
	use ParkingSpots;
	-- Use parking spot DB

	create table Rate(
		Start int,
		End int,
		Fee int,
		RateTimePeriod int,
		Primary Key (Fee)
		);	
	create table Customers(
		CustomerID int,
		FName varchar(30),
		LName varchar(30),
		Address varchar(30),
		Email varchar(30),
		Phone varchar(30),
		Fee int,
		Primary Key (CustomerID),
		Foreign Key (Fee) references Rate(Fee)
		);
	create table Spot(
		SpotID int,
		SpotNum int,
		SpotFloor int,
		SpotStat varchar(30),
		PRIMARY KEY (SpotID)
		);
	create table Parking_Event(
		SpotID int,
		Date int,
		Start int,
		End int,
		PicID int,
		PRIMARY KEY (PicID),
		Foreign Key (SpotID) references Spot(SpotID)
		);