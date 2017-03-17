CREATE DATABASE AirBNB;
GO

USE AirBNB;
GO

CREATE TABLE Member (
  MemberID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  DateOfBirth date NOT NULL,
  Email varchar(50) NOT NULL,
  PhoneNo char(10)
);

CREATE TABLE Host (
  MemberID bigint NOT NULL PRIMARY KEY,
  HostSince date NOT NULL,
  CONSTRAINT FK_Host_Member FOREIGN KEY (MemberID)
  REFERENCES Member(MemberID)
);

CREATE TABLE Listing (
  ListingID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  Zip char(5) NOT NULL,
  HouseType char(50) NOT NULL,
  Price int NOT NULL,
  MemberID bigint NOT NULL,
  CONSTRAINT FK_Listing_Host FOREIGN KEY (MemberID)
  REFERENCES Host(MemberID)
);

CREATE TABLE Booking (
  BookingID bigint NOT NULL PRIMARY KEY,
  DateBooked date NOT NULL,
  StartDate date NOT NULL,
  EndDate date NOT NULL,
  NumPeople int NOT NULL,
  MemberID bigint NOT NULL,
  ListingID bigint NOT NULL,
  CONSTRAINT FK_Booking_Member FOREIGN KEY (MemberID)
  REFERENCES Member(MemberID),
  CONSTRAINT FK_Booking_Listing FOREIGN KEY (ListingID)
  REFERENCES Listing(ListingID)
);

CREATE TABLE Payment (
  PaymentID bigint NOT NULL PRIMARY KEY,
  FeeType varchar(50) NOT NULL,
  Amount int NOT NULL,
  BookingID bigint NOT NULL,
  CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID)
  REFERENCES Booking(BookingID)
);

-- Add Members
INSERT INTO Member (MemberID, FirstName, LastName, DateOfBirth, Email, PhoneNo) VALUES
(1, 'John', 'Smith', '1996-01-01', 'jsmith1996@gmail.com', '1112223333'),
(2, 'Jane', 'Doe', '1996-02-02', 'jdoe1996@gmail.com', '2221113333'),
(3, 'Joe', 'Black', '1996-03-03', 'jblack1996@gmail.com', '3332221111'),
(4, 'Kevin', 'Laney', '1997-04-04', 'klaney1997@gmail.com', '4445556666'),
(5, 'Katie', 'White', '1997-05-05', 'kwhite1997@gmail.com', '5554446666'),
(6, 'Kurt', 'Langston', '1997-06-06', 'klangston1997@gmail.com', '6665554444'),
(7, 'Luke', 'Skywalker', '1998-07-07', 'lskywalker1998@gmail.com', '7778889999'),
(8, 'Lenny', 'Jenson', '1998-08-08', 'ljenson1998@gmail.com', '8887779999'),
(9, 'Linda', 'Burn', '1998-09-09', 'lburn1998@gmail.com', '9998887777'),
(10, 'Mandy', 'Gallow', '1999-10-10', 'mgallow1999@gmail.com', '2223331111'),
(11, 'Mark', 'Daniels', '1999-11-11', 'mdaniels1999@gmail.com', '5556664444'),
(12, 'Matthew', 'Carmen', '1999-12-12', 'mcarmen1999@gmail.com', '8889997777');
GO

-- Add Hosts
INSERT INTO Host (MemberID, HostSince) VALUES
(1, '2002-01-01'),
(2, '2002-02-02'),
(3, '2002-03-03'),
(5, '2002-05-05'),
(6, '2002-06-06'),
(8, '2002-08-08'),
(9, '2002-09-09'),
(10, '2002-10-10'),
(11, '2002-11-11'),
(12, '2002-12-12');
GO

 -- Add Listings
INSERT INTO Listing (ListingID, Name, Zip, HouseType, Price, MemberID) VALUES
(1, 'House of John', '11111', 'Apartment', 30, 1),
(2, 'House of Jane', '22222', 'Single Room', 35, 2),
(3, 'House of Joe', '33333', 'House', 40, 3),
(4, 'House of Katie', '44444', 'Apartment', 45, 5),
(5, 'House of Kurt', '55555', 'Single Room', 50, 6),
(6, 'House of Lenny', '66666', 'House', 55, 8),
(7, 'House of Linda', '77777', 'Apartment', 60, 9),
(8, 'House of Mandy', '88888', 'Single Room', 65, 10),
(9, 'House of Mark', '99999', 'Apartment', 70, 11),
(10, 'House of Matthew', '12345', 'Apartment', 75, 12);
GO

 -- Add Bookings
INSERT INTO Booking (BookingID, DateBooked, StartDate, EndDate, NumPeople, MemberID, ListingID) VALUES
(1, '2017-03-01', '2017-03-14', '2017-03-18', 2, 1, 10),
(2, '2017-03-01', '2017-03-14', '2017-03-18', 2, 2, 9),
(3, '2017-03-01', '2017-03-14', '2017-03-18', 2, 3, 8),
(4, '2017-03-01', '2017-03-14', '2017-03-18', 2, 4, 7),
(5, '2017-03-01', '2017-03-14', '2017-03-18', 2, 5, 6),
(6, '2017-03-01', '2017-03-14', '2017-03-18', 4, 6, 5),
(7, '2017-03-01', '2017-03-14', '2017-03-18', 4, 7, 4),
(8, '2017-03-01', '2017-03-14', '2017-03-18', 4, 8, 3),
(9, '2017-03-01', '2017-03-14', '2017-03-18', 4, 9, 2),
(10, '2017-03-01', '2017-03-14', '2017-03-18', 4, 10, 1),
(11, '2017-03-02', '2017-03-24', '2017-03-28', 2, 11, 10),
(12, '2017-03-02', '2017-03-24', '2017-03-28', 2, 12, 9);
GO

 -- Add Payments
INSERT INTO Payment (PaymentID, FeeType, Amount, BookingID) VALUES
(1, 'Booking', 300, 1),
(2, 'Service', 40, 1),
(3, 'Booking', 325, 2),
(4, 'Service', 41, 2),
(5, 'Booking', 350, 3),
(6, 'Service', 42, 3),
(7, 'Booking', 375, 4),
(8, 'Service', 43, 4),
(9, 'Booking', 400, 5),
(10, 'Service', 44, 5),
(11, 'Booking', 425, 6),
(12, 'Service', 45, 6),
(13, 'Booking', 450, 7),
(14, 'Service', 46, 7),
(15, 'Booking', 475, 8),
(16, 'Service', 47, 8),
(17, 'Booking', 500, 9),
(18, 'Service', 48, 9),
(19, 'Booking', 525, 10),
(20, 'Service', 49, 10),
(21, 'Booking', 550, 11),
(22, 'Service', 50, 11),
(23, 'Booking', 575, 12),
(24, 'Service', 51, 12),
(25, 'Damage', 215, 6);
GO