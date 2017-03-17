USE AirBNB;
GO

/*3-1. Display all records from each table*/
Select * from payment 
Select * from Booking
Select * from Member
Select * from Listing
Select * from Host; 

/*3-2. Aggregate Function: how much payment has been made for booking in total?*/
Select sum(amount) as Total_payment, feetype
from Payment
where FeeType = 'booking' 
Group by FeeType;

/*3-3. Inner Join: Display member names that already made booking and their total*/
Select Feetype, sum(Amount) as Payment_total, Firstname, Lastname 
from Payment 
join booking 
on payment.BookingID = Booking.BookingID
join member 
on booking.MemberID = Member.MemberID
where FeeType = 'booking'
Group by Firstname, Lastname, FeeType; 

/*3-4. Outer join: We want to examine which property listed haven't completed its transaction yet. We need right join on booking because we need to display all properties that are booked, then the payment items are displayed based on the entry of booking. If one reseravation havn't completed transaction yet, it will receive a "null" notifaction on this query. The booking I inserted below does not have a payment, which will show on the query as null*/

INSERT INTO Booking (BookingID, DateBooked, StartDate, EndDate, NumPeople, MemberID, ListingID) VALUES
(13, '2017-03-09', '2017-03-25', '2017-03-29', 10, 9, 5);
Go

Select ListingID,Feetype, sum(Amount) as Payment_total
From payment 
right join booking 
on Payment.bookingid = booking.bookingid 
Group by Listingid, FeeType; 

/*3-5. Display the total payment for each type of listing housing regardless of its payment type */
Select sum(grand_total) as total_total, Listing.HouseType
From 
(Select Bookingid, Sum(amount) as grand_total
from Payment
Group by BookingID) as newpayment 
join Booking 
on newpayment.BookingID = Booking.BookingID
Join listing 
on Booking.ListingID = Listing.ListingID
Group by Listing.HouseType; 

/*Team name : "AirBNB", Team Member: E, Frank, Paul*/