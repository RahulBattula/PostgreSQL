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
INSERT INTO SAILORS VALUES(22,'DUSTIN',7,45.0);

INSERT INTO SAILORS VALUES(29,'BRUTUS',1,33.0);

INSERT INTO SAILORS VALUES(31,'LUBBER',8,55.5);

INSERT INTO SAILORS VALUES(32,'ANDY',8,25.5);

INSERT INTO SAILORS VALUES(58,'RUSTY',10,35.5);

INSERT INTO SAILORS VALUES(64,'HORATIO',7,35.0);

INSERT INTO SAILORS VALUES(71,'ZORBA',10,16.0);

INSERT INTO SAILORS VALUES(74,'HORATIO',9,35.0);

INSERT INTO SAILORS VALUES(85,'ART',3,25.0);

INSERT INTO SAILORS VALUES(95,'BOB',3,63.5);
