SELECT State_Name, Country, City, ALand, AWater
FROM US_Household_Income.USHouseholdIncome;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Household_Income.USHouseholdIncome
GROUP BY State_Name
ORDER BY 2 DESC
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Household_Income.USHouseholdIncome
GROUP BY State_Name
ORDER BY 3 DESC
;


SELECT State_Name, SUM(ALand), SUM(AWater)
FROM US_Household_Income.USHouseholdIncome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10
;

SELECT * 
FROM US_Household_Income.USHouseholdIncome u 
JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
;

SELECT * 
FROM US_Household_Income.USHouseholdIncome u 
JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
;

SELECT u.State_Name, Country, Type, 'Primary', Mean, Median
FROM US_Household_Income.USHouseholdIncome u 
INNER JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
;

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Household_Income.USHouseholdIncome u 
INNER JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Household_Income.USHouseholdIncome u 
INNER JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 2 DESC
LIMIT 20
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Household_Income.USHouseholdIncome u 
INNER JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING Count(Type) > 100
ORDER BY 1 DESC
LIMIT 20
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Household_Income.USHouseholdIncome u 
INNER JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING Count(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM US_Household_Income.USHouseholdIncome u 
JOIN US_Household_Income.USHouseHoldIncome_Statistics us
ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC
;