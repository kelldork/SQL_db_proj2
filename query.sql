set feedback on
set termout on

--What properties(property_id and address) have been listed for both sale and for rent?
create or replace view q1 as
    select property_id,street_address from property
    where property.sale='rent'
    union
    select property_id,street_address from property
    where property.sale='sale'
   ;

--What properties are located in zip code 78666? 
create or replace view q2 as
	select property_id,street_address from property
    where property.zipcode='78666'
   ;
   
--What properties have been sold? 
create or replace view q3 as
	select property_id,street_address from property
    where property.sale='sold'
   ;
   
--What properties have been rented? 
create or replace view q4 as
	select property_id,street_address from property
    where property.sale='rented'
   ;
   
--What buyers want to live in 77573? 
create or replace view q5 as
	select client_id,email from buyer
    where buyer.location=77573
   ;

--What properties are listed under the 33333333 Listing Agent ID? 
create or replace view q6 as
	select property_id from property
    where property.listing_agent=33333333
   ;   


select * from q1;
select * from q2;
select * from q3;
select * from q4;
select * from q5;
select * from q6;
