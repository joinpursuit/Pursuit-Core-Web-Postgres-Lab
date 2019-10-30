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
   owner_id INT REFERENCES users (id),
   body TEXT
);

CREATE TABLE likes (
   like_id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES users (id),
   target_id INT REFERENCES posts (post_id)
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
