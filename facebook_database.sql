DROP DATABASE IF EXISTS facebook_database;
CREATE DATABASE facebook_database;

\c facebook_database;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS posts;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE SET NULL,
    body TEXT
);



CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE SET NULL,
    post_id INT REFERENCES posts(id) ON DELETE SET NULL
);
-- Add and Manipulate Data

INSERT INTO users (name,age)
         VALUES('david',30),--1
                ('danny',29),--2
                ('dkong',25),--3
                ('damitri',92),--4
                ('dane',42);--5


INSERT into posts (body,poster_id) 
         VALUES('i like this!',2),--1
                ('NO!',2),--2
                ('HA!',2),--3
                ('WOW ARE YOU SERIOUS!',1),--4
                ('HEY!',3),--5
                ('hey im number 4!',4),--6
                ('i like this to!',4),--7
                ('hey im number 5!',5);--8

INSERT into likes (post_id,liker_id)
                VALUES(1,1),
                      (2,1),
                      (3,1),
                      (4,1),
                      (5,1),
                      (6,1),
                      (7,1),
                      (1,2),
                      (2,2),
                      (3,2),
                      (1,4),
                      (2,4),
                      (3,4),
                      (5,4),
                      (7,4),
                      (1,5),
                      (2,5),
                      (3,5),
                      (4,5),
                      (5,5);

UPDATE users
SET age = 31
WHERE id = 5;

UPDATE users
SET name = 'Alfred'
WHERE id = 3;

DELETE FROM likes
WHERE id IN (1,2,3) AND liker_id=1;

DELETE FROM posts WHERE id=3 AND poster_id =2;

-- DELETE FROM users WHERE id =2;

-- SELECT name, COUNT(liker_id) 
-- AS given_like FROM likes 
-- JOIN users ON liker_id=users.id 
-- GROUP BY name 
-- ORDER BY given_like DESC LIMIT 1;

-- SELECT body, MAX(liker_id) AS most_like 
-- FROM posts JOIN Likes ON posts.id=likes.post_id 
-- GROUP BY body ORDER BY most_like DESC LIMIT 4

-- SELECT * FROM users 
-- JOIN posts ON users.id=posts.poster_id 
-- JOIN likes ON posts.id=likes.post_id


