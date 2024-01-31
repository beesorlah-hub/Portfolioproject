USE portfolioproject;
SELECT * FROM coviddeaths
ORDER BY 3,4;

USE portfolioproject;
SELECT * FROM covidvaccinations
ORDER BY 3,4;

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM coviddeaths
ORDER BY 1,2;

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as Deathpercentage
FROM coviddeaths
WHERE Location LIKE '%Nigeria%'
ORDER BY 1,2;

SELECT location, date, population,total_cases, (total_cases/Population) *100 as PercentagePopulationInfected
FROM Coviddeaths
WHERE Location LIKE '%Nigeria%'
ORDER BY 1,2;

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/Population)) *100 as PercentagePopulationInfected
FROM Coviddeaths
GROUP BY location, population
ORDER BY PercentagePopulationInfected desc;


SELECT continent,  MAX(CAST(Total_deaths)) as TotalDeathCount
FROM Coviddeaths 
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc
LIMIT 0,1000;

SELECT  date, SUM(new_cases) as total_cases, SUM(CONVERT( int,new_deaths)) as total_death ,  SUM(CAST(new_deaths as int)) as total_death/ SUM(New_cases) * 100 as Deathpercentage
FROM coviddeaths
WHERE continent is not null
ORDER BY 1,2;

SELECT
* FROM  coviddeaths
JOIN covidvaccinations
on coviddeaths.location = covidvaccinations.location
and coviddeaths.date = covidvaccinations.date;


SELECT coviddeaths.continent, coviddeaths.location, coviddeaths.date, coviddeaths.population, covidvaccinations.new_vaccinations
 FROM  coviddeaths
JOIN covidvaccinations
on coviddeaths.location = covidvaccinations.location
and coviddeaths.date = covidvaccinations.date
WHERE death.continent is not null
ORDER BY 2,3;