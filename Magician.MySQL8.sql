drop database if exists magician;

create database if not exists magician;

use magician;

create table `dealerships` (
	`dealershipID` integer not null auto_increment,
    `name` varchar(50) not null,
    `address` varchar(50) not null,
    `phone` varchar(12)not null,
    constraint `PK_dealerships` primary key (`dealershipID`)
);
    
    create index `name` on `dealerships` (`name`);
    
create table `vehicles` (
	`VIN` integer not null,
	`color` varchar(20) not null,
	`make` varchar(30) not null,
	`model` varchar(30) not null,
	`sold` smallint(2) not null,
	constraint `PK_vehicles` primary key (`VIN`)
);
        
create table `inventory` (
    `dealershipID` integer not null,
    `VIN` integer not null,
    constraint `PK_inventory` primary key (`dealershipID`, `VIN`)
);

create table `sales_contracts` (
	`contractID` integer not null auto_increment,
    `contractdate` varchar(50) not null,
    `VIN` integer not null,
    constraint `PK_sales_contracts` primary key (`contractID`)
);

create table `lease_contracts` (
	`contractID` integer not null auto_increment,
    `contractdate` varchar(50) not null,
    `VIN` integer not null,
    constraint `PK_lease_contracts` primary key (`contractID`)
);

insert into dealerships (name, address, phone)
	values ('Magic Mike', '123 Real Street', '973-871-9999'), ('Debt Dave', '404 Out Atsea', '111-222-3456');

insert into vehicles
	values (101, 'Silver', 'Ford', 'Explorer', 0), (102, 'Red', 'Toyota', 'Prius', 0), 
    (103, 'Blue', 'Honda', 'Civic', 0), (104, 'Black', 'Ford', 'Mustang', 1), (105, 'Green', 'Ford', 'Explorer', 1);

insert into inventory 
	values (1, 101), (1, 102), (2, 103), (2, 104), (1, 105);
    
insert into sales_contracts (contractDate, VIN)
	values ('11-24-2025', 105);
    
insert into lease_contracts (contractDate, VIN)
	values ('11-22-2025', 104);



alter table `sales_contracts` add constraint `FK_sales_contracts` 
	foreign key (`VIN`) references `vehicles` (`VIN`);
    
alter table `lease_contracts` add constraint `FK_lease_contracts`
	foreign key (`VIN`) references `vehicles` (`VIN`);
    
alter table `inventory` add constraint `FK_inventory`
	foreign key (`VIN`) references `vehicles` (`VIN`);
