SELECT DISTINCT institutions.institution as institution, authors.name as name
FROM authors NATURAL JOIN institutions
WHERE institutions.country = 'il' and name in (SELECT name
					       FROM authors
           WHERE authors.totalcount >= 2 and authors.conference LIKE 'sig%')
ORDER BY institution, name;
