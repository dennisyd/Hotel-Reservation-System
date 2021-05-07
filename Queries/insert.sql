insert into Customer
values(1,'Ahmed','Ahmed.Mohamed',123456)

insert into Customer
values(2,'Mohamed','Mohamed_Ali',149657)

insert into Customer
values(3,'Alaa','Alaa_Ezzat',457813)

insert into Customer
values(4,'Amr','Amr_Mohamed',667012)

insert into Customer
values(5,'Omer','Omer.Ahmed',234801)


insert into UserProfile
values(1,'Ahmed Mohamed',01119955478,'Ahmed.Mohamed@gmail.com','Ahmed Orabi st,Heliopolis,Cairo','Egyptian','Married','Male',1)

insert into UserProfile
values(2,'Alaa Ezzat',01004587633,'Alaa.Ezzat@yahoo.com','Khalid Ibn El WAleed st,Nasr City,Cairo','Egyptian','Single','Male',3)

insert into UserProfile
values(3,'Omer Ahmed',249155888,'Omer.Ahmed@hotmail.com','Mountain St,Khartoum','Sudanese','Married','Male',5)

insert into UserProfile
values(4,'Mohamed Ali',966014756,'Mohamed_Ali@gmail.com','agiad st,makkah','Saudi Arabian','Married','Male',2)

insert into UserProfile
values(5,'Amr Mohamed',01007456911,'Amr.Mohamed2016@yahoo.com','El Wadi st,Cairo','Egyptian','Single','Male',4)


insert into Bill
values(1,'3 days in Sheraton hotel Sharm El Sheikh branch ',3000,'Visa','Payment has successfully done',2)

insert into Bill
values(2,'5 days in Marriot hotel Hurghada branch',6000,'Master Card','Payment has failed',4)

insert into Bill
values(3,'7 days in Seagull hotel Sharm El Sheikh branch',8000,'Cash','Payment has successfully done',1)

insert into Bill
values(4,'4 days in Helton hotel Cairo branch',4000,'Visa','Payment has successfully done',3)

insert into Bill
values(5,'3 days in Viva hotel Sharm el sheikh branch',1000,'Visa','Payment has failed',5)


insert into Hotel
values(1,'Sheraton',5,'Sheraton@gmail.com',0224877456)

insert into Hotel
values(2,'Helton',5,'Helton@gmail.com',0224841456)

insert into Hotel
values(3,'Marriot',5,'Marriot@yahoo.com',0224877776)

insert into Hotel
values(4,'Seagull',4,'Seagull@hotmail.com',0224877666)

insert into Hotel
values(5,'Viva',3,'Viva@yahoo.com',0225277456)


insert into Review
values(1,'Positive','Ahmed.Mohamed','Food is delicious and diverse','1-10-2016',4)

insert into Review
values(2,'Negative','Mohamed_Ali',' Room cleanliness is bad','10-10-2016',1)

insert into Review
values(3,'Positive','Alaa_Ezzat','Aqua park is amazing and very safe','1-11-2016',2)

insert into Review
values(4,'Negative','Amr_Mohamed','Swimming pools are unsafe and very deep','5-12-2016',3)

insert into Review
values(5,'Negative','Omer.Ahmed','Animation team is very iterative','1-11-2016',5)


insert into UserProfile_favorite_list
values('Sheraton',2)

insert into UserProfile_favorite_list
values('Marriot',2)

insert into UserProfile_favorite_list
values('Helton',1)

insert into UserProfile_favorite_list
values('Sheraton',1)

insert into UserProfile_favorite_list
values('Seagull',3)

insert into UserProfile_favorite_list
values('ViVa',3)

insert into UserProfile_favorite_list
values('Viva',4)

insert into UserProfile_favorite_list
values('Seagull',4)

insert into UserProfile_favorite_list
values('Marriot',5)

insert into UserProfile_favorite_list
values('Helton',5)


insert into UserProfile_Previous_booking_list
values('3 days in Sheraton Hotel Sharm El Sheikh branch',4)

insert into UserProfile_Previous_booking_list
values('5 days in Marriot Hotel Hurghada branch',3)

insert into UserProfile_Previous_booking_list
values('7 days in Seagull Hotel Sharm El Sheikh branch',1)

insert into UserProfile_Previous_booking_list
values('4 days in Helton Hotel Cairo branch',2)

insert into UserProfile_Previous_booking_list
values('3 days in Viva hotel Sharm El Sheikh branch',5)


insert into Hotel_branches
values('Sharm El Sheikh',1)

insert into Hotel_branches
values('Hurghada',1)

insert into Hotel_branches
values('Cairo',2)

insert into Hotel_branches
values('Sharm El Sheikh',2)

insert into Hotel_branches
values('Hurghada',3)

insert into Hotel_branches
values('Alexandria',3)

insert into Hotel_branches
values('Sharm El Sheikh',4)

insert into Hotel_branches
values('Sinai',4)

insert into Hotel_branches
values('Aswan',5)

insert into Hotel_branches
values('Sharm El Sheikh',5)


insert into Reservation
values(1,'Ahmed Mohamed-Seagull Hotel','1-1-2016',7,'2-1-2016','9-1-2016',8000,'Confirm',1,4)

insert into Reservation
values(2,'Mohamed Ali-Sheraton Hotel','5-1-2016',3,'6-1-2016','9-1-2016',3000,'Confirm',2,1)

insert into Reservation
values(3,'Alaa Ezzat-Helton Hotel','1-3-2016',4,'5-3-2016','9-3-2016',4000,'Confirm',3,2)

insert into Reservation
values(4,'Amr Mohamed-Marriot Hotel','2-4-2016',5,'7-4-2016','12-4-2016',6000,'Cancelled',4,3)

insert into Reservation
values(5,'Omer Ahmed-Viva Hotel','6-6-2016',3,'7-6-2016','10-6-2016',1000,'Confirm',5,5)
