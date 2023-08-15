/* syntax used for creating a table */

CREATE TABLE sample_superstore (
    "Ship_mode" VARCHAR,
    "Segment" VARCHAR,
    "Country" VARCHAR,
    "City" VARCHAR,
    "State" VARCHAR,
    "Postal_Code" INTEGER,
    "Region" VARCHAR,
    "Category" VARCHAR,
    "Sub_Category" VARCHAR,
    "Sales" NUMERIC,
    "Quantity" INTEGER,
    "Discount" NUMERIC,
    "Profit" NUMERIC
);


/* Below is the command used for importing of data from CSV file directlt into the table that I've created in the above query.
You can mention your own path of your PC or Laptop for importing the dataset.*/

COPY sample_superstore ("Ship_mode", "Segment", "Country", "City", "State", 
                        "Postal_Code", "Region", "Category", "Sub_Category",
                        "Sales", "Quantity", "Discount", "Profit")
                        FROM 'R:\Tableau practice\SampleSuperstore.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM sample_superstore;
