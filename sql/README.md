# Introduction
The RDBMS and SQL project offers a thorough understanding of database management and concepts, providing practical experience for learners. It covers CRUD operations, The project explores basic data management procedures. 
Topics include an introduction to databases, relational database fundamentals, and SQL basics consisting of DDL, DML, and DCL. 
It explores entity-relationship modeling, normalization techniques, and schema design. Additionally, the project emphasizes indexing strategies for optimal query performance and various data manipulation techniques such as filtering, sorting, and aggregating data through SQL queries. 
The project gives proficiency in utilizing joins and subqueries for retrieving data across multiple tables. Through hands-on exercises, this project prepares learners with essential skills in database management and SQL proficiency.

# SQL Queries
###### Table Setup (DDL)
```sql
create table cd.members(
  memid int, 
  surname varchar(200), 
  firstname varchar(200), 
  address varchar(300), 
  zipcode int, 
  telephone varchar(20), 
  recommendedby int, 
  joindate timestamp, 
  CONSTRAINT members_pk PRIMARY KEY (memid), 
  CONSTRAINT fk_members_recommendedby FOREIGN KEY (recommendedby) REFERENCES cd.members(memid)
);
```
```sql
create table if not exists cd.facilities(
  facid int, 
  name varchar(100), 
  membercost numeric, 
  guestcost numeric, 
  initialoutlay numeric, 
  monthlymaintenance numeric, 
  CONSTRAINT facilities_pk PRIMARY KEY (facid)
);
```
```sql
create table if not exists cd.bookings(
  bookid int, 
  facid int, 
  memid int, 
  starttime timestamp, 
  slots int, 
  CONSTRAINT bookings_pk PRIMARY KEY (bookid), 
  CONSTRAINT fk_members_memid FOREIGN KEY (memid) REFERENCES cd.members(memid), 
  CONSTRAINT fk_facilities_facid FOREIGN KEY (facid) REFERENCES cd.facilities(facid)
);
```

###### Show all members 
```sql
select * from cd.members;
```

###### Questions 1 : Insert some data into a table
```sql
insert into cd.facilities values(9,'Spa',20,30,100000,800);
```

###### Questions 2 : Insert calculated data into a table
```sql
insert into cd.facilities(
  facid, name, membercost, guestcost, 
  initialoutlay, monthlymaintenance
) 
values 
  (
    (
      select 
        max(facid)+ 1 
      from 
        cd.facilities
    ), 
    'Spa', 
    20, 
    30, 
    100000, 
    800
  );
```

###### Questions 3 : Update some existing data
```sql
update 
  cd.facilities 
set 
  initialoutlay = 10000 
where 
  name = 'Tennis Court 2';
```

###### Questions 4 : Update a row based on the contents of another row
```sql
update 
  cd.facilities 
set 
  membercost = membercost +(
    select 
      (membercost * 0.1) 
    from 
      cd.facilities 
    where 
      facid = 0
  ), 
  guestcost = guestcost +(
    select 
      (guestcost * 0.1) 
    from 
      cd.facilities 
    where 
      facid = 0
  ) 
where 
  name = 'Tennis Court 2';
```

###### Questions 5 : Delete all bookings
```sql
delete from 
  cd.bookings;
```

###### Questions 6 : Delete a member from the cd.members table
```sql
delete from 
  cd.members 
where 
  memid = 37;
```

###### Questions 7 : Control which rows are retrieved - part 2
```sql
select 
  facid, 
  name, 
  membercost, 
  monthlymaintenance 
from 
  cd.facilities 
where 
  membercost != 0 
  and membercost < (monthlymaintenance / 50);
```

###### Questions 8 : Basic string searches
```sql
select
  *
from
  cd.facilities
where
  name like '%Tennis%';
```

###### Questions 9 : Matching against multiple possible values
```sql
select 
  * 
from 
  cd.facilities 
where 
  facid in (1, 5);
```

###### Questions 10 : Working with dates
```sql
select 
  memid, 
  surname, 
  firstname, 
  joindate 
from 
  cd.members 
where 
  joindate >= '2012-09-01';
```

###### Questions 11 : Combining results from multiple queries
```sql
select 
  surname as Surname 
from 
  cd.members 
union 
select 
  name 
from 
  cd.facilities;
```

###### Questions 12 : Retrieve the start times of members' bookings
```sql
select 
  b.starttime 
from 
  cd.bookings b 
  join cd.members m on b.memid = m.memid 
where 
  m.firstname = 'David' 
  and m.surname = 'Farrell';
```

