SELECT DISTINCT name
FROM authors A
WHERE NOT EXISTS (
    SELECT name
    FROM authors A1
    JOIN conferences C1 ON A1.conference = C1.conference
    WHERE A.name = A1.name
    AND (C1.area <> 'theory' OR A1.year >= 1980)
)
ORDER BY name;
