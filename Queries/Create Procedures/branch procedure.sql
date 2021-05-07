create proc branch
@hotel_name nvarchar(max)
as
select branches
from Hotel_branches b inner join Hotel h
on b.Hotel_ID=h.Hotel_ID
where h.Hotel_Name=@hotel_name
