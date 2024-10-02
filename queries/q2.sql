SELECT DISTINCT institutions.institution as institution, authors.name as name
FROM authors NATURAL JOIN institutions
WHERE institutions.region = 'africa'
ORDER BY institution, name;
