create proc details
@bill_id int,
@@bill_details nvarchar(max) output
as
select @@bill_details=Bill_Details from Bill
where Bill_ID=@bill_id

