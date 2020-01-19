DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users (id),
    body TEXT
);

DROP TABLE IF EXISTS likes;

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id),
    post_id INT REFERENCES posts (id)
);



