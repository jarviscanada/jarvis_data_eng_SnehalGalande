exercises=# select * from cd.members;
     0 | GUEST             | GUEST     | GUEST                                   |       0 | (000) 000-0000 |               | 2012-07-01 00:00:00
     1 | Smith             | Darren    | 8 Bloomsbury Close, Boston              |    4321 | 555-555-5555   |               | 2012-07-02 12:02:05
     2 | Smith             | Tracy     | 8 Bloomsbury Close, New York            |    4321 | 555-555-5555   |               | 2012-07-02 12:08:23
     3 | Rownam            | Tim       | 23 Highway Way, Boston                  |   23423 | (844) 693-0723 |               | 2012-07-03 09:32:15
     4 | Joplette          | Janice    | 20 Crossing Road, New York              |     234 | (833) 942-4710 |             1 | 2012-07-03 10:25:05
     5 | Butters           | Gerald    | 1065 Huntingdon Avenue, Boston          |   56754 | (844) 078-4130 |             1 | 2012-07-09 10:44:09
     6 | Tracy             | Burton    | 3 Tunisia Drive, Boston                 |   45678 | (822) 354-9973 |               | 2012-07-15 08:52:55
     7 | Dare              | Nancy     | 6 Hunting Lodge Way, Boston             |   10383 | (833) 776-4001 |             4 | 2012-07-25 08:59:12
     8 | Boothe            | Tim       | 3 Bloomsbury Close, Reading, 00234      |     234 | (811) 433-2547 |             3 | 2012-07-25 16:02:35
     9 | Stibbons          | Ponder    | 5 Dragons Way, Winchester               |   87630 | (833) 160-3900 |             6 | 2012-07-25 17:09:05
    10 | Owen              | Charles   | 52 Cheshire Grove, Winchester, 28563    |   28563 | (855) 542-5251 |             1 | 2012-08-03 19:42:37
    11 | Jones             | David     | 976 Gnats Close, Reading                |   33862 | (844) 536-8036 |             4 | 2012-08-06 16:32:55
    12 | Baker             | Anne      | 55 Powdery Street, Boston               |   80743 | 844-076-5141   |             9 | 2012-08-10 14:23:22
    13 | Farrell           | Jemima    | 103 Firth Avenue, North Reading         |   57392 | (855) 016-0163 |               | 2012-08-10 14:28:01
    14 | Smith             | Jack      | 252 Binkington Way, Boston              |   69302 | (822) 163-3254 |             1 | 2012-08-10 16:22:05
    15 | Bader             | Florence  | 264 Ursula Drive, Westford              |   84923 | (833) 499-3527 |             9 | 2012-08-10 17:52:03
    16 | Baker             | Timothy   | 329 James Street, Reading               |   58393 | 833-941-0824   |            13 | 2012-08-15 10:34:25
    17 | Pinker            | David     | 5 Impreza Road, Boston                  |   65332 | 811 409-6734   |            13 | 2012-08-16 11:32:47
    20 | Genting           | Matthew   | 4 Nunnington Place, Wingfield, Boston   |   52365 | (811) 972-1377 |             5 | 2012-08-19 14:55:55
    21 | Mackenzie         | Anna      | 64 Perkington Lane, Reading             |   64577 | (822) 661-2898 |             1 | 2012-08-26 09:32:05
    22 | Coplin            | Joan      | 85 Bard Street, Bloomington, Boston     |   43533 | (822) 499-2232 |            16 | 2012-08-29 08:32:41
    24 | Sarwin            | Ramnaresh | 12 Bullington Lane, Boston              |   65464 | (822) 413-1470 |            15 | 2012-09-01 08:44:42
    26 | Jones             | Douglas   | 976 Gnats Close, Reading                |   11986 | 844 536-8036   |            11 | 2012-09-02 18:43:05
    27 | Rumney            | Henrietta | 3 Burkington Plaza, Boston              |   78533 | (822) 989-8876 |            20 | 2012-09-05 08:42:35
    28 | Farrell           | David     | 437 Granite Farm Road, Westford         |   43532 | (855) 755-9876 |               | 2012-09-15 08:22:05
    29 | Worthington-Smyth | Henry     | 55 Jagbi Way, North Reading             |   97676 | (855) 894-3758 |             2 | 2012-09-17 12:27:15
    30 | Purview           | Millicent | 641 Drudgery Close, Burnington, Boston  |   34232 | (855) 941-9786 |             2 | 2012-09-18 19:04:01
    33 | Tupperware        | Hyacinth  | 33 Cheerful Plaza, Drake Road, Westford |   68666 | (822) 665-5327 |               | 2012-09-18 19:32:05
    35 | Hunt              | John      | 5 Bullington Lane, Boston               |   54333 | (899) 720-6978 |            30 | 2012-09-19 11:32:45
    36 | Crumpet           | Erica     | Crimson Road, North Reading             |   75655 | (811) 732-4816 |             2 | 2012-09-22 08:36:38
    37 | Smith             | Darren    | 3 Funktown, Denzington, Boston          |   66796 | (822) 577-3541 |               | 2012-09-26 18:08:45

