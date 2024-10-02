WITH MinDurations AS (
    SELECT year, MIN(duration) AS min_duration
    FROM Movies
    GROUP BY year
)
SELECT DISTINCT M1.movieId, M1.title, M1.duration
FROM Movies M1
JOIN MinDurations MD ON M1.year = MD.year AND M1.duration = MD.min_duration
ORDER BY M1.movieId, M1.title, M1.duration;
