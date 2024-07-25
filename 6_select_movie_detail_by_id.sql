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
    ) AS director,
    json_build_object(
        'id', p.id,
        'filename', pf.filename,
        'mime_type', pf.mime_type,
        'url', pf.url
    ) AS photo,
    (
        SELECT json_agg(json_build_object(
            'id', a.id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', json_build_object(
                'id', af.id,
                'filename', af.filename,
                'mime_type', af.mime_type,
                'url', af.url
            )
        ))

        FROM people a
        LEFT JOIN files af ON a.primary_photo_id = af.id
        JOIN characters c ON c.actor_id = a.id
        WHERE c.movie_id = m.id
    ) AS actors,
    (
        SELECT json_agg(json_build_object(
            'id', g.id,
            'name', g.name
        ))
        
        FROM genres g
        JOIN movie_genres mg ON g.id = mg.genre_id
        WHERE mg.movie_id = m.id
    ) AS genres
FROM
    movies m

LEFT JOIN
    files f ON m.poster_id = f.id

JOIN
    people d ON m.director_id = d.id

LEFT JOIN
    files pf ON d.primary_photo_id = pf.id

WHERE
    m.id = 1;