--Question 1 : Insert some data into a table
--The club is adding a new facility - a spa. We need to add it into the facilities table. Use the following values:
--facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.

exercises=# insert into cd.facilities values(9,'Spa',20,30,100000,800);
INSERT 0 1
exercises=# select * from cd.facilities;
     0 | Tennis Court 1  |          5 |        25 |         10000 |                200
     1 | Tennis Court 2  |          5 |        25 |          8000 |                200
     2 | Badminton Court |          0 |      15.5 |          4000 |                 50
     3 | Table Tennis    |          0 |         5 |           320 |                 10
     4 | Massage Room 1  |         35 |        80 |          4000 |               3000
     5 | Massage Room 2  |         35 |        80 |          4000 |               3000
     6 | Squash Court    |        3.5 |      17.5 |          5000 |                 80
     7 | Snooker Table   |          0 |         5 |           450 |                 15
     8 | Pool Table      |          0 |         5 |           400 |                 15
     9 | Spa             |         20 |        30 |        100000 |                800

--Question 2 : Insert calculated data into a table
--Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the value for the next facid, rather than specifying it as a constant. Use the following values for everything else:
--Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.

exercises=#insert into cd.facilities(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) values(
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
INSERT 0 1
exercises=# select * from cd.facilities;
     0 | Tennis Court 1  |          5 |        25 |         10000 |                200
     1 | Tennis Court 2  |          5 |        25 |          8000 |                200
     2 | Badminton Court |          0 |      15.5 |          4000 |                 50
     3 | Table Tennis    |          0 |         5 |           320 |                 10
     4 | Massage Room 1  |         35 |        80 |          4000 |               3000
     5 | Massage Room 2  |         35 |        80 |          4000 |               3000
     6 | Squash Court    |        3.5 |      17.5 |          5000 |                 80
     7 | Snooker Table   |          0 |         5 |           450 |                 15
     8 | Pool Table      |          0 |         5 |           400 |                 15
     9 | Spa             |         20 |        30 |        100000 |                800
    10 | Spa             |         20 |        30 |        100000 |                800

--Question 3 : Update some existing data
--We made a mistake when entering the data for the second tennis court. The initial outlay was 10000 rather than 8000: you need to alter the data to fix the error.

exercises=# update cd.facilities set initialoutlay = 10000 where name = 'Tennis Court 2';
UPDATE 1
exercises=# select * from cd.facilities;
     0 | Tennis Court 1  |          5 |        25 |         10000 |                200
     2 | Badminton Court |          0 |      15.5 |          4000 |                 50
     3 | Table Tennis    |          0 |         5 |           320 |                 10
     4 | Massage Room 1  |         35 |        80 |          4000 |               3000
     5 | Massage Room 2  |         35 |        80 |          4000 |               3000
     6 | Squash Court    |        3.5 |      17.5 |          5000 |                 80
     7 | Snooker Table   |          0 |         5 |           450 |                 15
     8 | Pool Table      |          0 |         5 |           400 |                 15
     9 | Spa             |         20 |        30 |        100000 |                800
    10 | Spa             |         20 |        30 |        100000 |                800
     1 | Tennis Court 2  |          5 |        25 |         10000 |                200
	 
