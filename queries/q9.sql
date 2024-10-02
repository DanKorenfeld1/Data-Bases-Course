-- authors (name, conference, year, institution, count, adjustedcount)
-- conferences (conference, area, subarea)
-- institutions (institution, region, country)



-------------------------new query ---------------------------------------------

WITH instDeatail(institution , countryCount,country) as (
    SELECT institution,sum(totalCount) , country
    FROM authors natural join institutions
    GROUP BY institution, country
)


select country,institution,countryCount
from instDeatail i1
where countryCount = (select max(countryCount)
                    from instDeatail i2
                    GROUP BY country
                    HAVING i1.country = i2.country)
order by country,institution;




