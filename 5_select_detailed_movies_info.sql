SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object(
        'id', f.id,
        'filename', f.filename,
        'mime_type', f.mime_type,
        'url', f.url
    ) AS poster,
    json_build_object(
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name
    ) AS director

FROM
    movies m

JOIN
    countries c ON m.country_id = c.id

LEFT JOIN
    files f ON m.poster_id = f.id

JOIN
    people d ON m.director_id = d.id

JOIN
    movie_genres mg ON m.id = mg.movie_id

JOIN
    genres g ON mg.genre_id = g.id

WHERE
    c.id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > '02:15:00'
    AND (g.name = 'Action' OR g.name = 'Drama');