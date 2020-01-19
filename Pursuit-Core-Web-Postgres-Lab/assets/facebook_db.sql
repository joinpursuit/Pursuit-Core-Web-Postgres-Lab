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

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE CASCADE,
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

-- Add and Manipulate Data

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

INSERT INTO likes (liker_id, post_id)
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

-- SELECT *
-- FROM likes
-- INNER JOIN posts
-- ON posts.id = likes.post_id
-- WHERE post_id = 4 AND liker_id = 1;

DELETE FROM likes
WHERE liker_id = 1 AND post_id = 2;

DELETE FROM posts 
WHERE poster_id = 1 AND id = 3;

DELETE FROM users
WHERE id = 2;

