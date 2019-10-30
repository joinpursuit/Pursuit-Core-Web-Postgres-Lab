/*
Joseph P. Pasaoa
Postgres Lab
*/


-- Database & Table Creation
DROP DATABASE IF EXISTS kertal;
CREATE DATABASE kertal;
\c kertal

CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   name VARCHAR(36),
   age INT
);

CREATE TABLE posts (
   post_id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES users (id) ON DELETE CASCADE,
   body TEXT
);

CREATE TABLE likes (
   like_id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES users (id) ON DELETE CASCADE,
   target_id INT REFERENCES posts (post_id) ON DELETE CASCADE
);


-- Add & Manipulate Data
INSERT INTO users (name, age) VALUES
   ('Rook White', 31),
   ('King Black', 44),
   ('Knight Black', 27),
   ('Queen Black', 46),
   ('Bishop Black', 38);

INSERT INTO posts (owner_id, body) VALUES
   (4, 'Are we gaming against White today? Or is that tomorrow?'),
   (2, $hit1$I have been obsessed with stripes lately. Can't stand checks.$hit1$),
   (1, 'I THINK I joined the WRONG group'),
   (3, $token2$guys, i'm boxed in$token2$),
   (3, 'can''t. breathe.'),
   (3, 'no i don''t have any forks right now'),
   (5, 'Has someone seen Knight?');

INSERT INTO likes (owner_id, target_id) VALUES
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
WHERE id = 5;

UPDATE users
SET name = 'Alfred'
WHERE id = 3;

DELETE FROM likes
WHERE target_id = 2;

DELETE FROM posts
WHERE post_id = 6;

DELETE FROM users
WHERE id = 2;


-- Data Queries
SELECT DISTINCT name
   , COUNT(*) AS likes_tally
FROM likes
JOIN users ON (owner_id = id)
GROUP BY users.name
ORDER BY likes_tally DESC LIMIT 1;

SELECT DISTINCT body
   , COUNT(*) AS likes_tally
FROM posts
JOIN likes ON (post_id = target_id)
GROUP BY body
ORDER BY likes_tally DESC LIMIT 2;
   -- two-way tie for most-liked post by same user

SELECT *
FROM users
JOIN posts ON (id = posts.owner_id)
JOIN likes ON (id = likes.owner_id)
WHERE 3 IN (
      posts.owner_id
      , likes.owner_id
      )
ORDER BY post_id ASC;