--Question 4 : Update a row based on the contents of another row
--We want to alter the price of the second tennis court so that it costs 10% more than the first one. Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.

exercises=# update 
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
 
UPDATE 1
exercises=# select * from cd.facilities;
     0 | Tennis Court 1  |          5 |        25 |         10000 |                200
     2 | Badminton Court |          0 |      15.5 |          4000 |                 50
     3 | Table Tennis    |          0 |         5 |           320 |                 10
     4 | Massage Room 1  |         35 |        80 |          4000 |               3000
     5 | Massage Room 2  |         35 |        80 |          4000 |               3000
     6 | Squash Court    |        3.5 |      17.5 |          5000 |                 80
     7 | Snooker Table   |          0 |         5 |           450 |                 15
     8 | Pool Table      |          0 |         5 |           400 |                 15
     9 | Spa             |         20 |        30 |        100000 |                800
    10 | Spa             |         20 |        30 |        100000 |                800
     1 | Tennis Court 2  |        5.5 |      27.5 |         10000 |                200 

--Question 5 : Delete all bookings
--As part of a clearout of our database, we want to delete all bookings from the cd.bookings table. How can we accomplish this?
exercises=#delete from cd.bookings;

--Question 6: Delete a member from the cd.members table
--We want to remove member 37, who has never made a booking, from our database. How can we achieve that?

exercises=#delete from cd.members where memid = 37;

--Question 7 : Control which rows are retrieved - part 2
--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

exercises=# select facid,name,membercost,monthlymaintenance from cd.facilities where membercost != 0 and membercost < (monthlymaintenance / 50);
     4 | Massage Room 1 |         35 |               3000
     5 | Massage Room 2 |         35 |               3000
	 
--Question 8 : Basic string searches
--How can you produce a list of all facilities with the word 'Tennis' in their name?

exercises=# select
exercises-# *
exercises-# from
exercises-# cd.facilities
exercises-# where
exercises-# name like '%Tennis%';
     0 | Tennis Court 1 |          5 |        25 |         10000 |                200
     3 | Table Tennis   |          0 |         5 |           320 |                 10
     1 | Tennis Court 2 |        5.5 |      27.5 |         10000 |                200
	 
--Question 9 : Matching against multiple possible values
--How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

exercises=# select
exercises-# *
exercises-# from
exercises-# cd.facilities
exercises-# where
exercises-# facid in (1, 5);
     5 | Massage Room 2 |         35 |        80 |          4000 |               3000
     1 | Tennis Court 2 |        5.5 |      27.5 |         10000 |                200

--Question 10 : Working with dates
--How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.

exercises=# select
exercises-# memid,
exercises-# surname,
exercises-# firstname,
exercises-# joindate
exercises-# from
exercises-# cd.members
exercises-# where
exercises-# joindate >= '2012-09-01'
exercises-# ;
    24 | Sarwin            | Ramnaresh | 2012-09-01 08:44:42
    26 | Jones             | Douglas   | 2012-09-02 18:43:05
    27 | Rumney            | Henrietta | 2012-09-05 08:42:35
    28 | Farrell           | David     | 2012-09-15 08:22:05
    29 | Worthington-Smyth | Henry     | 2012-09-17 12:27:15
    30 | Purview           | Millicent | 2012-09-18 19:04:01
    33 | Tupperware        | Hyacinth  | 2012-09-18 19:32:05
    35 | Hunt              | John      | 2012-09-19 11:32:45
    36 | Crumpet           | Erica     | 2012-09-22 08:36:38
    37 | Smith             | Darren    | 2012-09-26 18:08:45

--Question 11 : Combining results from multiple queries
--You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!

exercises=# select surname as Surname from cd.members union select name from cd.facilities;
 Hunt
 Farrell
 Tennis Court 2
 Table Tennis
 Dare
 Rownam
 GUEST
 Badminton Court
 Smith
 Tupperware
 Owen
 Worthington-Smyth
 Butters
 Rumney
 Tracy
 Crumpet
 Purview
 Massage Room 2
 Sarwin
 Baker
 Pool Table
 Spa
 Snooker Table
 Jones
 Coplin
 Mackenzie
 Boothe
 Joplette
 Stibbons
 Squash Court
 Tennis Court 1
 Pinker
 Genting
 Bader
 Massage Room 1
 
