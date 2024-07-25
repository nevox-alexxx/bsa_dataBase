[![](https://mermaid.ink/img/pako:eNrFVt2OojAUfpWG65kX4M7M4q6ZH406c2VCjvQgzQAlp8Vdor77FuqoxZqwcZLlAmi_0-_89rS7IJEcgzBA-iFgQ1CsSmae90U0X7CdHbSPKDUTnM2ez1NboCQDYrVCKqHAayQVpHTsx3K4CWEBIr-erkCp35L4GdGiQKWhqFhCCBp5DNqH1hV30IP92Pd48hJ1rg5yNhU5-q0ujLpYN5UH-sTGEzbKv8UT-_M6_ZhEQzOmhc4vzNT4RzOOKiFRaSEvAlHWBZJI2LrmG7wwqDWCEeYICuN24KhF2kLOeE3gsrUWJbIuNTWxsWz87EJcECZakg-rpDK0feTuqD39Gs1HT8vhte6m_nbgvuRJ5m5sWCG3An0ugs_3uz2cRdPZSzTQu3_cr537ayFN26iyplcda0E669XGF9cGS440uDAqEgUYqMqklt9fA9P3t-V8-ObpxeBe9T-jt_n_0t01jdhvwalOZ71smOSRA5zoxqOP6XyyjGJ_M2rPCR_hlaYToT2F9vvHR7k79umQZaBi2IIG8gn1TLDiKWwlCY3K6ZU3l4jzCt8CJ2pWQRcT5STULyxKK-vjvWhGlrVNuekKSMrZyz7xKofm2ru9GzXbRK-4-lLtLvNynXdKyArgJmelT-xIHR4buim8deNTekmXkiziYwtosx88BObkMfcAbu4mXR2tAp2hqf4gNL8c6HMVrMqDkYNay0VTJkGoqcaHgGS9yYIwhVyZka39493mNItcmGb7aq8-3Q3o8Bchc8Jh?type=png)](https://mermaid.live/edit#pako:eNrFVt2OojAUfpWG65kX4M7M4q6ZH406c2VCjvQgzQAlp8Vdor77FuqoxZqwcZLlAmi_0-_89rS7IJEcgzBA-iFgQ1CsSmae90U0X7CdHbSPKDUTnM2ez1NboCQDYrVCKqHAayQVpHTsx3K4CWEBIr-erkCp35L4GdGiQKWhqFhCCBp5DNqH1hV30IP92Pd48hJ1rg5yNhU5-q0ujLpYN5UH-sTGEzbKv8UT-_M6_ZhEQzOmhc4vzNT4RzOOKiFRaSEvAlHWBZJI2LrmG7wwqDWCEeYICuN24KhF2kLOeE3gsrUWJbIuNTWxsWz87EJcECZakg-rpDK0feTuqD39Gs1HT8vhte6m_nbgvuRJ5m5sWCG3An0ugs_3uz2cRdPZSzTQu3_cr537ayFN26iyplcda0E669XGF9cGS440uDAqEgUYqMqklt9fA9P3t-V8-ObpxeBe9T-jt_n_0t01jdhvwalOZ71smOSRA5zoxqOP6XyyjGJ_M2rPCR_hlaYToT2F9vvHR7k79umQZaBi2IIG8gn1TLDiKWwlCY3K6ZU3l4jzCt8CJ2pWQRcT5STULyxKK-vjvWhGlrVNuekKSMrZyz7xKofm2ru9GzXbRK-4-lLtLvNynXdKyArgJmelT-xIHR4buim8deNTekmXkiziYwtosx88BObkMfcAbu4mXR2tAp2hqf4gNL8c6HMVrMqDkYNay0VTJkGoqcaHgGS9yYIwhVyZka39493mNItcmGb7aq8-3Q3o8Bchc8Jh)

```
erDiagram
    USERS {
        int id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        timestamp created_at
        timestamp updated_at
    }
    
    FILES {

        int id PK
        varchar filename
        varchar mime_type
        varchar key
        varchar url
        timestamp created_at
        timestamp updated_at
    }

    MOVIES {
        int id PK
        varchar title
        text description
        numeric budget
        date release_date
        interval duration
        int country_id FK
        int director_id FK
        int poster_id FK
        timestamp created_at
        timestamp updated_at
    }

    CHARACTERS {
        int id PK
        varchar name
        text description
        varchar role
        int movie_id FK
        int actor_id FK
        timestamp created_at
        timestamp updated_at
    }

    PEOPLE {
        int id PK
        varchar first_name
        varchar last_name
        text biography
        date birth_date
        varchar gender
        int country_id FK
        int primary_photo_id FK
        timestamp created_at
        timestamp updated_at
    }

    COUNTRIES {
        int id PK
        varchar name
        timestamp created_at
        timestamp updated_at
    }

    GENRES {
        int id PK
        varchar name
        timestamp created_at
        timestamp updated_at
    }

    MOVIE_GENRES {
        int movie_id PK
        int genre_id PK
    }

    FAVORITE_MOVIES {
        int user_id PK
        int movie_id PK
    }

    USERS ||--o{ FILES : has_avatar
    USERS ||--o{ FAVORITE_MOVIES : has_favorites
    MOVIES ||--o{ FAVORITE_MOVIES : is_favorite
    MOVIES ||--o{ MOVIE_GENRES : has_genres
    GENRES ||--o{ MOVIE_GENRES : in_genre
    MOVIES ||--o{ CHARACTERS : has_characters
    PEOPLE ||--o{ CHARACTERS : plays
    MOVIES ||--|{ FILES : has_poster
    PEOPLE ||--|{ FILES : has_photos
    MOVIES ||--|{ COUNTRIES : made_in
    MOVIES ||--|{ PEOPLE : directed_by
    PEOPLE ||--|{ COUNTRIES : from_country

```