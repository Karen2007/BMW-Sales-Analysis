-- Select the first 10 rows to make sure that data is imported.
SELECT * FROM cars LIMIT 10; 

-- Check the amount of rows imported
SELECT COUNT(*) AS total_rows FROM cars;

-- 1. Which region is generating the most revenue for BMW?
SELECT region, SUM(priceUSD * salesVolume) AS total_revenue
FROM cars
GROUP BY region
ORDER BY total_revenue DESC;

-- 2. Is the number of manual cars sold following any trend?
SELECT year, transmission, COUNT(transmission)
FROM cars
WHERE transmission = 'manual'
GROUP BY year, transmission
ORDER BY transmission, year DESC;

-- 3. Which car model brings the most revenue for BMW?
SELECT model, SUM(priceUSD * salesVolume) AS total_revenue
FROM cars
GROUP BY model
ORDER BY total_revenue DESC;

-- 4. Which color of cars has been sold the most?
SELECT color, SUM(salesVolume) AS carsSold
FROM cars
GROUP BY color
ORDER BY carsSold DESC;

-- 5. What's the average price of the car and how many units were sold based on the engine power?
SELECT engineSizeL, AVG(priceUSD) AS averagePrice, SUM(salesVolume) AS unitsSold
FROM cars
GROUP BY engineSizeL
ORDER BY engineSizeL DESC;

-- 6. Which fuel type cars are the most popular?
SELECT fuelType, SUM(salesVolume) AS unitsSold
FROM cars
GROUP BY fuelType
ORDER BY unitsSold DESC;

-- 7. What's the relationship between the mileage of the car and its price?
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