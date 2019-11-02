-- Database & Table Creation
DROP DATABASE IF EXISTS facebook;

CREATE DATABASE facebook;
\c facebook


--NOT NULL makes this column required to make the table
CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE CASCADE,
    body TEXT
);

CREATE TABLE likes
(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

--ADD and Manipulate Data


-- Add 5 users
INSERT INTO users
    (name, age)
VALUES
    ('Paula', 56),
    ('Ernest', 60),
    ('Damari', 26),
    ('Paxton', 52),
    ('Jovanni', 31);

-- One user should have three posts. 
-- Add at least one post for the rest of users. 
INSERT INTO posts
    (poster_id, body)
VALUES
    (1, 'This is post 1 by Paula'),
    (1, 'This is post 2 by Paula'),
    (1, 'This is post 3 by Paula'),
    (2, 'This is post 4 by Ernest'),
    (3, 'This is post 5 by Damari/Alfred'),
    (4, 'This is post 6 by Paxton'),
    (5, 'This is post 7 by Jovanni');

-- User with `id = 1` likes all the other users posts.
-- User with `id = 2` likes only his/her own post.
-- User's `2` & `1` posts are liked by user `3` 
-- User `4` likes all posts except her own and user's `1`.
-- All the posts of user's `1`, `2`, `3` are liked by user `5`.
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

-- Update the age of user with `id` 5 to be `31`.
UPDATE users
SET age = 31
WHERE id = 5;

-- Update the name of user `3` to be `Alfred`
UPDATE users
SET name = 'Alfred'
WHERE id = 3;

-- User `1` stops liking user's `2` post.
DELETE FROM likes
WHERE liker_id = 1 AND post_id = 
(SELECT id
    FROM posts
    WHERE poster_id = 2);


-- The user who had three posts decides to delete his/her last post.
DELETE FROM posts WHERE poster_id = 1;

-- Find the user who has given the most likes.
DELETE FROM users WHERE id = 2;

SELECT *
FROM users;

SELECT *
FROM posts;

SELECT *
FROM likes;

-- Find the user who has given the most likes.
SELECT id
from users
WHERE id = (SELECT liker_id
FROM likes
GROUP BY liker_id
ORDER BY COUNT(liker_id) DESC
LIMIT 1);

-- \echo Briahana this allows you to name the tabl;e
-- Find the most liked post.
SELECT id, body
FROM posts WHERE id =
(SELECT post_id
FROM likes
GROUP BY post_id
ORDER BY COUNT(post_id) DESC
LIMIT 1);
   
-- Find all the information of the user 
-- who posted the most liked post.
SELECT *
FROM users
WHERE id =
(SELECT poster_id
FROM posts
WHERE id = 
(SELECT post_id
FROM likes
GROUP BY post_id
ORDER BY COUNT(post_id) DESC
LIMIT 1));

--  Find all the information of the user 
-- who posted the most liked post.
SELECT * FROM users
JOIN posts ON users.id = posts.poster_id WHERE posts.id = (
    SELECT posts.id 
    FROM posts
    JOIN likes ON posts.id = likes.post_id GROUP BY(posts.id)
    ORDER BY COUNT(posts.body) DESC LIMIT 1
);