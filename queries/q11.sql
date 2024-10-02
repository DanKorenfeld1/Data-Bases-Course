-- -- authors (name, conference, year, institution, count, adjustedcount)
-- -- conferences (conference, area, subarea)
-- -- institutions (institution, region, country)
--
--

WITH old_conference AS (
SELECT conference
FROM authors
GROUP BY conference
HAVING COUNT(DISTINCT year) > 15
),

old_conference_authors AS (
    SELECT DISTINCT name
    FROM authors
    WHERE conference IN (SELECT conference FROM old_conference)
)

SELECT DISTINCT name
FROM authors
EXCEPT
SELECT name
FROM old_conference_authors
ORDER BY name;





