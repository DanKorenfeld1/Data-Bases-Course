-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country)

SELECT institutions.country, count(DISTINCT institutions.institution) as institutionCount
FROM institutions
GROUP BY country
ORDER BY institutions.country;