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
    poster_id INT REFERENCES users (id) ON DELETE CASCADE,
    body TEXT
);

DROP TABLE IF EXISTS likes;

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id) ON DELETE CASCADE,
    post_id INT REFERENCES posts (id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    commenter_id INT REFERENCES users (id) ON DELETE CASCADE,
    post_id INT REFERENCES posts (id) ON DELETE CASCADE,
    body TEXT
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    album_id INT REFERENCES users (id) ON DELETE CASCADE,
    url TEXT 
);



-- Add Data
INSERT INTO users(name, age)
VALUES ('Wil', 36),
    ('Karen', 21),
    ('Corey', 100),
    ('Jon', 26),
    ('Jhenya', 21);

INSERT INTO posts(poster_id, body)
VALUES (1,'AWESOME!'),
        (1,'Love it!'),
        (1,'Cool Beans'),
        (2, 'SQL ROCKS JS SUCKS!!'),
        (3,'Clap your hands if you can hear my voice'),
        (4,'Ok, Ok'),
        (5,'Bonjour');

INSERT INTO likes(liker_id, post_id)
VALUES (1,4),
    (1,5),
    (1,6),
    (1,7),
    (2,4),
    (3,1),
    (3,2),
    (3,3),
    (3,4),
    (4,4),
    (4,5),
    (4,7),
    (5,1),
    (5,2),
    (5,3),
    (5,4),
    (5,5),
    (5,6);

-- Manipulate Data
-- 1. 
-- UPDATE users 
-- SET age = 31
-- WHERE id = 5
-- 2.
-- UPDATE users 
-- SET name = 'Alfred'
-- WHERE id = 4
--3.
-- DELETE FROM likes
-- WHERE id = 3
--4.
-- DELETE FROM posts
-- WHERE id = 6 AND poster_id = 1;
--5.
-- DELETE FROM users
-- WHERE id = 2;
-- 6
-- SELECT name, COUNT(post_id) AS Most_likes
-- FROM users
-- INNER JOIN likes
-- ON users.id = likes.liker_id
-- GROUP BY name
-- ORDER BY most_likes DESC
-- LIMIT 1
-- 7
-- SELECT body, COUNT(post_id) AS Most_likes
-- FROM posts
-- INNER JOIN likes
-- ON posts.id = likes.post_id
-- GROUP BY body
-- ORDER BY most_likes DESC
-- LIMIT 1
-- 8
-- SELECT * FROM users
-- JOIN
-- (SELECT COUNT(liker_id), liker_id FROM likes
-- GROUP BY liker_id
-- ORDER BY COUNT DESC
-- LIMIT 1) AS likes_table ON likes_table.liker_id = users.id;













