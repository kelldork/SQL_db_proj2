--
--  Clean up the real estate database
--
--  Kasie Kelldorf, Michael Rodriguez, Brock Yarbrough
--

set termout on
prompt Removing real estate database.  Please wait ...
set termout off
set feedback off

drop table Branch           cascade constraint;
drop table Property         cascade constraint;
drop table Buyer            cascade constraint;
drop table Renter           cascade constraint;
drop table ListingAgent     cascade constraint;
drop table SellingAgent     cascade constraint;
