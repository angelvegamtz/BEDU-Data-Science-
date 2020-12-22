USE query_competition;

describe h1n1;

SELECT *
FROM h1n1
WHERE Country = 'Mexico';

SELECT count(DISTINCT Country)
FROM h1n1;


# 1
SELECT Country, Deaths
FROM h1n1
WHERE Country != 'Grand Total'
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Deaths DESC
LIMIT 1;

# 2
SELECT Country, Deaths
FROM h1n1
WHERE Country != 'Grand Total'
  AND Deaths IS NOT null
  AND Deaths = 0
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Deaths ASC;

# 3
SELECT Country, Cases
FROM h1n1
WHERE Country != 'Grand Total'
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Cases DESC
LIMIT 1;

# 4
SELECT Country, Cases
FROM h1n1
WHERE Country != 'Grand Total'
  AND Cases = 1
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Cases;

# 5
SELECT avg(Deaths) Promedio_de_muertes
FROM h1n1
WHERE UpdateTime LIKE '7/6/2009%'
  AND Country != 'Grand Total';

# 6
SELECT avg(Cases) Promedio_de_casos
FROM h1n1
WHERE UpdateTime LIKE '7/6/2009%'
  AND Country != 'Grand Total';

# 7
SELECT Country, Deaths
FROM h1n1
WHERE Country != 'Grand Total'
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Deaths DESC
LIMIT 5;

# 8
SELECT Country, Deaths
FROM h1n1
WHERE Country != 'Grand Total'
  AND UpdateTime LIKE '7/6/2009%'
ORDER BY Deaths
LIMIT 5;

