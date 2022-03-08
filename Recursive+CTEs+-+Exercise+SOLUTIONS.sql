--Exercise 1 Solution:


WITH Odds AS
(
SELECT
 1 AS MyOddNumber

UNION  ALL

SELECT 
MyOddNumber + 2
FROM Odds
WHERE MyOddNumber < 99
)

SELECT
MyOddNumber
FROM Odds




--Exercise 2 Solution:


WITH Dates AS
(
SELECT
 CAST('01-01-2020' AS DATE) AS MyDate

UNION ALL

SELECT
DATEADD(MONTH, 1, MyDate)
FROM Dates
WHERE MyDate < CAST('12-01-2029' AS DATE)
)

SELECT
MyDate

FROM Dates
OPTION (MAXRECURSION 120)