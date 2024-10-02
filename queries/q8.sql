--authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
--institutions (institution, region, country)


SELECT DISTINCT a.name
FROM authors a
JOIN conferences c ON a.conference = c.conference
WHERE c.subarea = 'ml' AND a.year >= 2020
AND a.name IN (
    SELECT name
    FROM authors
    JOIN conferences ON authors.conference = conferences.conference
    WHERE conferences.subarea = 'ml'
    GROUP BY name
    HAVING COUNT(DISTINCT authors.conference) >= 3
)
ORDER by a.name;