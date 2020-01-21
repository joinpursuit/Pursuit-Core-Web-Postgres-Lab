-- Database & Table Creation
DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

DROP TABLE IF EXIsTS users;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS posts;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id)ON DELETE CASCADE,
    body Text 
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE,

);

-- Add and Manipulate Data

INSERT INTO users (name, age)
    VALUES ('callie',70),
           ('jon', 20),
           ('jane', 22), 
           ('babene', 62), 
           ('peter', 32);

  INSERT INTO posts (poster_id,body)
    VALUES (1,'hey'),
           (1, 'tgif'),
           (1, 'yolo'), 
           (5, 'gtf'), 
           (4, 'wtf'),
           (3, 'wtf'),
           (2, 'wtf'), 
           (2, 'wtf');

INSERT INTO likes (liker_id,post_id)
    VALUES (1,4),
           (1,5),
           (1,6),
           (1,7),
           (1,8),
           (2,7),
           (2,8),
           (3,1),
           (3,2),
           (3,3),
           (3,7),
           (3,8),
           (4,4),
           (4,6),
           (4,7),
           (4,8),
           (5,1),
           (5,2),
           (5,3),
           (5,6),
           (5,7),
          (5,8);

UPDATE users
SET name = 'alfred'
WHERE id = 5;



DELETE FROM likes
WHERE likes.post_id IN (
SELECT post_id FROM likes a
INNER JOIN	posts b
ON a.post_id = b.id
WHERE a.liker_id = 1 AND b.poster_id = 2);


-- -The user who had three posts decides to delete his/her last post.

DELETE FROM posts
WHERE id = 3;

DELETE FROM users
WHERE id = 2;


-- 2
-- 3
-- 4
-- DELETE T1, T2
-- FROM T1
-- INNER JOIN T2 ON T1.key = T2.key
-- WHERE condition;





