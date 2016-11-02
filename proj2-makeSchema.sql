--
--  Create a real estate database
--
--  Kasie Kelldorf, Michael Rodriguez, Brock Yarbrough
--

set termout on
set feedback on
prompt Building real estate database.  Please wait ...
set termout off
set feedback off

create table Branch (
	location NUMBER(5) PRIMARY KEY
);

insert into Branch values (77581);
insert into Branch values (78666);
insert into Branch values (77432);
insert into Branch values (77512);
insert into Branch values (77573);

create table ListingAgent (
	staff_id NUMBER(8) PRIMARY KEY,
	phone# NUMBER(10),
	email VARCHAR(20),
	payroll NUMBER(10),
	commission VARCHAR(3)
);

insert into ListingAgent values (11111111, 7132453849, 'krobi@fakerealty.com', 42000, '3%');
insert into ListingAgent values (22222222, 7133523569, 'sstew@fakerealty.com', 42000, '3%');
insert into ListingAgent values (33333333, 2813325643, 'csmit@fakerealty.com', 42000, '3%');
insert into ListingAgent values (44444444, 5123256444, 'tjone@fakerealty.com', 42000, '3%');
insert into ListingAgent values (55555555, 5129325825, 'ttodd@fakerealty.com', 42000, '3%');


create table SellingAgent (
	staff_id NUMBER(8) PRIMARY KEY,
	phone# NUMBER(10),
	email VARCHAR(20),
	payroll NUMBER(10),
	commission VARCHAR(3),
	houses_sold NUMBER(2)
);

insert into SellingAgent values (00000000, 5128723455, 'rsmit@fakerealty.com', 42000, '6%', 4);
insert into SellingAgent values (66666666, 8327485294, 'qjone@fakerealty.com', 42000, '6%', 12);
insert into SellingAgent values (77777777, 2813324566, 'talph@fakerealty.com', 42000, '6%', 9);
insert into SellingAgent values (88888888, 9368234566, 'jkell@fakerealty.com', 42000, '6%', 1);
insert into SellingAgent values (99999999, 9362356663, 'writa@fakerealty.com', 42000, '6%', 4);


create table Property (
	property_id   NUMBER(6),
	listing_agent NUMBER(8),
	price FLOAT(10),
	zipcode NUMBER(5),
	street_address VARCHAR(20),
	date_listed VARCHAR(8),
	bedrooms NUMBER(1),
	bathrooms NUMBER(1),
	type_of_sale VARCHAR(11),
	branch NUMBER(5),
	sale VARCHAR(6),
	PRIMARY KEY (property_id),
	FOREIGN KEY (listing_agent) REFERENCES ListingAgent(staff_id),
	FOREIGN KEY (branch) REFERENCES Branch(location)
);

insert into Property values (000001, 11111111, 30000, 78666, '1414 Sarah Dr', '02/13/16', 2, 1, 'Apartment', 78666, 'rented');
insert into Property values (000002, 22222222, 45000, 78666, '300 N LBJ Dr', '11/07/15', 2, 2, 'House', 78666, 'sale');
insert into Property values (000003, 11111111, 30000, 77573, '3456 Walrus Way', '02/13/16', 2, 1, 'Apartment', 77573, 'rent');
insert into Property values (000004, 33333333, 120000, 77512, '1235 Mansion St', '04/28/16', 5, 5, 'House', 77512, 'sale');
insert into Property values (000005, 55555555, 30000, 77573, '900 Graham Ln', '10/14/16', 3, 2, 'House', 77573, 'sold');
insert into Property values (000006, 33333333, 23400, 77581, '3456 Walrus Way', '05/12/16', 2, 1, 'Apartment', 77581, 'rented');
insert into Property values (000007, 33333333, 30000, 77432, '435 Hullabaloo St', '11/07/15', 3, 4, 'House', 77432, 'rented');
insert into Property values (000008, 22222222, 50000, 77581, '2940 Walrus Way', '08/02/16', 3, 2, 'House', 77581, 'sold');
insert into Property values (000009, 33333333, 50000, 78666, '2300 Victory Dr', '11/05/15', 5, 5, 'Condominium', 78666, 'sold');
insert into Property values (000010, 11111111, 60000, 77512, '8912 Rudolph Way', '07/30/16', 3, 3, 'Condominium', 77512, 'rent');
insert into Property values (000011, 22222222, 34000, 78666, '2354 N LBJ Dr', '06/13/16', 4, 2, 'Apartment', 78666, 'rented');
insert into Property values (000012, 44444444, 130000, 77512, '5235 Basket St', '04/23/16', 4, 2, 'House', 77512, 'sold');
insert into Property values (000013, 44444444, 2300, 77573, '234 Broadmoor Ln', '03/20/16', 2, 1, 'Apartment', 77573, 'rented');
insert into Property values (000014, 33333333, 3000, 77573, '2566 Shadybend Ln', '06/12/16', 2, 1, 'Apartment', 77573, 'rent');
insert into Property values (000015, 55555555, 30000, 77581, '700 Comanche St', '05/14/16', 3, 3, 'House', 77581, 'sold');


create table Buyer (
	client_id NUMBER(6),
	phone# NUMBER(10),
	email VARCHAR(20),
	branch NUMBER(5),
	bedrooms NUMBER(1),
	bathrooms NUMBER(1),
	location VARCHAR(5),
	price FLOAT(10),
	selling_agent NUMBER(8),
	PRIMARY KEY (client_id),
	FOREIGN KEY (branch) REFERENCES Branch(location),
	FOREIGN KEY (selling_agent) REFERENCES SellingAgent(staff_id)
);

insert into Buyer values (111100, 5128338888, 'srat@gmail.com', 78666, 2, 1, 78666, 30000, 00000000);
insert into Buyer values (222200, 2813423596, 'rbow@gmail.com', 77573, 2, 2, 77573, 30000, 77777777);
insert into Buyer values (333300, 5128453046, 'qjon@gmail.com', 77512, 3, 2, 77512, 45000, 00000000);


create table Renter (
	client_id NUMBER(6),
	phone# NUMBER(10),
	email VARCHAR(20),
	branch NUMBER(5),
	payment_record VARCHAR(3),
	rental_info VARCHAR(3),
	PRIMARY KEY (client_id),
	FOREIGN KEY (branch) REFERENCES Branch(location)
);

insert into Renter values (444400, 7324934506, 'qwrt@gmail.com', 77512, 'yes', 'yes');
insert into Renter values (555500, 7138325956, 'kols@gmail.com', 78666, 'no', 'yes');
insert into Renter values (666600, 2814325967, 'bond@gmail.com', 78666, 'no', 'no');