###### Questions 13 : Work out the start times of bookings for tennis courts
```sql
select 
  b.starttime as start, 
  f.name 
from 
  cd.bookings b 
  inner join cd.facilities f on b.facid = f.facid 
where 
  name like 'Tennis Court%' 
  and b.starttime >= '2012-09-21' 
  and b.starttime < '2012-09-22' 
order by 
  b.starttime;
```

###### Questions 14 : Produce a list of all members, along with their recommender
```sql
select 
  m.firstname as memfname, 
  m.surname as memsname, 
  m2.firstname as recfname, 
  m2.surname as recsname 
from 
  cd.members m 
  left outer join cd.members m2 on m2.memid = m.recommendedby 
order by 
  m.surname, 
  m.firstname;
```

###### Questions 15 : Produce a list of all members who have recommended another member
```sql
select 
  distinct m2.firstname as firstname, 
  m2.surname as surname 
from 
  cd.members m 
  inner join cd.members m2 on m2.memid = m.recommendedby 
order by 
  surname, 
  firstname;
```

###### Questions 16 : Produce a list of all members, along with their recommender, using no joins.
```sql
select 
  distinct concat(m.firstname, ' ', m.surname) as member, 
  (
    select 
      concat(m2.firstname, ' ', m2.surname) as recommender 
    from 
      cd.members m2 
    where 
      m2.memid = m.recommendedby
  ) 
from 
  cd.members m 
order by 
  member;
```

###### Questions 17 : Count the number of recommendations each member makes.
```sql
select 
  recommendedby, 
  count(*) 
from 
  cd.members 
where 
  recommendedby is not null 
group by 
  recommendedby 
order by 
  recommendedby;
```

###### Questions 18 : List the total slots booked per facility
```sql
select 
  facid, 
  sum(slots) as totalslots 
from 
  cd.bookings 
group by 
  facid 
order by 
  facid;
```

###### Questions 19 : List the total slots booked per facility in a given month
```sql
select 
  facid, 
  sum(slots) as "Total Slots" 
from 
  cd.bookings 
where 
  starttime between '2012-09-01' 
  and '2012-10-01' 
group by 
  facid 
order by 
  sum(slots);
```

###### Questions 20 : List the total slots booked per facility per month
```sql
select 
  facid, 
  EXTRACT(
    month 
    FROM 
      starttime
  ) as month, 
  sum(slots) as "Total Slots" 
from 
  cd.bookings 
where 
  EXTRACT(
    year 
    FROM 
      starttime
  ) = 2012 
group by 
  facid, 
  month 
order by 
  facid, 
  month;
```

###### Questions 21 : Find the count of members who have made at least one booking
```sql
select 
  count(*) 
from 
  (
    select 
      distinct memid 
    from 
      cd.bookings
  ) as mems;
```

###### Questions 22 : List each member's first booking after September 1st 2012
```sql
select 
  m.surname, 
  m.firstname, 
  m.memid, 
  min(b.starttime) as starttime 
from 
  cd.members m 
  join cd.bookings b on m.memid = b.memid 
where 
  b.starttime >= '2012-09-01' 
group by 
  m.memid 
order by 
  m.memid;
```

###### Questions 23 : Produce a list of member names, with each row containing the total member count
```sql
select 
  count(*) OVER () as "count", 
  firstname, 
  surname 
from 
  cd.members 
order by 
  joindate;
```

###### Questions 24 : Produce a numbered list of members
```sql
select 
  row_number() over(), 
  firstname, 
  surname 
from 
  cd.members;
```

###### Questions 25 : Output the facility id that has the highest number of slots booked, again
```sql
select 
  facid, 
  total 
from 
  (
    select 
      facid, 
      sum(slots) total, 
      rank() over (
        order by 
          sum(slots) desc
      ) rank 
    from 
      cd.bookings 
    group by 
      facid
  ) as ranked 
where 
  rank = 1;
```

###### Questions 26 : Format the names of members
```sql
select 
  concat(surname, ', ', firstname) as name 
from 
  cd.members;
```

###### Questions 27 : Find telephone numbers with parentheses
```sql
select 
  memid, 
  telephone 
from 
  cd.members 
where 
  telephone ~ '[()]';
```

###### Questions 28 : Count the number of members whose surname starts with each letter of the alphabet
```sql
select 
  substr(surname, 1, 1) as letter, 
  count(
    substr(surname, 1, 1)
  ) 
from 
  cd.members 
group by 
  letter 
order by 
  letter;
```
