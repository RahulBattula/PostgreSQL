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

COPY sample_superstore ("Ship_mode", "Segment", "Country", "City", "State", "Postal_Code", "Region", "Category", "Sub_Category", "Sales", "Quantity", "Discount", "Profit")
FROM 'R:\Tableau practice\SampleSuperstore.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM sample_superstore;
