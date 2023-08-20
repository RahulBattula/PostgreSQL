/* syntax used for creating the SAILORS table */

CREATE TABLE sailors(
	sid INT PRIMARY KEY,
	sname varchar(255),
	rating SMALLINT,
	age NUMERIC(4,2)
);


/* describing a table.
In PostgreSQL, you can use the \d command in the psql command-line
tool or the SQL command DESCRIBE to get information about a table. 
However, the DESCRIBE command is not a standard SQL command and is 
not supported by PostgreSQL. Instead, you can use the \d command or
query the system catalog directly to get table information.*/

SELECT * FROM sailors;


/* syntax used for creating the BOATS table */
CREATE TABLE boats(
	bid NUMERIC,
	bname VARCHAR(10),
	color VARCHAR(10)
);

SELECT * FROM boats;

/* syntax used for creating the RESERVES table */
CREATE TABLE RESERVES(
	sid SMALLINT,
	bid NUMERIC,
	day DATE,
	PRIMARY KEY(sid,bid,day)
);

SELECT * FROM reserves;

/* adding FOREIGN KEYS */
ALTER TABLE reserves ADD FOREIGN KEY(sid) REFERENCES sailors(sid);

ALTER TABLE reserves ADD FOREIGN KEY(bid) REFERENCES boats(bid);

/* Example query to update a datatype of any field */
ALTER TABLE boats ALTER COLUMN bid TYPE NUMERIC;


/* inserting data into SAILORS table */
INSERT INTO SAILORS VALUES (22,'DUSTIN',7,45.0);

INSERT INTO SAILORS VALUES (29,'BRUTUS',1,33.0);

INSERT INTO SAILORS VALUES (31,'LUBBER',8,55.5);

INSERT INTO SAILORS VALUES (32,'ANDY',8,25.5);

INSERT INTO SAILORS VALUES (58,'RUSTY',10,35.5);

INSERT INTO SAILORS VALUES (64,'HORATIO',7,35.0);

INSERT INTO SAILORS VALUES (71,'ZORBA',10,16.0);

INSERT INTO SAILORS VALUES (74,'HORATIO',9,35.0);

INSERT INTO SAILORS VALUES (85,'ART',3,25.0);

INSERT INTO SAILORS VALUES (95,'BOB',3,63.5);


-- Questions and Queries on above tables

-- 1) Find the name of sailors who reserved boat number 3.
SELECT DISTINCT(sname) FROM sailors,reserves where sailors.sid = reserves.sid;

-- 2) Find the name of sailors who reserved green boat.
SELECT s.sname FROM sailors s, reserves r, boats b WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'GREEN';

-- 3) Find the color of boats reserved by Dustin
SELECT b.color FROM boats b,reserves r,sailors s WHERE s.sid = r.sid AND r.bid = b.bid AND s.sname='DUSTIN';

-- 4) Find the names of the sailors who have reserved atleast one BOAT.
SELECT DISTINCT(s.sname) FROM sailors s, reserves r, boats b WHERE s.sid = r.sid AND bid = r.bid;

-- 5) Find the all sid of sailors who have a rating of 10 or have reserved boat 104.
SELECT sname
FROM sailors
WHERE sid IN (SELECT sid FROM reserves WHERE Rating = 10)
   OR sid IN (SELECT sid FROM reserves WHERE bid = 104);

-- 6) Find the sid‘s of sailors with age over 20 who have not registered a red boat.
SELECT DISTINCT(s.sid) FROM sailors s,reserves r,boats b WHERE s.sid = r.sid
							AND b.bid = r.bid
							AND s.age > 20 
							AND b.color != 'RED';

-- 7) Find the names of sailors who have reserved a red or green boat.
SELECT DISTINCT(s.sname) FROM sailors s, reserves r,boats b WHERE s.sid = r.sid
							      AND r.bid = b.bid 
							      AND (b.color = 'RED' or b.color = 'GREEN');

-- 8) Find sailors whose rating is better than Dustin.
SELECT sname FROM sailors WHERE rating > (SELECT rating FROM sailors WHERE sname = 'DUSTIN');

-- 9) Find the names of sailors who are older than the oldest sailor with a rating of 10.
SELECT sname FROM sailors WHERE age > (SELECT MAX(age) FROM sailors WHERE rating=10);