--Question 12 : Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?

exercises=# select
exercises-# b.starttime
exercises-# from
exercises-# cd.bookings b
exercises-# join cd.members m on b.memid = m.memid
exercises-# where
exercises-# m.firstname = 'David'
exercises-# and m.surname = 'Farrell';
     starttime
---------------------
 2012-09-18 09:00:00
 2012-09-18 13:30:00
 2012-09-18 17:30:00
 2012-09-18 20:00:00
 2012-09-19 09:30:00
 2012-09-19 12:00:00
 2012-09-19 15:00:00
 2012-09-20 11:30:00
 2012-09-20 14:00:00
 2012-09-20 15:30:00
 2012-09-21 10:30:00
 2012-09-21 14:00:00
 2012-09-22 08:30:00
 2012-09-22 17:00:00
 2012-09-23 08:30:00
 2012-09-23 17:30:00
 2012-09-23 19:00:00
 2012-09-24 08:00:00
 2012-09-24 12:30:00
 2012-09-24 16:30:00
 2012-09-25 15:30:00
 2012-09-25 17:00:00
 2012-09-26 13:00:00
 2012-09-26 17:00:00
 2012-09-27 08:00:00
 2012-09-28 09:30:00
 2012-09-28 11:30:00
 2012-09-28 13:00:00
 2012-09-29 10:30:00
 2012-09-29 13:30:00
 2012-09-29 14:30:00
 2012-09-29 16:00:00
 2012-09-29 17:30:00
 2012-09-30 14:30:00
 (34 rows)
 
--Question 13 : Work out the start times of bookings for tennis courts
--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.

exercises=# select
exercises-# b.starttime as start,
exercises-# f.name
exercises-# from
exercises-# cd.bookings b
exercises-# inner join cd.facilities f on b.facid = f.facid
exercises-# where
exercises-# name like 'Tennis Court%'
exercises-# and b.starttime >= '2012-09-21'
exercises-# and b.starttime < '2012-09-22'
exercises-# order by
exercises-# b.starttime;
 2012-09-21 08:00:00 | Tennis Court 1
 2012-09-21 08:00:00 | Tennis Court 2
 2012-09-21 09:30:00 | Tennis Court 1
 2012-09-21 10:00:00 | Tennis Court 2
 2012-09-21 11:30:00 | Tennis Court 2
 2012-09-21 12:00:00 | Tennis Court 1
 2012-09-21 13:30:00 | Tennis Court 1
 2012-09-21 14:00:00 | Tennis Court 2
 2012-09-21 15:30:00 | Tennis Court 1
 2012-09-21 16:00:00 | Tennis Court 2
 2012-09-21 17:00:00 | Tennis Court 1
 2012-09-21 18:00:00 | Tennis Court 2
 
--Question 14 : Produce a list of all members, along with their recommender
--How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

exercises=# select
exercises-# m.firstname as memfname,
exercises-# m.surname as memsname,
exercises-# m2.firstname as recfname,
exercises-# m2.surname as recsname
exercises-# from
exercises-# cd.members m
exercises-# left outer join cd.members m2 on m2.memid = m.recommendedby
exercises-# order by
exercises-# m.surname,
exercises-# m.firstname;
 Florence  | Bader             | Ponder    | Stibbons
 Anne      | Baker             | Ponder    | Stibbons
 Timothy   | Baker             | Jemima    | Farrell
 Tim       | Boothe            | Tim       | Rownam
 Gerald    | Butters           | Darren    | Smith
 Joan      | Coplin            | Timothy   | Baker
 Erica     | Crumpet           | Tracy     | Smith
 Nancy     | Dare              | Janice    | Joplette
 David     | Farrell           |           |
 Jemima    | Farrell           |           |
 Matthew   | Genting           | Gerald    | Butters
 GUEST     | GUEST             |           |
 John      | Hunt              | Millicent | Purview
 David     | Jones             | Janice    | Joplette
 Douglas   | Jones             | David     | Jones
 Janice    | Joplette          | Darren    | Smith
 Anna      | Mackenzie         | Darren    | Smith
 Charles   | Owen              | Darren    | Smith
 David     | Pinker            | Jemima    | Farrell
 Millicent | Purview           | Tracy     | Smith
 Tim       | Rownam            |           |
 Henrietta | Rumney            | Matthew   | Genting
 Ramnaresh | Sarwin            | Florence  | Bader
 Darren    | Smith             |           |
 Darren    | Smith             |           |
 Jack      | Smith             | Darren    | Smith
 Tracy     | Smith             |           |
 Ponder    | Stibbons          | Burton    | Tracy
 Burton    | Tracy             |           |
 Hyacinth  | Tupperware        |           |
 Henry     | Worthington-Smyth | Tracy     | Smith
 
