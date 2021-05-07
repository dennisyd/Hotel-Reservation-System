create proc search1
@s varchar(20)
as
select *
from Hotel
where Hotel_Name = @s