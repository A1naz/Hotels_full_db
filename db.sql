/* Создаем БД  postgre_cinema и подключаемся к ней */
CREATE DATABASE cinema_postgres;

\connect cinema_postgres

/* Создаем таблицу career  */
CREATE TABLE career(
    career_id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL
);

/* Создаем таблицу person  */
CREATE TABLE person(
    person_id SERIAL PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    career int REFERENCES career(career_id) NOT NULL,
    birth_date date,
    birth_place varchar(255),
    spouse varchar(255)
);

/* Создаем таблицу genre  */
CREATE TABLE genre(
    genre_id SERIAL PRIMARY KEY,
    genre_name varchar(255) NOT NULL
);

/* Создаем таблицу film  */
CREATE TABLE film(
    film_id SERIAL PRIMARY KEY,
    title varchar(255) NOT NULL,
    genre int REFERENCES genre(genre_id) NOT NULL,
    release_date int NOT NULL,
    country varchar(255) NOT NULL,
    slogan varchar(255) NOT NULL,
    director_id int REFERENCES person(person_id) NOT NULL,
    screenwriter int REFERENCES person(person_id) NOT NULL,
    artist_id int REFERENCES person(person_id) NOT NULL,
    producer_id int REFERENCES person(person_id) NOT NULL,
    painter_id int REFERENCES person(person_id) NOT NULL,
    composer_id int REFERENCES person(person_id) NOT NULL,
    editor_id int REFERENCES person(person_id) NOT NULL,
    budget int,
    marketing int,
    cash_usa int,
    cash_world int,
    premiere_russia varchar(255),
    premiere_world varchar(255),
    release_world varchar(255),
    age_rating int,
    age_rating_mpaa varchar(32),
    duration time
);

/* Создаем таблицу country  */
CREATE TABLE country(
    country_id SERIAL PRIMARY KEY,
    country varchar(170),
    inhabitants_quantity int
);

/* Создаем таблицу film_premiers, 
 в которой хранится информация о зрителях по странам
 */
CREATE TABLE film_premiers(
    premiere_id SERIAL PRIMARY KEY,
    film_id int REFERENCES film(film_id) NOT NULL,
    country_id int REFERENCES country(country_id) NOT NULL,
    premiere_date date NOT NULL,
    premiere_place varchar(255),
    viewers_quantity int
);