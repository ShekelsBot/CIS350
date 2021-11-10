-- ANDREW BRUCKBAUER
-- 10/21/2021
-- PART ONE -- CREATE DATABASE AND DELTE ONE TABLE

create database CampusTickets; 
	use CampusTickets; 
    -- Use the campus tickets database --
    create table Theater(Name varchar(10));
    -- Create a table named theatre with one column so it is valid --
    drop table Theater;
    -- Drop the table --
    
-- PART TWO -- CREATE THREE TABLES AND DEFINE RELATIONSHIPS

    create table Student(
		StudentID int,
        -- Primary key is int --
        FirstName varchar(30),
        LastName varchar(30),
        PhoneNum int,
        StateLicense varchar(20),
        LicenseNo int,
        Primary Key (StudentID));
        -- Define Student ID as primary key --
    
        create table TicketCode(
		code int,
        fine varchar(10),
        Primary key (code));

-- Needs to be created last becuase its a weak entity    
    create table Ticket(
		TicketNo int,
        -- Primary key
		Date varchar(10),
        StudentID int,
        -- match primary key from Student --
        Code int,
        Primary key (TicketNo),
        Foreign Key (StudentID) references Student(StudentID),
        Foreign Key (Code) references TicketCode(Code));
        -- Define TicketNo as primary key -- 
        -- Define StudentID as Forgiegn Key and Reference other table
        -- Define Code as FK and References other table
        
-- PART 3 -- Modify Tables

	alter table TicketCode
		add column Description int;
    alter table TicketCode
		modify column Description varchar(25);
	alter table Student
		add column FinacialAid int;
	alter table Student
		drop column FinacialAid;
        
-- PART 4 -- Modify Records 

	insert into Student(StudentID, FirstName, LastName, PhoneNum, StateLiceense, LicenseNo)
		values (123, "Jake", "Yakonovich", 1234567890, "CO", 1234567980),
			   (122, "Ugo", "Slavich", 1234567809, "WY", 1234568980);
    insert into TicketCode (code, Fine)
		values (1, 34),
			   (2, 69);
    insert into Ticket (TicketNo, Date,StudentID, Code)
		values (1234, "10/06/2021", 00001, 1),
			   (1234, "10/22/2021", 00002, 2);
               
    update TicketCode
		set Fine = 50
		where code=1;
        -- Idenifes the first character in the first record updates 34 to 50
               
-- PART 5 -- Queries

	select code, fine from TicketCode where code=1 or 2;
    
	select TicketNo, Date
    from Ticket
    where StudentID=0001 
    order by Date DESC;
    
    select StateLicense, LastName
    from Student
    where StateLicense="CO"
    order by LastName ASC;