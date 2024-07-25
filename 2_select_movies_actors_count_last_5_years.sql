SELECT
    m.id,
    m.title,
    COUNT(c.actor_id) AS actors_count

FROM
    movies m

LEFT JOIN
    characters c ON m.id = c.movie_id

WHERE
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'

GROUP BY
    m.id, m.title;