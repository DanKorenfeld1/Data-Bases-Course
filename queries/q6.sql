--authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
--institutions (institution, region, country)


SELECT DISTINCT a1.name
FROM authors a1
WHERE NOT EXISTS (
    SELECT 1
    FROM authors o
    WHERE o.name = 'Omri Abend'
    AND NOT EXISTS (
        SELECT 1
        FROM authors a2
        WHERE a2.name = a1.name
        AND a2.conference = o.conference
        AND a2.year = o.year
    )
)
ORDER BY a1.name;