--Question 15 : Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

exercises=# select
exercises-# distinct m2.firstname as firstname,
exercises-# m2.surname as surname
exercises-# from
exercises-# cd.members m
exercises-# inner join cd.members m2 on m2.memid = m.recommendedby
exercises-# order by
exercises-# surname,
exercises-# firstname;
 Florence  | Bader
 Timothy   | Baker
 Gerald    | Butters
 Jemima    | Farrell
 Matthew   | Genting
 David     | Jones
 Janice    | Joplette
 Millicent | Purview
 Tim       | Rownam
 Darren    | Smith
 Tracy     | Smith
 Ponder    | Stibbons
 Burton    | Tracy

--Question 16 : Produce a list of all members, along with their recommender, using no joins.
--How can you output a list of all members, including the individual who recommended them (if any), without using any joins? Ensure that there are no duplicates in the list, and that each firstname + surname pairing is formatted as a column and ordered.

exercises=# select
exercises-# distinct concat(m.firstname, ' ', m.surname) as member,
exercises-# (
exercises(# select
exercises(# concat(m2.firstname, ' ', m2.surname) as recommender
exercises(# from
exercises(# cd.members m2
exercises(# where
exercises(# m2.memid = m.recommendedby
exercises(# )
exercises-# from
exercises-# cd.members m
exercises-# order by
exercises-# member;
 Anna Mackenzie          | Darren Smith
 Anne Baker              | Ponder Stibbons
 Burton Tracy            |
 Charles Owen            | Darren Smith
 Darren Smith            |
 David Farrell           |
 David Jones             | Janice Joplette
 David Pinker            | Jemima Farrell
 Douglas Jones           | David Jones
 Erica Crumpet           | Tracy Smith
 Florence Bader          | Ponder Stibbons
 Gerald Butters          | Darren Smith
 GUEST GUEST             |
 Henrietta Rumney        | Matthew Genting
 Henry Worthington-Smyth | Tracy Smith
 Hyacinth Tupperware     |
 Jack Smith              | Darren Smith
 Janice Joplette         | Darren Smith
 Jemima Farrell          |
 Joan Coplin             | Timothy Baker
 John Hunt               | Millicent Purview
 Matthew Genting         | Gerald Butters
 Millicent Purview       | Tracy Smith
 Nancy Dare              | Janice Joplette
 Ponder Stibbons         | Burton Tracy
 Ramnaresh Sarwin        | Florence Bader
 Tim Boothe              | Tim Rownam
 Tim Rownam              |
 Timothy Baker           | Jemima Farrell
 Tracy Smith             |

--Question 17 : Count the number of recommendations each member makes.
--Produce a count of the number of recommendations each member has made. Order by member ID.
exercises=# select
exercises-# recommendedby,
exercises-# count(*)
exercises-# from
exercises-# cd.members
exercises-# where
exercises-# recommendedby is not null
exercises-# group by
exercises-# recommendedby
exercises-# order by
exercises-# recommendedby;
 recommendedby | count
---------------+-------
             1 |     5
             2 |     3
             3 |     1
             4 |     2
             5 |     1
             6 |     1
             9 |     2
            11 |     1
            13 |     2
            15 |     1
            16 |     1
            20 |     1
            30 |     1
(13 rows)

--Question 18 : List the total slots booked per facility
--Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.

exercises=# select
exercises-# facid,
exercises-# sum(slots) as totalslots
exercises-# from
exercises-# cd.bookings
exercises-# group by
exercises-# facid
exercises-# order by
exercises-# facid;
 facid | totalslots
-------+------------
     0 |       1320
     1 |       1278
     2 |       1209
     3 |        830
     4 |       1404
     5 |        228
     6 |       1104
     7 |        908
     8 |        911
(9 rows)

--Question 19 : List the total slots booked per facility in a given month
--Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

exercises=# select
exercises-# facid,
exercises-# sum(slots) as "Total Slots"
exercises-# from
exercises-# cd.bookings
exercises-# where
exercises-# starttime between '2012-09-01'
exercises-# and '2012-10-01'
exercises-# group by
exercises-# facid
exercises-# order by
exercises-# sum(slots);
 facid | Total Slots
-------+-------------
     5 |         122
     3 |         422
     7 |         426
     8 |         471
     6 |         540
     2 |         570
     1 |         588
     0 |         591
     4 |         648
(9 rows)

--Question 20 : List the total slots booked per facility per month
--Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table consisting of facility id and slots, sorted by the id and month.

exercises=# select
exercises-# facid,
exercises-# EXTRACT(
exercises(# month
exercises(# FROM
exercises(# starttime
exercises(# ) as month,
exercises-# sum(slots) as "Total Slots"
exercises-# from
exercises-# cd.bookings
exercises-# where
exercises-# EXTRACT(
exercises(# year
exercises(# FROM
exercises(# starttime
exercises(# ) = 2012
exercises-# group by
exercises-# facid,
exercises-# month
exercises-# order by
exercises-# facid,
exercises-# month;
 facid | month | Total Slots
-------+-------+-------------
     0 |     7 |         270
     0 |     8 |         459
     0 |     9 |         591
     1 |     7 |         207
     1 |     8 |         483
     1 |     9 |         588
     2 |     7 |         180
     2 |     8 |         459
     2 |     9 |         570
     3 |     7 |         104
     3 |     8 |         304
     3 |     9 |         422
     4 |     7 |         264
     4 |     8 |         492
     4 |     9 |         648
     5 |     7 |          24
     5 |     8 |          82
     5 |     9 |         122
     6 |     7 |         164
     6 |     8 |         400
     6 |     9 |         540
     7 |     7 |         156
     7 |     8 |         326
     7 |     9 |         426
     8 |     7 |         117
     8 |     8 |         322
     8 |     9 |         471
(27 rows)


--Question 21 : Find the count of members who have made at least one booking
--Find the total number of members (including guests) who have made at least one booking.

exercises=# select
exercises-# count(*)
exercises-# from
exercises-# (
exercises(# select
exercises(# distinct memid
exercises(# from
exercises(# cd.bookings
exercises(# ) as mems
exercises-# ;
 count
-------
    30
(1 row)

--Question 22 : List each member's first booking after September 1st 2012
--Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

exercises=# select
exercises-# m.surname,
exercises-# m.firstname,
exercises-# m.memid,
exercises-# min(b.starttime) as starttime
exercises-# from
exercises-# cd.members m
exercises-# join cd.bookings b on m.memid = b.memid
exercises-# where
exercises-# b.starttime >= '2012-09-01'
exercises-# group by
exercises-# m.memid
exercises-# order by
exercises-# m.memid;
      surname      | firstname | memid |      starttime
-------------------+-----------+-------+---------------------
 GUEST             | GUEST     |     0 | 2012-09-01 08:00:00
 Smith             | Darren    |     1 | 2012-09-01 09:00:00
 Smith             | Tracy     |     2 | 2012-09-01 11:30:00
 Rownam            | Tim       |     3 | 2012-09-01 16:00:00
 Joplette          | Janice    |     4 | 2012-09-01 15:00:00
 Butters           | Gerald    |     5 | 2012-09-02 12:30:00
 Tracy             | Burton    |     6 | 2012-09-01 15:00:00
 Dare              | Nancy     |     7 | 2012-09-01 12:30:00
 Boothe            | Tim       |     8 | 2012-09-01 08:30:00
 Stibbons          | Ponder    |     9 | 2012-09-01 11:00:00
 Owen              | Charles   |    10 | 2012-09-01 11:00:00
 Jones             | David     |    11 | 2012-09-01 09:30:00
 Baker             | Anne      |    12 | 2012-09-01 14:30:00
 Farrell           | Jemima    |    13 | 2012-09-01 09:30:00
 Smith             | Jack      |    14 | 2012-09-01 11:00:00
 Bader             | Florence  |    15 | 2012-09-01 10:30:00
 Baker             | Timothy   |    16 | 2012-09-01 15:00:00
 Pinker            | David     |    17 | 2012-09-01 08:30:00
 Genting           | Matthew   |    20 | 2012-09-01 18:00:00
 Mackenzie         | Anna      |    21 | 2012-09-01 08:30:00
 Coplin            | Joan      |    22 | 2012-09-02 11:30:00
 Sarwin            | Ramnaresh |    24 | 2012-09-04 11:00:00
 Jones             | Douglas   |    26 | 2012-09-08 13:00:00
 Rumney            | Henrietta |    27 | 2012-09-16 13:30:00
 Farrell           | David     |    28 | 2012-09-18 09:00:00
 Worthington-Smyth | Henry     |    29 | 2012-09-19 09:30:00
 Purview           | Millicent |    30 | 2012-09-19 11:30:00
 Tupperware        | Hyacinth  |    33 | 2012-09-20 08:00:00
 Hunt              | John      |    35 | 2012-09-23 14:00:00
 Crumpet           | Erica     |    36 | 2012-09-27 11:30:00
(30 rows)

--Question 23 : Produce a list of member names, with each row containing the total member count
--Produce a list of member names, with each row containing the total member count. Order by join date, and include guest members.

exercises=# select
exercises-# count(*) OVER () as "count",
exercises-# firstname,
exercises-# surname
exercises-# from
exercises-# cd.members
exercises-# order by
exercises-# joindate;
 count | firstname |      surname
-------+-----------+-------------------
    31 | GUEST     | GUEST
    31 | Darren    | Smith
    31 | Tracy     | Smith
    31 | Tim       | Rownam
    31 | Janice    | Joplette
    31 | Gerald    | Butters
    31 | Burton    | Tracy
    31 | Nancy     | Dare
    31 | Tim       | Boothe
    31 | Ponder    | Stibbons
    31 | Charles   | Owen
    31 | David     | Jones
    31 | Anne      | Baker
    31 | Jemima    | Farrell
    31 | Jack      | Smith
    31 | Florence  | Bader
    31 | Timothy   | Baker
    31 | David     | Pinker
    31 | Matthew   | Genting
    31 | Anna      | Mackenzie
    31 | Joan      | Coplin
    31 | Ramnaresh | Sarwin
    31 | Douglas   | Jones
    31 | Henrietta | Rumney
    31 | David     | Farrell
    31 | Henry     | Worthington-Smyth
    31 | Millicent | Purview
    31 | Hyacinth  | Tupperware
    31 | John      | Hunt
    31 | Erica     | Crumpet
    31 | Darren    | Smith
(31 rows)

--Question 24 : Produce a numbered list of members
--Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.

exercises=# select
exercises-# row_number() over(),
exercises-# firstname,
exercises-# surname
exercises-# from
exercises-# cd.members;
 row_number | firstname |      surname
------------+-----------+-------------------
          1 | GUEST     | GUEST
          2 | Darren    | Smith
          3 | Tracy     | Smith
          4 | Tim       | Rownam
          5 | Janice    | Joplette
          6 | Gerald    | Butters
          7 | Burton    | Tracy
          8 | Nancy     | Dare
          9 | Tim       | Boothe
         10 | Ponder    | Stibbons
         11 | Charles   | Owen
         12 | David     | Jones
         13 | Anne      | Baker
         14 | Jemima    | Farrell
         15 | Jack      | Smith
         16 | Florence  | Bader
         17 | Timothy   | Baker
         18 | David     | Pinker
         19 | Matthew   | Genting
         20 | Anna      | Mackenzie
         21 | Joan      | Coplin
         22 | Ramnaresh | Sarwin
         23 | Douglas   | Jones
         24 | Henrietta | Rumney
         25 | David     | Farrell
         26 | Henry     | Worthington-Smyth
         27 | Millicent | Purview
         28 | Hyacinth  | Tupperware
         29 | John      | Hunt
         30 | Erica     | Crumpet
         31 | Darren    | Smith
(31 rows)

--Question 25 : Output the facility id that has the highest number of slots booked, again
--Output the facility id that has the highest number of slots booked. Ensure that in the event of a tie, all tieing results get output.

exercises=# select
exercises-# facid,
exercises-# total
exercises-# from
exercises-# (
exercises(# select
exercises(# facid,
exercises(# sum(slots) total,
exercises(# rank() over (
exercises(# order by
exercises(# sum(slots) desc
exercises(# ) rank
exercises(# from
exercises(# cd.bookings
exercises(# group by
exercises(# facid
exercises(# ) as ranked
exercises-# where
exercises-# rank = 1;
 facid | total
-------+-------
     4 |  1404
(1 row)

--Question 26 : Format the names of members
--Output the names of all members, formatted as 'Surname, Firstname'

exercises=# select concat(surname,', ',firstname) as name from cd.members;
           name
--------------------------
 GUEST, GUEST
 Smith, Darren
 Smith, Tracy
 Rownam, Tim
 Joplette, Janice
 Butters, Gerald
 Tracy, Burton
 Dare, Nancy
 Boothe, Tim
 Stibbons, Ponder
 Owen, Charles
 Jones, David
 Baker, Anne
 Farrell, Jemima
 Smith, Jack
 Bader, Florence
 Baker, Timothy
 Pinker, David
 Genting, Matthew
 Mackenzie, Anna
 Coplin, Joan
 Sarwin, Ramnaresh
 Jones, Douglas
 Rumney, Henrietta
 Farrell, David
 Worthington-Smyth, Henry
 Purview, Millicent
 Tupperware, Hyacinth
 Hunt, John
 Crumpet, Erica
 Smith, Darren
(31 rows)

--Question 27 : Find telephone numbers with parentheses
--You've noticed that the club's member table has telephone numbers with very inconsistent formatting. You'd like to find all the telephone numbers that contain parentheses, returning the member ID and telephone number sorted by member ID.

exercises=# select memid, telephone from cd.members where telephone ~ '[()]';
 memid |   telephone
-------+----------------
     0 | (000) 000-0000
     3 | (844) 693-0723
     4 | (833) 942-4710
     5 | (844) 078-4130
     6 | (822) 354-9973
     7 | (833) 776-4001
     8 | (811) 433-2547
     9 | (833) 160-3900
    10 | (855) 542-5251
    11 | (844) 536-8036
    13 | (855) 016-0163
    14 | (822) 163-3254
    15 | (833) 499-3527
    20 | (811) 972-1377
    21 | (822) 661-2898
    22 | (822) 499-2232
    24 | (822) 413-1470
    27 | (822) 989-8876
    28 | (855) 755-9876
    29 | (855) 894-3758
    30 | (855) 941-9786
    33 | (822) 665-5327
    35 | (899) 720-6978
    36 | (811) 732-4816
    37 | (822) 577-3541
(25 rows)

--Question 28 : Count the number of members whose surname starts with each letter of the alphabet
--You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet. Sort by the letter, and don't worry about printing out a letter if the count is 0.

exercises=# select
exercises-# substr(surname, 1, 1) as letter,
exercises-# count(
exercises(# substr(surname, 1, 1)
exercises(# )
exercises-# from
exercises-# cd.members
exercises-# group by
exercises-# letter
exercises-# order by
exercises-# letter;
 letter | count
--------+-------
 B      |     5
 C      |     2
 D      |     1
 F      |     2
 G      |     2
 H      |     1
 J      |     3
 M      |     1
 O      |     1
 P      |     2
 R      |     2
 S      |     6
 T      |     2
 W      |     1
(14 rows)

