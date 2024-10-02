WITH authors_in_university AS (
    SELECT a.name, a.year, SUM(a.totalcount) AS total_count
    FROM authors a
    JOIN conferences c ON a.conference = c.conference
    WHERE a.institution = 'Hebrew University of Jerusalem'
      AND c.area = 'ai'
      AND a.year BETWEEN 2000 AND 2020
    GROUP BY a.name, a.year
),

max_totals AS (
    SELECT year, MAX(total_count) AS max_total
    FROM authors_in_university
    GROUP BY year
)
-- Select the authors with the maximum total for each year
SELECT aiu.year, aiu.name
FROM authors_in_university aiu
JOIN max_totals mt ON aiu.year = mt.year AND aiu.total_count = mt.max_total
ORDER BY aiu.year, aiu.name;