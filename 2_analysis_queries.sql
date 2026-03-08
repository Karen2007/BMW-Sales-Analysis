USE my_bmw_project;

-- First 10 rows of the dataset
SELECT * FROM cars LIMIT 10;

-- Drop these columns, since they're inaccurate.
ALTER TABLE cars DROP COLUMN salesVolume;
ALTER TABLE cars DROP COLUMN salesClassification;

-- 1. Objective: Identify which regions generate the most revenue to target marketing efforts.
SELECT region,
       COUNT(*) AS total_listings,
       AVG(priceUSD) AS avg_price,
       MIN(priceUSD) AS min_price,
       MAX(priceUSD) AS max_price
FROM cars
GROUP BY region
ORDER BY avg_price DESC;

-- 2. Objective: Identify any trends of the number of manual cars sold between the years.
SELECT year, transmission, COUNT(transmission)
FROM cars
WHERE transmission = 'manual'
GROUP BY year, transmission
ORDER BY transmission, year DESC;

-- 3. Objective: Explore which car model commands the highest average listing price and mileage.
SELECT model,
       COUNT(*) AS total_listings,
       ROUND(AVG(priceUSD), 2) AS avg_price,
       ROUND(AVG(mileageKM), 0) AS avg_mileage
FROM cars
GROUP BY model
ORDER BY avg_price DESC;

-- 4. Objective: Identify which car colors are most common and whether color affects listing price.
SELECT color,
       COUNT(*) AS total_listings,
       ROUND(AVG(priceUSD), 2) AS avg_price
FROM cars
GROUP BY color
ORDER BY total_listings DESC;

-- 5. Objective: Explore the relationship between engine size, average listing price, and mileage.
SELECT engineSizeL,
       COUNT(*) AS total_listings,
       ROUND(AVG(priceUSD), 2) AS avg_price,
       ROUND(AVG(mileageKM), 0) AS avg_mileage
FROM cars
GROUP BY engineSizeL
ORDER BY avg_price DESC;

-- 6. Objective: Compare listing volume and average price across different fuel types.
SELECT fuelType,
       COUNT(*) AS total_listings,
       ROUND(AVG(priceUSD), 2) AS avg_price,
       ROUND(AVG(mileageKM), 0) AS avg_mileage
FROM cars
GROUP BY fuelType
ORDER BY total_listings DESC;

-- 7. Objective: Examine how mileage category affects average listing price to identify depreciation patterns.
SELECT
    CASE
        WHEN mileageKM < 25000 THEN '1. Low (< 25k KM)'
        WHEN mileageKM BETWEEN 25000 AND 50000 THEN '2. Moderate (25k-50k KM)'
        WHEN mileageKM BETWEEN 50000 AND 100000 THEN '3. High (50k-100k KM)'
        WHEN mileageKM > 100000 THEN '4. Very high (>100k KM)'
    END AS mileageCategory,
    COUNT(*) AS numberOfCars,
    ROUND(AVG(priceUSD), 0) AS averagePrice
FROM cars
GROUP BY mileageCategory
ORDER BY mileageCategory;