-- Database & Table Creation

DROP DATABASE IF EXISTS facebook;

CREATE DATABASE facebook;

\c facebook;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body VARCHAR
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

-- table check
\dt;


-- Add and Manipulate Data

-- Add 5 users
INSERT INTO users(full_name, age)
    VALUES('Scrooge McDuck', 152), 
    ('Launchpad McQuack', 28),
    ('Donald Duck', 41),
    ('Drake Mallard', 31),
    ('Duke Baloney', 55);

SELECT *
FROM users;

-- One user should have three posts. Add at least one post for the rest of users.
INSERT INTO posts(body, poster_id)
    VALUES('BUYING NEW SHARKS FOR MY SCHEME I MEAN NOT SCHEME SCROOGE DON''T READ THIS!', 5),
    ('OH NO THE SHARKS GOT LOOSE!', 5),
    ('CURSE YOU SCROOGE MCDUCK!!!', 5),
    ('Huey, please come show me how the facebook works. Love, Scrooge', 1),
    ('Any crash you can walk away from, I always post!', 2),
    ('#@$%$#*&%$!!!!!!', 3),
    ('BREAKING: Mysterious masked man mashes miscrients!', 4);

SELECT *
FROM posts;

-- User with id = 1 likes all the other users posts.
INSERT INTO likes(liker_id, post_id)
    VALUES(1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7);

SELECT *
FROM likes;

-- User with id = 2 likes only his/her own post.
INSERT INTO likes(liker_id, post_id)
    VALUES(2, 5);

SELECT *
FROM likes;

-- User's 2 & 1 posts are liked by user 3
INSERT INTO likes(liker_id, post_id)
    VALUES(3, 4),
    (3, 5);

SELECT *
FROM likes;

-- User 4 likes all posts except her own and user's 1.
INSERT INTO likes(liker_id, post_id)
    VALUES(4, 1),
    (4, 2),
    (4, 3),
    (4, 5),
    (4, 6);

SELECT *
FROM likes;

-- All the posts of user's 1, 2, 3 are liked by user 5.
INSERT INTO likes(liker_id, post_id)
    VALUES(5, 4),
    (5, 5),
    (5, 6);

SELECT *
FROM likes;

-- Update the age of user with id 5 to be 31.
UPDATE users
SET age = 31
WHERE id = 5;

SELECT id, full_name, age
FROM users
WHERE full_name = 'Duke Baloney';

-- Update the name of user 3 to be Alfred
UPDATE users
SET full_name = 'Alfred Pennyworth'
WHERE id = 3;

SELECT id, full_name, age
FROM users
WHERE full_name = 'Alfred Pennyworth';

-- User 1 stops liking user's 2 post.
DELETE FROM likes
WHERE liker_id = 1
AND post_id = 5;

SELECT *
FROM likes;

-- The user who had three posts decides to delete his/her last post.
DELETE FROM likes
WHERE id = 13;

DELETE FROM likes
WHERE id = 3;

DELETE FROM posts
WHERE body = 'CURSE YOU SCROOGE MCDUCK!!!';

SELECT *
FROM posts;

-- User 2 decides to delete their account from of social media app.
DELETE FROM likes
WHERE id = 17;

DELETE FROM likes
WHERE id = 14;

DELETE FROM likes
WHERE id = 10;

DELETE FROM likes
WHERE id = 8;

DELETE FROM posts
WHERE id = 5;

DELETE FROM users
WHERE id = 2;

SELECT *
FROM users;

-- Find the user who has given the most likes.
SELECT liker_id, COUNT(liker_id)
FROM likes
GROUP BY liker_id
ORDER BY COUNT(liker_id) DESC
LIMIT 1;

-- Find the most liked post.
SELECT post_id, COUNT(post_id)
FROM likes
GROUP BY post_id
ORDER BY COUNT(post_id) DESC
LIMIT 1;

-- Find all the information of the user who posted the most liked post.
SELECT id, full_name, age
FROM users
WHERE id =
(SELECT liker_id
FROM likes
GROUP BY liker_id
ORDER BY COUNT(liker_id) DESC
LIMIT 1);

