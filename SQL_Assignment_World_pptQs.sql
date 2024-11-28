#Task 1 - Using Count, get the number of cities in the USA
SELECT COUNT(*) AS total_USA_cities
FROM city
WHERE CountryCode = 'USA';

#Task 2 - Find population and avg. life expectancy of Argentinians
SELECT Name, Population, LifeExpectancy
FROM country
WHERE name = 'Argentina';

#Task 3 - Using Order by and Limit, find country with highest life expectancy
SELECT name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC 
LIMIT 3;

#Task 4 - Cities around the world starting with letter F
SELECT Name
FROM city
WHERE name LIKE 'F%'
LIMIT 25;

#Task 5 - Find first 10 - ID, Name and Population from City table
SELECT ID, Name, Population
FROM city
LIMIT 10;

#Task 6 - Finding cities with a population greater than 2 million
SELECT Name, Population
FROM city
WHERE Population > 2000000
ORDER BY Population ASC;

#Task 7 - Find cities whose name begins with 'be' prefix
SELECT Name
FROM city
WHERE Name LIKE 'Be%';

/*Task 8 - Finding cities whose population between 500000
and a million*/
SELECT Name, Population
FROM city
WHERE Population Between 500000 AND 1000000;

#Task 9 - Find city with lowest population
SELECT Name, Population
FROM city
ORDER BY Population ASC 
LIMIT 3;

#Bonus Tasks 
#Bonus Task 1 - Create SQL Statement to find capital of Spain
#'Capital' from country returns number which matches 'ID' from City table
SELECT Capital, name
FROM country
WHERE name = 'Spain'; 

SELECT ID, Name 
FROM city
WHERE CountryCode = 'ESP';
#Answer to finding capital of Spain
SELECT country.name AS Country, city.CountryCode AS 'Code', city.name AS Capital
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.name = 'Spain';

#Bonus Task 2 - find all languages spoken in Carribean region 
SELECT * FROM countrylanguage;
SELECT * FROM country;
SELECT Code, name, region FROM country
WHERE region = 'Caribbean';
-- Answer below to query 
SELECT DISTINCT countrylanguage.Language, country.Region
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE region = 'Caribbean'
ORDER BY countrylanguage.language ASC;
-- Reveals 10 languages spoken 

#Bonus Task 3 - Find all cities in continent of Europe
SELECT * FROM city;
SELECT * FROM country
WHERE Continent = 'Europe';
SELECT city.name AS City, country.name AS Country, country.continent AS Continent
FROM country
JOIN city ON Country.Code = city.CountryCode
WHERE Continent = 'Europe';

#Tasks From Word.Doc excluding those that have been answered earlier via PPT questions

#Task 3 - Compile list of cities that include word 'New' in name
-- Added space before % to only compile cities that had 'New ...'
SELECT name
FROM city
WHERE name LIKE ('New %');

#Task 4 - Compile top 10 populated cities in the world
SELECT name, Population 
FROM city
ORDER BY Population DESC
LIMIT 10;

#Task 5 - Compile Cities with population > 2 million
SELECT Name, Population
FROM city
WHERE Population >2000000;

#Task 8 - Display cities sorted by name in ascending order
SELECT ID, Name
FROM city
ORDER BY Name ASC;

#Task 9 - Identify most populated city
SELECT Name, Population
FROM city
ORDER BY Population DESC
LIMIT 5;

#Task 10 - Name frequency analysis - 
SELECT name, COUNT(*) AS 'Frequency' 
FROM city
GROUP BY name
ORDER BY Frequency DESC;

#Task 12 - Country with largest population
SELECT Name, FORMAT(Population, '#,###,###,###')
FROM country
ORDER BY Population DESC;

#Task 16 - Finding Average Population across all countries in database
SELECT Name, Population,
(Population / (SELECT AVG(Population) FROM country)) AS Average_Population
FROM country
ORDER BY Average_Population DESC;

#Task 17 - Finding population of Capital Cities worldwide
SELECT country.name AS Country, city.name AS Capital,
FORMAT(country.population,'#,###,###') AS Population
FROM country
JOIN city ON country.Capital = city.ID;

/*Task 18 - Finding countries with sparse 
populations for agricultural developmental projects*/
SELECT Name AS Country, SurfaceArea, Population, (Population/SurfaceArea) AS Population_Density
FROM country
ORDER BY Population_Density ASC;

#Task 19 - Find the Cities with high GDP per Capita
SELECT AVG(country.GNP/country.population) AS Average_GNP
FROM country;

SELECT country.Name AS Country, city.Name AS City, country.GNP AS GNP
FROM country
JOIN city ON country.code = city.CountryCode
WHERE country.GNP / country.population> 
	(SELECT AVG(country.GNP / country.population) 
    FROM country);

# Task 20 - Find cities ranked between 31-40 for population
SELECT name, population
FROM city
ORDER BY Population DESC
LIMIT 30, 10; -- skips 30 rows and returns next 10 so 31-40




 







