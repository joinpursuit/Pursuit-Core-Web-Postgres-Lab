-- Database & Table Creation

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

-- Add and Manipulate Data
INSERT INTO users
VALUES ('Wil', 36),
    ('Karen', 21),
    ('Corey', 100),
    ('Jon', 26),
    ('Jhenya', 21);

INSERT INTO posts
VALUES (1,'AWESOME!'),
        (4,'Ok, Ok'),
        (1,'Love it!'),
        (3,'Clap your hands if you can hear my voice'),
        (2, 'SQL ROCKS JS SUCKS!!'),
        (1,'Cool Beans'),
        (5,'Bonjour');

INSERT INTO likes
VALUES (1,4),
    (1,5),
    (1,7),
    (2,4),
    (3,1),
    (3,2),
    (3,3),
    (1,6),
    (4,4),
    (4,5),
    (5,3),
    (3,4),
    (4,7),
    (5,1),
    (5,2),
    (5,4),
    (5,6);









