--Database & TABLE Creation

DROP DATABASE IF EXISTS facebook_data;
CREATE DATABASE facebook_data;

\c facebook_data;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS post;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body TEXT

);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);


-- Add and Manipulate Data

INSERT INTO users (name, age)
    VALUES  ('Cassidy', 23),
            ('Danielle', 98),
            ('Uduakabasi', 77),
            ('Nilber', 65),
            ('Sky', 55);


INSERT INTO posts (poster_id, body)
    VALUES  (2, 'Hey Boo!'),
            (2, 'Howdy ho!'),
            (2, 'Go Gina'),
            (1, 'Hello world'),
            (3, 'I like dat'),
            (4, 'Another one'),
            (5, 'One drop');

INSERT INTO likes (liker_id, post_id)
    VALUES  (1, 1),
            (1, 2),
            (1, 3),
            (1, 4),
            (1, 5),
            (1, 6),
            (1, 7),
            (2, 1),
            (2, 2),
            (2, 3),
            (3, 1),
            (3, 2),
            (3, 3),
            (3, 4),
            (4, 1),
            (4, 2),
            (4, 3),
            (4, 5),
            (4, 7),
            (5, 1),
            (5, 2),
            (5, 3),
            (5, 4),
            (5, 5);