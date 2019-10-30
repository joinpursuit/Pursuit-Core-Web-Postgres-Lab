-- Database & Table Creation
DROP DATABASE facebook;

CREATE DATABASE facebook;
\c facebook



CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body VARCHAR
);

CREATE TABLE likes
(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

--ADD and Manipulate Data
INSERT INTO users
    (name, age)
VALUES
    ('user1', 18),
    ('user2', 21),
    ('user3', 25),
    ('user4', 30),
    ('user5', 50);

INSERT INTO posts
    (poster_id, body)
VALUES
    (1, 'Does'),
    (1, 'This'),
    (1, 'Work?'),
    (2, 'testing'),
    (3, 'testing'),
    (4, '123'),
    (5, '!!!');

INSERT INTO likes
    (liker_id, post_id)
VALUES
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (2, 4),
    (3, 4),
    (3, 1),
    (3, 2),
    (3, 3),
    (4, 4),
    (4, 5),
    (4, 7),
    (5, 1),
    (5, 2),
    (5, 3),
    (5, 4),
    (5, 5);

UPDATE users
SET age = 31
WHERE id = 5;

UPDATE users
SET name = 'Alfred'
WHERE id = 3;

DELETE FROM likes
WHERE liker_id = 1 AND post_id = 
(SELECT id
FROM posts
WHERE poster_id = 2);


SELECT *
FROM users;

SELECT *
FROM posts;

SELECT *
FROM likes;