create database hospital__hms;

use hospital__hms;

Create table admin(
	userid varchar(50) NOT NULL UNIQUE,
	pass varchar(50) NOT NULL
	);
	Insert into admin(userid,pass)
	values ('admin1','hamza'),
	('admin2','qazi'),
	('admin3','shah');


CREATE TABLE Persons (
    PersonID int NOT NULL,
    FirstName varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
    PhoneNumber bigint NOT NULL,
    PRIMARY KEY (PersonID)
);

Insert into Persons(PersonID,FirstName,Address,PhoneNumber)
values ( 

CREATE TABLE Doctor(
	PersonID int Primary key NOT NULL,	
	Specialization varchar(255) NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Patient(
	PersonID int Primary key NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Nurse(
	PersonID int Primary key NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Disease(
	DiseaseID int NOT NULL,
	name varchar(255) NOT NULL,
	PRIMARY KEY(DiseaseID),
);

CREATE TABLE PatientDisease(
	PersonID int NOT NULL,
	DiseaseID int NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Patient(PersonID),
	FOREIGN KEY(DiseaseID) REFERENCES Disease(DiseaseID),
);

CREATE TABLE PatientDocter(
	PersonID int Primary key NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Patient(PersonID),
	FOREIGN KEY(PersonID) REFERENCES Doctor(PersonID),
);

CREATE TABLE Duty(
	DutyHour int NOT NULL,
	DutyRoom int NOT NULL,
	PersonID int NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Nurse(PersonID),
	FOREIGN KEY(PersonID) REFERENCES Doctor(PersonID),
);


Create table Room(
	Room_status int,
	ROOM_NUMBER INT NOT NULL,
	PRIMARY KEY(ROOM_NUMBER));


Create table Alloted_rooms(
	PersonID int NOT NULL,
	ROOM_NUMBER INT NOT NULL,
	FOREIGN KEY(PersonID) REFERENCES Patient(PersonID),
	FOREIGN KEY(PersonID) REFERENCES Nurse(PersonID),
	FOREIGN KEY(ROOM_NUMBER) REFERENCES Room(ROOM_NUMBER),
);