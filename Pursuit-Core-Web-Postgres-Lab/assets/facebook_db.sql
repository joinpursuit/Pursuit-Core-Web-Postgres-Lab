--Database & Table Creation;

DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);
-- Add and Manipulate Data

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

INSERT INTO users (name, age)
    VALUES('Henry', 29),
          ('Ashya', 26),
          ('Charles', 44),
          ('Benjamin', 35),
          ('Alexander',67);

INSERT INTO posts (poster_id, body)
    VALUES(1, 'hello'),
          (1,'hey, again'),
          (1,'goodbye'),
          (2,'hello world'),
          (3, 'Good day mates'),
          (4,'Buenos Dias'),
          (5,'Hola');

INSERT INTO likes (liker_id, poster_id)
    VALUES(1, 4),(1,5),(1,6),(1,7),
          (2,4),
          (3,1),(3,2),(3,3),(3,4),
          (4,4),(4,5),(4,7),
          (5,1),(5,2),(5,3),(5,4),(5,5);

UPDATE users
SET age = 31
WHERE id = 5;

UPDATE users
SET name = 'Alfred'
WHERE id = 3;

-- UPDATE likes
-- S
