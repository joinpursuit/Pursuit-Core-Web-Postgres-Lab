--Database & Table Creation
DROP DATABASE facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    fullname VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY, 
    poster_id INT UNIQUE REFERENCES users(id),
    body VARCHAR
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY, 
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

--Add and Manipulate Data

INSERT INTO users(fullname, age)
VALUES('Maliq Taylor', 23), ('Kadijah Wilson', 25), ('Michael Amparo', 24), ('Voniel Brown', 24), ('Giselle Sanchez', 24);