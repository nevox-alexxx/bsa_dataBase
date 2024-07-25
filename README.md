[![](https://mermaid.ink/img/pako:eNrFVttu4jAQ_ZXIz7SCtgTIW9VNd6teQPTysEKKhnggVpM4mjhss8C_10kokOBKrFpp85DEPuMzV4-9ZL7kyByG9EPAnCCaxJZ-nh_d8aO1rAbFI2JlCW6NbndTCyA_ALKyFCmGCA-RmaBUeWYshE8hjECEh9MJpOkfSXyHKBFhqiBKLJ8QFHIPlAnNEl5D19Wnel_f3Lmlq0c5OxMhmq2OtDpP5YkBesXcEDYKv8WT6ud--HLjHpsxJVS4Z6bCN2VxTH0SiRJyLxBxFiEJ35pmfI57BhVGWIQhQopeMaipRVpAaPGMoM5WWOTLLFaUe9qy69s6xAWhrySZsESmmraJfDlqV78ux5dXT8fXej31nwfuQ55kWI-NFcmFQJOLYPL9yx6O3OHozj3Su3_cr6X7UyF120iCvFEdU0EqaNTGB9ccY450dGEkJCLQUBJIJb-_BobPD0_j4zdPIwZfVf_TfRj_L91l0_DMFmzrdNTIhk4e1YAt3fXly3B88-R65mZUnBMmwgNNW8LqFFqtTk7kctOnHSuA1IMFKCCTUMOESnwGC0lCYVrrlZ8uEbsVpgW1qFUKypiktYSahUVcyZp495pRxVqkXHcFpLS2l03iSQj5oXeretSqJnrA1ZQqdpmRa7dTHCsCrnMWm8Q21M6moevCm-Ympft0M5KRt2kBRfZZi-mTR98DuL6blHU0YSpAXf3M0b8c6HXCJvFay0Gm5GMe-8xRlGGLkczmAXNmEKZ6VNX-5m6znUUudLO9r64-5Q2oxRKIf0sZfdDoIXOW7I05nbPOafu80-_aF-3uwO51Wyxnjn1x2um1z_t9-6w9sLvnvXWL_S3Xt0_7dlfP9s_s9mDQ7du99TtEDtmz?type=png)](https://mermaid.live/edit#pako:eNrFVttu4jAQ_ZXIz7SCtgTIW9VNd6teQPTysEKKhnggVpM4mjhss8C_10kokOBKrFpp85DEPuMzV4-9ZL7kyByG9EPAnCCaxJZ-nh_d8aO1rAbFI2JlCW6NbndTCyA_ALKyFCmGCA-RmaBUeWYshE8hjECEh9MJpOkfSXyHKBFhqiBKLJ8QFHIPlAnNEl5D19Wnel_f3Lmlq0c5OxMhmq2OtDpP5YkBesXcEDYKv8WT6ud--HLjHpsxJVS4Z6bCN2VxTH0SiRJyLxBxFiEJ35pmfI57BhVGWIQhQopeMaipRVpAaPGMoM5WWOTLLFaUe9qy69s6xAWhrySZsESmmraJfDlqV78ux5dXT8fXej31nwfuQ55kWI-NFcmFQJOLYPL9yx6O3OHozj3Su3_cr6X7UyF120iCvFEdU0EqaNTGB9ccY450dGEkJCLQUBJIJb-_BobPD0_j4zdPIwZfVf_TfRj_L91l0_DMFmzrdNTIhk4e1YAt3fXly3B88-R65mZUnBMmwgNNW8LqFFqtTk7kctOnHSuA1IMFKCCTUMOESnwGC0lCYVrrlZ8uEbsVpgW1qFUKypiktYSahUVcyZp495pRxVqkXHcFpLS2l03iSQj5oXeretSqJnrA1ZQqdpmRa7dTHCsCrnMWm8Q21M6moevCm-Ympft0M5KRt2kBRfZZi-mTR98DuL6blHU0YSpAXf3M0b8c6HXCJvFay0Gm5GMe-8xRlGGLkczmAXNmEKZ6VNX-5m6znUUudLO9r64-5Q2oxRKIf0sZfdDoIXOW7I05nbPOafu80-_aF-3uwO51Wyxnjn1x2um1z_t9-6w9sLvnvXWL_S3Xt0_7dlfP9s_s9mDQ7du99TtEDtmz)

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