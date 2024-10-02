SELECT DISTINCT a1.name as name, a1.year
FROM authors as a1 
JOIN authors as a2
ON a1.year = a2.year and a1.institution = a2.institution and a1.name = a2.name
WHERE a1.institution = 'Hebrew University of Jerusalem' 
and a1.conference in (select conference
		      from conferences
		      where subarea = 'ai')
and a2.conference in (select conference
		      from conferences
		      where subarea = 'economics')
ORDER BY name, year;



