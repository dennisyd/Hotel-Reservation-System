CREATE TABLE Customer
(
  ID INT Primary Key,
  Customer_Name nvarchar(max) NOT Null,
  Username nvarchar(max) NOT Null,
  Customer_password INT NOT Null,
);

CREATE TABLE UserProfile
(
  Profile_ID INT Primary Key,
  User_FullName nvarchar(max) NOT NULL,
  Phone INT NOT NULL,
  Email nvarchar(max) NOT NULL,
  User_Address nvarchar(max) NOT NULL,
  nationality nvarchar(max) NOT NULL,
  Marital_status nvarchar(max) NOT NULL,
  Gender nvarchar(max) NOT NULL,
  ID INT NOT NULL,
FOREIGN KEY (ID)REFERENCES Customer(ID)
);

CREATE TABLE Bill
(
  Bill_ID INT Primary Key,
  Bill_Details nvarchar(max) NOT NULL,
  Bill_Cost money NOT NULL,
  payment_method nvarchar(max) NOT NULL,
  Payment_status nvarchar(max) NOT NULL,
  ID INT NOT NULL,
FOREIGN KEY (ID)REFERENCES Customer(ID)
);

CREATE TABLE Hotel
(
  Hotel_ID INT Primary Key,
  Hotel_Name nvarchar(max) NOT NULL,
  rating INT NOT NULL,
  Contact_Email nvarchar(max) NOT NULL,
  Contact_phones INT NOT NULL,
);

CREATE TABLE Review
(
  Review_ID INT Primary Key,
  Review_type nvarchar(max) NOT NULL,
  UserName nvarchar(max) NOT NULL,
  Review_syntax nvarchar(max) NOT NULL,
  Review_Date date NOT NULL,
  Hotel_ID INT NOT NULL,
FOREIGN KEY (Hotel_ID)REFERENCES Hotel(Hotel_ID)
);

CREATE TABLE UserProfile_favorite_list
(
  favorite_list nvarchar(100) Not Null,
  Profile_ID INT NOT NULL,
  PRIMARY KEY (favorite_list, Profile_ID),
FOREIGN KEY (Profile_ID)REFERENCES UserProfile(Profile_ID)
);

CREATE TABLE UserProfile_Previous_booking_list
(
  Previous_booking_list nvarchar(100) Not Null,
  Profile_ID INT Not Null,
  PRIMARY KEY (Previous_booking_list, Profile_ID),
FOREIGN KEY (Profile_ID)REFERENCES UserProfile(Profile_ID)
);

CREATE TABLE Hotel_branches
(
  branches nvarchar(100) NOT NULL,
  Hotel_ID INT NOT NULL,
  PRIMARY KEY (branches, Hotel_ID),
FOREIGN KEY (Hotel_ID)REFERENCES Hotel(Hotel_ID)
);

CREATE TABLE Reservation
(
  Reservation_ID INT PRIMARY KEY,
  Reservation_Title nvarchar(max) NOT NULL,
  Reservation_Date date NOT NULL,
  Duration_of_stay INT NOT NULL,
  Check_in_date date NOT NULL,
  check_out_date date NOT NULL,
  Reservation_cost money NOT NULL,
  Reservation_status nvarchar(max) NOT NULL,
  ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
FOREIGN KEY (ID)REFERENCES Customer(ID),
FOREIGN KEY (Hotel_ID)REFERENCES Hotel(Hotel_ID)
);

