DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\connect facebook_db;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
);

CREATE TABLE posts(
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
INSERT INTO posts (name, body)
VALUES ('deja', 'hi'), ('jon','bye'),('jon', 'hi'), ('jon','bye'),('maria', 'yerrrr'), ('alex', 'meow'),('socrates', 'bloop')

