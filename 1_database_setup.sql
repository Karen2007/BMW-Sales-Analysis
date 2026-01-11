USE my_bmw_project;

CREATE TABLE cars (
    model VARCHAR(50),
    year INT,
    region VARCHAR(50),
    color VARCHAR(50),
    fuelType VARCHAR(50),
    transmission VARCHAR(50),
    engineSizeL DECIMAL(3, 1),
    mileageKM INT,
    priceUSD INT,
    salesVolume INT,
    salesClassification VARCHAR(10)
);


-- IMPORTANT FOR USERS:
-- Please update the file path below to point to where you saved 'BMW-Sales-Data.csv'.
-- Get the dataset from 'https://www.kaggle.com/datasets/eshummalik/bmw-sales-dataset'

LOAD DATA INFILE 'YOUR_PATH_TO_FILE/BMW-Sales-Data.csv' 
INTO TABLE cars 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;