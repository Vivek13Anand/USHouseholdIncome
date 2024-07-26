SELECT id, COUNT(id)
FROM US_Household_Income.USHouseholdIncome
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM(
		SELECT row_id, id, ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
        FROM US_Household_Income.USHouseholdIncome
	) duplicates
WHERE row_num > 1
;

DELETE FROM USHouseholdIncome
WHERE row_id IN(
				SELECT row_id
                FROM(
						SELECT row_id, id, ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) row_num
						FROM US_Household_Income.USHouseholdIncome
					) duplicates
				WHERE row_num > 1);
                
SELECT State_Name, COUNT(State_Name)
FROM US_Household_Income.USHouseholdIncome
GROUP BY State_Name
;

SELECT DISTINCT State_Name
FROM US_Household_Income.USHouseholdIncome
ORDER BY 1
;

UPDATE US_Household_Income.USHouseholdIncome
SET State_Name = 'Georgia'
WHERE State_Name = 'georgia'
;

SELECT *
FROM US_Household_Income.USHouseholdIncome
WHERE Place = ''
ORDER BY 1
;

UPDATE US_Household_Income.USHouseholdIncome
SET Place = 'Autauga Ville'
WHERE Country = 'Autauga Country'
AND City = 'Vinemont'
;

SELECT DISTINCT AWater
FROM US_Household_Income.USHouseholdIncome
WHERE AWater = 0 OR AWater ='' OR AWater IS NULL
;

SELECT ALand, AWater
FROM US_Household_Income.USHouseholdIncome
WHERE (ALand = 0 OR ALand ='' OR ALand IS NULL)
;
