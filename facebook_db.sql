DROP DATABASE facebook;

CREATE DATABASE facebook; 

\c facebook;

--Create users table
CREATE TABLE users(
    id SERIAL PRIMARY KEY, 
    users_name VARCHAR,
    age INT
);
--Create posts table
CREATE TABLE posts(
    id SERIAL PRIMARY KEY, 
    poster_id INT REFERENCES users(id) ON DELETE SET NULL,
    body VARCHAR
);
--Create likes table
CREATE TABLE likes(
    id SERIAL PRIMARY KEY, 
    liker_id INT REFERENCES users(id) ON DELETE SET NULL,
    post_id INT REFERENCES posts(id) ON DELETE SET NULL
);

--Add 5 users
INSERT INTO users(users_name,age)
VALUES('Michelle',22),
    ('Daniel',25),
    ('Gabriel',22),
    ('Lauren ',24),
    ('Henry',23)
;

SELECT * FROM users;

--One user should have 3 posts
--At least 1 for the rest of the users

INSERT INTO posts(poster_id,body)
VALUES(1, 'Hello'),
    (1, 'I am hungry'),
    (1, 'What is your favorite song?'),
    (2, 'I am also hungry'),
    (3, 'Do you think dogs are better than cats?'),
    (4, ':)'),
    (5, 'I do not know what else to write');

SELECT * FROM posts;

--Likes from/for user 1-5
INSERT  INTO likes(liker_id,post_id)
VALUES(1,2),
    (1,3),
    (1,4),
    (1,5),
    (2,2),
    (3,2),
    (3,2),
    (4,2),
    (4,3),
    (4,5),
    (5,1),
    (5,2),
    (5,3);

SELECT * FROM likes;


--Update age of user id 5 to 31
UPDATE users 
SET age = 31
WHERE id=5;

SELECT * FROM users;

--uodate user '3' to Alfred
UPDATE users 
SET users_name = 'Alfred'
WHERE id = 3;

SELECT * FROM users;
-- --Delete user 1 from liking user 2 post
DELETE FROM likes WHERE liker_id =1 AND post_id =2;

SELECT * FROM likes;


--THE user who had 3 post DELETE his/her last post

DELETE FROM posts WHERE id = 3;
SELECT * FROM posts;

--user 2 decides to delete their account from social media 

DELETE FROM users WHERE id= 2;
SELECT * FROM users

--Find user who given the most likes


--Find the most like post 

--Find all the information of the user who posted the most liked post



