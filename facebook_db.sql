/*
Joseph P. Pasaoa
Postgres Lab
*/


-- -- --
-- V1

-- Database & Table Creation
DROP DATABASE IF EXISTS kertal;
CREATE DATABASE kertal;
\c kertal

CREATE TABLE users (
   user_id SERIAL PRIMARY KEY,
   name VARCHAR(36),
   age INT
);

CREATE TABLE posts (
   post_id SERIAL PRIMARY KEY,
   poster_id INT REFERENCES users (user_id) ON DELETE CASCADE,
   body TEXT
);

CREATE TABLE likes (
   like_id SERIAL PRIMARY KEY,
   liker_id INT REFERENCES users (user_id) ON DELETE CASCADE,
   liked_post_id INT REFERENCES posts (post_id) ON DELETE CASCADE
);


-- Add & Manipulate Data
INSERT INTO users (name, age) VALUES
   ('Rook White', 31),
   ('King Black', 44),
   ('Knight Black', 27),
   ('Queen Black', 46),
   ('Bishop Black', 38);

INSERT INTO posts (poster_id, body) VALUES
   (4, 'Are we gaming against White today? Or is that tomorrow?'),
   (2, $hit1$I have been obsessed with stripes lately. Can't stand checks.$hit1$),
   (1, 'I THINK I joined the WRONG group'),
   (3, $token2$guys, i'm boxed in$token2$),
   (3, 'can''t. breathe.'),
   (3, 'no i don''t have any forks right now'),
   (5, 'Has someone seen Knight?');

INSERT INTO likes (liker_id, liked_post_id) VALUES
   (1, 2),
   (1, 4),
   (1, 5),
   (1, 6),
   (1, 1),
   (1, 7),
   (2, 2),
   (3, 3),
   (3, 2),
   (4, 2),
   (4, 4),
   (4, 5),
   (4, 6),
   (4, 7),
   (5, 3),
   (5, 2),
   (5, 4),
   (5, 5),
   (5, 6);

UPDATE users
SET age = 31
WHERE user_id = 5;

UPDATE users
SET name = 'Alfred'
WHERE user_id = 3;

DELETE FROM likes
WHERE liked_post_id = 2;

DELETE FROM posts
WHERE post_id = 6;

DELETE FROM users
WHERE user_id = 2;


-- Data Queries
SELECT DISTINCT name
   , COUNT(*) AS likes_tally
FROM likes
JOIN users ON (liker_id = user_id)
GROUP BY name
ORDER BY likes_tally DESC LIMIT 1;

SELECT DISTINCT body
   , COUNT(*) AS likes_tally
FROM posts
JOIN likes ON (post_id = liked_post_id)
GROUP BY body
ORDER BY likes_tally DESC LIMIT 2;
   -- two-way tie for most-liked post by same user

SELECT *
FROM users
JOIN posts ON (user_id = poster_id)
JOIN likes ON (user_id = liker_id)
WHERE 3 IN (
      poster_id
      , liker_id
      )
ORDER BY post_id ASC;


-- -- --
-- V2 bonus

CREATE TABLE comments (
   comment_id SERIAL PRIMARY KEY,
   commenter_id INT REFERENCES users (user_id) ON DELETE CASCADE,
   commented_post_id INT REFERENCES posts (post_id) ON DELETE CASCADE,
   body TEXT
);

CREATE TABLE albums (
   album_id SERIAL PRIMARY KEY,
   album_owner_id INT REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE pictures (
   picture_id SERIAL PRIMARY KEY,
   containing_album_id INT REFERENCES albums (album_id),
   url VARCHAR
);
