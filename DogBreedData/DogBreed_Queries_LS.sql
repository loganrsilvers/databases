# Assn 3 Queries
# RETURN THIS FILE WITH YOUR ANSWERS. Remember 
# to zip the file because Canvas will not downlaod a 
# Text file or SQL File correctly.
# ALL QUERIES USE AKC_DOGS Database
/*
Query 1:
Show the list of breeds that would be good watch dogs.  
Demeanor needs to be 'Alert/Responsive', 
that have a minimum weight at or above 30 lbs.
Order the data by max_weight in descending order 
( Example: 100, 99, 98..)
The columns to display are from Breed 
(Name, Min_Weight, Max_Weight), Groups (GroupName)
HINT: 2 Joins, 2 parts to the Where clause
*/

SELECT breeds.name, breeds.min_weight, breeds.max_weight, 
groups.groupName FROM breeds

INNER JOIN demeanor ON breeds.demeanorId = demeanor.ID
INNER JOIN groups ON breeds.groupId = groups.ID

WHERE demeanor.demeanor_value = 'Alert/Responsive' 
AND breeds.min_weight >= 30

ORDER BY breeds.max_weight DESC;

/*
Query 2:
Show the list of breeds that are in the herding group 
that would NOT be good watch dogs --  
Demeanor can be any except 'Alert/Responsive'.
They need to have a minimum weight at or above 20 lbs.
Order the data by max_weight in ascending order ( Example: 100, 99, 98..)
The columns to display are from Breed 
(Name, Min_Weight, Max_Weight),  
Demeanor ( Demeanor_Category)
HINT: 2 Joins, 3 parts to the Where clause
*/

SELECT breeds.name, breeds.min_weight,breeds.max_weight, 
demeanor.demeanor_category FROM breeds

INNER JOIN demeanor ON breeds.demeanorId = demeanor.ID
INNER JOIN groups ON breeds.groupId = groups.ID

WHERE groups.groupName = 'Herding Group'
AND demeanor.demeanor_value != 'Alert/Responsive'
AND breeds.min_weight >= 20

ORDER BY breeds.max_weight ASC;


/*
Query 3:
Modify Query 2 to show the age range (expectancy)  of the breed. 
Order the list by Min_Expectancy, then by Max_Expectancy.

HINT: 2 Joins, 3 parts to the Where clause. Order by uses 2 columns
*/

SELECT breeds.name, breeds.min_weight, breeds.max_weight, 
breeds.min_expectancy, breeds.max_expectancy,  demeanor.demeanor_category
FROM breeds

INNER JOIN demeanor ON breeds.demeanorId = demeanor.ID
INNER JOIN groups ON breeds.groupId = groups.ID

WHERE groups.groupName = 'Herding Group' 
AND demeanor.demeanor_value != 'Alert/Responsive' 
AND breeds.min_weight >= 20

ORDER BY breeds.min_expectancy ASC, breeds.max_expectancy ASC;

/*
Query 4:
The Limit clause restricts the output to the top N records
 where N is the Limit Value

Given that information find the top ten dogs 
that have the greatest life span, IE Max_Expectancy.
Show the Breed Name, Demeanor Category and 
Group Name in this query along with the Min/Max Weight, Min/Max Expectancy

HINT:
2 JOINS, No WHERE CLAUSE, Order by one column, LIMIT clause at the end.
*/

SELECT breeds.name, demeanor.demeanor_category, groups.groupName, 
breeds.min_weight, breeds.max_weight, breeds.min_expectancy, 
breeds.max_expectancy FROM breeds

INNER JOIN demeanor ON breeds.demeanorId = demeanor.ID
INNER JOIN groups ON breeds.groupId = groups.ID

ORDER BY breeds.max_expectancy DESC

LIMIT 10;


/*
Query 5:
Modify the above query, #4,  to show the top 10 Terriers ( Terrier Group ) with the maximum age from those who live the longest to those who live the least.
HINT:
2 JOINS, 1 WHERE CLAUSE, Order by one column, LIMIT clause at the end.
*/

SELECT breeds.name, demeanor.demeanor_category, groups.groupName, breeds.min_weight,
breeds.max_weight, breeds.min_expectancy, breeds.max_expectancy FROM breeds

INNER JOIN demeanor ON breeds.demeanorId = demeanor.ID
INNER JOIN groups ON breeds.groupId = groups.ID

WHERE groups.groupName = 'Terrier Group'

ORDER BY breeds.max_expectancy DESC

LIMIT 10;


/* Query 6:
Create a query to find your favorite dog breed or breeds. 
*/

SELECT breeds.name FROM breeds

WHERE breeds.name = 'Boxer';
