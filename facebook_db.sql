DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\connect facebook_db;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body TEXT,

);
CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES post(id)
);
INSERT INTO users (name, age)
VALUES ('deja', 35), ('jon', 26), ('maria', 21), ('alex', 16), ('socrates',3);
