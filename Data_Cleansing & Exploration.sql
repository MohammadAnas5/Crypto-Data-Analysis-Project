-- Data Cleaning

-- Create view to avoid changes in main table
CREATE VIEW crypto AS SELECT * FORM main;

-- Convert datetime into two saperate columns Date_ and Time_ 
CREATE OR REPLACE VIEW crypto AS
(SELECT SUBSTRING_INDEX(c.Datetime," ",1) as date_,
REVERSE(SUBSTRING_INDEX(reverse(c.Datetime)," ",1)) as Time_
,c.Symbol,c.Open,c.Close,c.High,c.Low 
FROM main c);

-- Perform typecasting according to every column 
CREATE VIEW crypto2 AS (
SELECT cast(str_to_date(date_, "%m/%d/%y") as date) as date_,CAST(time_ AS time),Symbol
CAST(High AS double) as High,CAST(Low AS double) as low,CAST(Open AS double) as open ,CAST(Close AS double) as close
FROM crypto_data c) ;
